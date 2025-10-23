import 'package:flutter/material.dart';

import '../../domain/model/issue_map.dart';
import '../../domain/model/issue_map_request.dart';
import '../../domain/model/keyword_entry.dart';
import '../../domain/model/news_document.dart';
import '../../domain/model/news_search_request.dart';
import '../../domain/model/news_search_result.dart';
import '../../domain/model/today_keyword.dart';
import '../../domain/usecase/fetch_issue_map_use_case.dart';
import '../../domain/usecase/fetch_news_search_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';

/// 이슈맵 페이지의 상태를 관리하는 컨트롤러
class IssueMapController extends ChangeNotifier {
  IssueMapController({
    required FetchTodayKeywordUseCase fetchTodayKeywordUseCase,
    required FetchIssueMapUseCase fetchIssueMapUseCase,
    required FetchNewsSearchUseCase fetchNewsSearchUseCase,
  })  : _fetchTodayKeywordUseCase = fetchTodayKeywordUseCase,
        _fetchIssueMapUseCase = fetchIssueMapUseCase,
        _fetchNewsSearchUseCase = fetchNewsSearchUseCase;

  final FetchTodayKeywordUseCase _fetchTodayKeywordUseCase;
  final FetchIssueMapUseCase _fetchIssueMapUseCase;
  final FetchNewsSearchUseCase _fetchNewsSearchUseCase;

  // 상태 변수들
  bool _isLoadingKeywords = false;
  bool _isLoadingIssueMap = false;
  bool _isLoadingNewsSearch = false;
  bool _isNewsExpanded = false;
  
  TodayKeyword? _todayKeyword;
  IssueMap? _issueMap;
  NewsSearchResult? _newsSearchResult;
  String? _selectedKeyword;
  String? _searchedNodeName;
  String? _errorMessage;
  
  // 뉴스 더보기 상수
  static const int _initialNewsCount = 5;

  // Getters
  bool get isLoadingKeywords => _isLoadingKeywords;
  bool get isLoadingIssueMap => _isLoadingIssueMap;
  bool get isLoadingNewsSearch => _isLoadingNewsSearch;
  bool get hasError => _errorMessage != null;
  bool get isNewsExpanded => _isNewsExpanded;
  
  TodayKeyword? get todayKeyword => _todayKeyword;
  IssueMap? get issueMap => _issueMap;
  NewsSearchResult? get newsSearchResult => _newsSearchResult;
  String? get selectedKeyword => _selectedKeyword;
  String? get searchedNodeName => _searchedNodeName;
  String? get errorMessage => _errorMessage;
  
  List<KeywordEntry> get keywords => _todayKeyword?.keywords ?? [];
  
  /// 뉴스 검색에 사용된 키워드 (노드 이름 또는 선택된 키워드)
  String get newsSearchKeyword => _searchedNodeName ?? _selectedKeyword ?? '';

  /// 표시할 뉴스 목록 (더보기 기능 적용)
  List<NewsDocument> get displayedNews {
    final List<NewsDocument> allNews = _newsSearchResult?.documents ?? [];
    if (_isNewsExpanded || allNews.length <= _initialNewsCount) {
      return allNews;
    }
    return allNews.take(_initialNewsCount).toList();
  }

  /// 더 많은 뉴스가 있는지 여부
  bool get hasMoreNews {
    final int totalNews = _newsSearchResult?.documents.length ?? 0;
    return totalNews > _initialNewsCount;
  }

  /// 초기 데이터 로딩
  Future<void> initialize() async {
    await loadTodayKeywords(shouldForceRefresh: false);
  }

