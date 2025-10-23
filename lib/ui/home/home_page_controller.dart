import 'package:flutter/material.dart';

import '../../domain/model/issue_map.dart';
import '../../domain/model/issue_map_request.dart';
import '../../domain/model/keyword_entry.dart';
import '../../domain/model/today_keyword.dart';
import '../../domain/usecase/fetch_issue_map_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';

/// 홈페이지 상태 관리를 위한 컨트롤러
class HomePageController extends ChangeNotifier {
  HomePageController({
    required FetchTodayKeywordUseCase fetchTodayKeywordUseCase,
    required FetchIssueMapUseCase fetchIssueMapUseCase,
  }) : _fetchTodayKeywordUseCase = fetchTodayKeywordUseCase,
       _fetchIssueMapUseCase = fetchIssueMapUseCase,
       _todayKeyword = null,
       _errorMessage = null,
       _isLoading = false,
       _isExpanded = false,
       _issueMapPreview = null,
       _issueMapErrorMessage = null,
       _isIssueMapLoading = false;

  static const String _unexpectedErrorMessage = 'Unexpected error occurred.';

  final FetchTodayKeywordUseCase _fetchTodayKeywordUseCase;
  final FetchIssueMapUseCase _fetchIssueMapUseCase;

  TodayKeyword? _todayKeyword;
  String? _errorMessage;
  bool _isLoading;
  bool _isExpanded;
  IssueMap? _issueMapPreview;
  String? _issueMapErrorMessage;
  bool _isIssueMapLoading;

  /// 오늘의 키워드 데이터
  TodayKeyword? get todayKeyword => _todayKeyword;

  /// 에러 메시지
  String? get errorMessage => _errorMessage;

  /// 로딩 상태
  bool get isLoading => _isLoading;

  /// 에러 발생 여부
  bool get hasError => _errorMessage != null && _errorMessage!.isNotEmpty;

  /// 확장/축소 상태
  bool get isExpanded => _isExpanded;

  /// 이슈맵 미리보기 데이터 로딩 상태
  bool get isIssueMapPreviewLoading => _isIssueMapLoading;

  /// 이슈맵 미리보기 데이터
  IssueMap? get issueMapPreview => _issueMapPreview;

  /// 이슈맵 에러 메시지
  String? get issueMapErrorMessage => _issueMapErrorMessage;

  /// 오늘의 키워드 데이터 로드
  Future<void> loadTodayKeyword() async {
    _setLoadingState();
    try {
      final TodayKeyword fetchedTodayKeyword = await _fetchTodayKeywordUseCase
          .execute(const FetchTodayKeywordParams(shouldForceRefresh: true));
      _setSuccessState(fetchedTodayKeyword);
      await _loadIssueMapPreview();
    } on Exception catch (exception) {
      _setErrorState(exception.toString());
    }
  }

  /// 확장/축소 토글
  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  /// 로딩 상태 설정
  void _setLoadingState() {
    _isLoading = true;
    _errorMessage = null;
    _todayKeyword = null;
    _resetIssueMapPreview();
    notifyListeners();
  }

  /// 성공 상태 설정
  void _setSuccessState(TodayKeyword todayKeyword) {
    _isLoading = false;
    _errorMessage = null;
    _todayKeyword = todayKeyword;
    notifyListeners();
  }

  /// 에러 상태 설정
  void _setErrorState(String? message) {
    _isLoading = false;
    final bool isMessageMissing = message == null || message.isEmpty;
    _errorMessage = isMessageMissing ? _unexpectedErrorMessage : message;
    _todayKeyword = null;
    _resetIssueMapPreview();
    notifyListeners();
  }

  Future<void> _loadIssueMapPreview() async {
    final List<KeywordEntry> keywords = _todayKeyword?.keywords ?? <KeywordEntry>[];
    if (keywords.isEmpty) {
      _resetIssueMapPreview();
      return;
    }
    _isIssueMapLoading = true;
    _issueMapErrorMessage = null;
    _issueMapPreview = null;
    notifyListeners();
    final String keywordName = keywords.first.keywordName;
    try {
      final IssueMap issueMap = await _fetchIssueMapUseCase.execute(
        IssueMapRequest(keyword: keywordName),
      );
      _issueMapPreview = issueMap;
    } on Object catch (error) {
      _issueMapErrorMessage = '이슈맵 데이터를 불러오지 못했습니다.';
      _issueMapPreview = null;
    } finally {
      _isIssueMapLoading = false;
      notifyListeners();
    }
  }

  void _resetIssueMapPreview() {
    _issueMapPreview = null;
    _issueMapErrorMessage = null;
    _isIssueMapLoading = false;
  }
}
