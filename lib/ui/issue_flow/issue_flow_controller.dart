import 'package:flutter/material.dart';

import '../../domain/exception/no_more_issue_flow_data_exception.dart';
import '../../domain/model/issue_flow_request.dart';
import '../../domain/model/issue_flow_response.dart';
import '../../domain/model/news_document.dart';
import '../../domain/model/news_search_request.dart';
import '../../domain/model/news_search_result.dart';
import '../../domain/model/today_keyword.dart';
import '../../domain/usecase/fetch_issue_flow_use_case.dart';
import '../../domain/usecase/fetch_news_search_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';

/// 이슈 흐름 페이지 상태 관리를 위한 컨트롤러
class IssueFlowController extends ChangeNotifier {
  IssueFlowController({
    required FetchTodayKeywordUseCase fetchTodayKeywordUseCase,
    required FetchIssueFlowUseCase fetchIssueFlowUseCase,
    required FetchNewsSearchUseCase fetchNewsSearchUseCase,
    required TickerProvider tickerProvider,
  }) : _fetchTodayKeywordUseCase = fetchTodayKeywordUseCase,
       _fetchIssueFlowUseCase = fetchIssueFlowUseCase,
       _fetchNewsSearchUseCase = fetchNewsSearchUseCase,
       _todayKeyword = null,
       _errorMessage = null,
       _isLoading = false,
       _isExpanded = true,
       _selectedInterval = 'day',
       _selectedKeyword = null,
       _issueFlowData = null,
       _isLoadingChart = false,
       _selectedDate = null,
       _newsSearchResult = null,
       _isLoadingNews = false,
       _isNewsExpanded = false,
       _currentOffset = 0,
       _hasMorePreviousData = true {
    searchController.addListener(_onSearchTextChanged);
    _tabController = TabController(
      length: 3,
      vsync: tickerProvider,
      initialIndex: 2,
    );
    _tabController.addListener(_onTabChanged);
  }

  static const String _unexpectedErrorMessage = 'Unexpected error occurred.';
  static const String _noMoreDataMessage = '더 이상 조회된 데이터가 없습니다.';
  static const List<String> _intervals = ['year', 'month', 'day'];

  final FetchTodayKeywordUseCase _fetchTodayKeywordUseCase;
  final FetchIssueFlowUseCase _fetchIssueFlowUseCase;
  final FetchNewsSearchUseCase _fetchNewsSearchUseCase;

  /// 검색 텍스트 컨트롤러
  final TextEditingController searchController = TextEditingController();

  /// 검색 필드 포커스 노드
  final FocusNode searchFocusNode = FocusNode();

  /// 탭 컨트롤러
  late final TabController _tabController;
  TabController get tabController => _tabController;

  TodayKeyword? _todayKeyword;
  String? _errorMessage;
  bool _isLoading;
  bool _isExpanded;
  String _selectedInterval;
  String? _selectedKeyword;
  IssueFlowResponse? _issueFlowData;
  bool _isLoadingChart;
  String? _selectedDate;
  NewsSearchResult? _newsSearchResult;
  bool _isLoadingNews;
  bool _isNewsExpanded;
  int _currentOffset;
  bool _hasMorePreviousData;

  /// 검색어 입력 여부
  bool _hasSearchText = false;
  bool get hasSearchText => _hasSearchText;

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

  /// 선택된 간격 (year, month, day)
  String get selectedInterval => _selectedInterval;

  /// 선택된 키워드
  String? get selectedKeyword => _selectedKeyword;

  /// 이슈 플로우 데이터
  IssueFlowResponse? get issueFlowData => _issueFlowData;

  /// 차트 로딩 상태
  bool get isLoadingChart => _isLoadingChart;

  /// 선택된 날짜
  String? get selectedDate => _selectedDate;

  /// 뉴스 검색 결과
  NewsSearchResult? get newsSearchResult => _newsSearchResult;

  /// 뉴스 로딩 상태
  bool get isLoadingNews => _isLoadingNews;

  /// 뉴스 확장 상태
  bool get isNewsExpanded => _isNewsExpanded;