  /// 오늘의 키워드 데이터 로딩
  Future<void> loadTodayKeywords({required bool shouldForceRefresh}) async {
    _isLoadingKeywords = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _todayKeyword = await _fetchTodayKeywordUseCase.execute(
        FetchTodayKeywordParams(shouldForceRefresh: shouldForceRefresh),
      );
      final List<KeywordEntry> fetchedKeywords =
          _todayKeyword?.keywords ?? <KeywordEntry>[];
      final String? previousKeyword = _selectedKeyword;
      final bool hasPreviousKeyword = previousKeyword != null &&
          fetchedKeywords.any(
            (KeywordEntry keyword) => keyword.keywordName == previousKeyword,
          );
      final String? targetKeyword = hasPreviousKeyword
          ? previousKeyword
          : (fetchedKeywords.isNotEmpty
              ? fetchedKeywords.first.keywordName
              : null);
      _isLoadingKeywords = false;
      notifyListeners();

      if (targetKeyword != null) {
        await selectKeyword(
          targetKeyword,
          shouldForceReload: shouldForceRefresh || !hasPreviousKeyword,
        );
      } else {
        _selectedKeyword = null;
        _issueMap = null;
        _newsSearchResult = null;
      }
    } catch (error) {
      _errorMessage = '키워드 데이터를 불러오는 중 오류가 발생했습니다: $error';
      _isLoadingKeywords = false;
      notifyListeners();
    }
  }

  /// 키워드 선택 및 관련 데이터 로딩
  Future<void> selectKeyword(
    String keyword, {
    bool shouldForceReload = false,
  }) async {
    final bool isSameKeyword = _selectedKeyword == keyword;
    if (isSameKeyword && !shouldForceReload) {
      return;
    }

    _selectedKeyword = keyword;
    if (!isSameKeyword) {
      _searchedNodeName = null; // 키워드 변경 시 노드 검색 상태 초기화
      _isNewsExpanded = false; // 키워드 변경 시 뉴스 접기 상태 초기화
    }
    _errorMessage = null;
    notifyListeners();

    // 이슈맵과 뉴스 검색을 병렬로 실행
    await Future.wait([
      _loadIssueMap(keyword),
      _loadNewsSearch(keyword),
    ]);
  }

  /// 이슈맵 데이터 로딩
  Future<void> _loadIssueMap(String keyword) async {
    _isLoadingIssueMap = true;
    _issueMap = null;
    notifyListeners();

    try {
      final IssueMapRequest request = IssueMapRequest(keyword: keyword);
      _issueMap = await _fetchIssueMapUseCase.execute(request);
    } catch (error) {
      _errorMessage = '이슈맵 데이터를 불러오는 중 오류가 발생했습니다: $error';
    } finally {
      _isLoadingIssueMap = false;
      notifyListeners();
    }
  }

  /// 뉴스 검색 데이터 로딩
  Future<void> _loadNewsSearch(String keyword) async {
    _isLoadingNewsSearch = true;
    _newsSearchResult = null;
    notifyListeners();

    try {
      final DateTime now = DateTime.now();
      final String today = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
      final NewsSearchRequest request = NewsSearchRequest(keyword: keyword, date: today);
      _newsSearchResult = await _fetchNewsSearchUseCase.execute(request);
    } catch (error) {
      _errorMessage = '뉴스 검색 데이터를 불러오는 중 오류가 발생했습니다: $error';
    } finally {
      _isLoadingNewsSearch = false;
      notifyListeners();
    }
  }

  /// 에러 메시지 초기화
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// 데이터 새로고침
  Future<void> refresh() async {
    await loadTodayKeywords(shouldForceRefresh: true);
  }
  
  /// 노드 클릭 시 해당 노드 이름으로 뉴스 검색
  Future<void> searchNewsByNodeName(String nodeName) async {
    _searchedNodeName = nodeName;
    _isNewsExpanded = false; // 새 검색 시 접기 상태 초기화
    notifyListeners();
    await _loadNewsSearch(nodeName);
  }

  /// 뉴스 더보기/접기 토글
  void toggleNewsExpanded() {
    _isNewsExpanded = !_isNewsExpanded;
    notifyListeners();
  }
}