  /// 표시할 뉴스 리스트 (4개 또는 전체)
  List<NewsDocument> get displayedNews => _isNewsExpanded
      ? (_newsSearchResult?.documents ?? [])
      : (_newsSearchResult?.documents.take(4).toList() ?? []);

  /// 더보기 버튼 표시 여부
  bool get hasMoreNews => (_newsSearchResult?.documents.length ?? 0) > 4;

  /// 현재 offset 값
  int get currentOffset => _currentOffset;

  /// 이전 데이터로 이동 가능 여부
  bool get canNavigateToPrevious => _hasMorePreviousData && !_isLoadingChart;
  bool get canNavigateToNext => _currentOffset > 0 && !_isLoadingChart;

  @override
  void dispose() {
    searchController.removeListener(_onSearchTextChanged);
    searchController.dispose();
    searchFocusNode.dispose();
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  /// 검색어 텍스트 변경 감지
  void _onSearchTextChanged() {
    final bool hasText = searchController.text.trim().isNotEmpty;
    if (_hasSearchText != hasText) {
      _hasSearchText = hasText;
      notifyListeners();
    }
  }

  /// 탭 변경 감지
  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      return;
    }
    final String newInterval = _intervals[_tabController.index];
    if (_selectedInterval != newInterval) {
      _selectedInterval = newInterval;
      // 탭 변경 시 offset 리셋
      _currentOffset = 0;
      _hasMorePreviousData = true;
      notifyListeners();
      if (_selectedKeyword != null) {
        fetchIssueFlow();
      }
    }
  }

  /// 오늘의 키워드 데이터 로드
  Future<void> loadTodayKeyword({required bool shouldForceRefresh}) async {
    _setLoadingState();
    try {
      final TodayKeyword fetchedTodayKeyword = await _fetchTodayKeywordUseCase
          .execute(
            FetchTodayKeywordParams(shouldForceRefresh: shouldForceRefresh),
          );
      _setSuccessState(fetchedTodayKeyword);
    } on Exception catch (exception) {
      _setErrorState(exception.toString());
    }
  }

  /// 확장/축소 토글
  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  /// 키워드 선택
  void selectKeyword(String keyword) {
    _selectedKeyword = keyword;
    searchController.text = keyword;
    // 키워드 선택 시 아코디언을 접힘 상태로 변경
    _isExpanded = false;
    // 키워드 변경 시 offset 리셋
    _currentOffset = 0;
    _hasMorePreviousData = true;
    notifyListeners();
    fetchIssueFlow();
  }

  /// 검색 실행
  void searchKeyword() {
    final String keyword = searchController.text.trim();
    if (keyword.isNotEmpty) {
      selectKeyword(keyword);
    }
  }

  /// 이슈 플로우 데이터 가져오기
  Future<void> fetchIssueFlow() async {
    if (_selectedKeyword == null) {
      return;
    }

    _setChartLoadingState();
    try {
      final IssueFlowRequest request = IssueFlowRequest(
        keyword: _selectedKeyword!,
        interval: _selectedInterval,
        offset: _currentOffset,
      );
      final IssueFlowResponse response = await _fetchIssueFlowUseCase.execute(
        request,
      );
      _setChartSuccessState(response);
      _hasMorePreviousData = true;
    } on NoMoreIssueFlowDataException {
      _hasMorePreviousData = false;
      _setNoMoreDataState();
    } on Object catch (error) {
      _setChartErrorState('데이터를 불러오는 중 오류가 발생했습니다: $error');
    }
  }

  /// 로딩 상태 설정
  void _setLoadingState() {
    _isLoading = true;
    _errorMessage = null;
    _todayKeyword = null;
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
    notifyListeners();
  }

  /// 차트 로딩 상태 설정
  void _setChartLoadingState() {
    _isLoadingChart = true;
    _errorMessage = null;
    notifyListeners();
  }

  /// 차트 성공 상태 설정
  void _setChartSuccessState(IssueFlowResponse data) {
    _isLoadingChart = false;
    _errorMessage = null;
    _issueFlowData = data;
    notifyListeners();
    // 차트 데이터 로드 후 마지막 label의 뉴스 자동 검색
    if (data.timeLine.isNotEmpty) {
      _selectedDate = data.timeLine.last.label;
      fetchNews();
    }
  }

  /// 차트 에러 상태 설정
  void _setChartErrorState(String message) {
    _isLoadingChart = false;
    _issueFlowData = null;
    // 에러 메시지는 기존 _errorMessage에 저장
    _errorMessage = message;
    notifyListeners();
  }

  void _setNoMoreDataState() {
    _isLoadingChart = false;
    _issueFlowData = null;
    _errorMessage = _noMoreDataMessage;
    _selectedDate = null;
    _newsSearchResult = null;
    notifyListeners();
  }

  /// 뉴스 확장/축소 토글
  void toggleNewsExpanded() {
    _isNewsExpanded = !_isNewsExpanded;
    notifyListeners();
  }

  /// 차트 막대 클릭 시 호출
  void onBarChartTap(String label) {
    if (_selectedDate != label) {
      _selectedDate = label;
      _isNewsExpanded = false;
      notifyListeners();
      fetchNews();
    }
  }

  /// 뉴스 검색
  Future<void> fetchNews() async {
    if (_selectedKeyword == null || _selectedDate == null) {
      return;
    }
    _setNewsLoadingState();
    try {
      final NewsSearchRequest request = NewsSearchRequest(
        keyword: _selectedKeyword!,
        date: _selectedDate!,
      );
      final NewsSearchResult result = await _fetchNewsSearchUseCase.execute(
        request,
      );
      _setNewsSuccessState(result);
    } on Object catch (error) {
      _setNewsErrorState('뉴스를 불러오는 중 오류가 발생했습니다: $error');
    }
  }

  /// 뉴스 로딩 상태 설정
  void _setNewsLoadingState() {
    _isLoadingNews = true;
    notifyListeners();
  }

  /// 뉴스 성공 상태 설정
  void _setNewsSuccessState(NewsSearchResult result) {
    _isLoadingNews = false;
    _newsSearchResult = result;
    notifyListeners();
  }

  /// 뉴스 에러 상태 설정
  void _setNewsErrorState(String message) {
    _isLoadingNews = false;
    _newsSearchResult = null;
    _errorMessage = message;
    notifyListeners();
  }

  /// 이전 데이터로 이동
  Future<void> navigateToPrevious() async {
    if (!_hasMorePreviousData) {
      return;
    }
    if (_isLoadingChart) {
      return;
    }

    final int previousOffset = _currentOffset;
    _currentOffset++;

    _setChartLoadingState();
    try {
      final IssueFlowRequest request = IssueFlowRequest(
        keyword: _selectedKeyword!,
        interval: _selectedInterval,
        offset: _currentOffset,
      );
      final IssueFlowResponse response = await _fetchIssueFlowUseCase.execute(
        request,
      );
      _setChartSuccessState(response);
      _hasMorePreviousData = true;
    } on NoMoreIssueFlowDataException {
      _hasMorePreviousData = false;
      _setNoMoreDataState();
    } on Object catch (error) {
      // offset을 원래 값으로 복원
      _currentOffset = previousOffset;
      _setChartErrorState('데이터를 불러오는 중 오류가 발생했습니다: $error');
    }
  }

  /// 다음 데이터로 이동
  Future<void> navigateToNext() async {
    if (_currentOffset <= 0) {
      return;
    }
    if (_isLoadingChart) {
      return;
    }

    _currentOffset--;

    _setChartLoadingState();
    try {
      final IssueFlowRequest request = IssueFlowRequest(
        keyword: _selectedKeyword!,
        interval: _selectedInterval,
        offset: _currentOffset,
      );
      final IssueFlowResponse response = await _fetchIssueFlowUseCase.execute(
        request,
      );
      _setChartSuccessState(response);
      _hasMorePreviousData = true;
    } on NoMoreIssueFlowDataException {
      _setNoMoreDataState();
    } on Object catch (error) {
      _setChartErrorState('데이터를 불러오는 중 오류가 발생했습니다: $error');
    }
  }
}
