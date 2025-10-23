import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/utils/extensions.dart';
import '../../domain/model/issue_flow_response.dart';
import '../../domain/model/keyword_entry.dart';
import '../../domain/model/news_document.dart';
import '../../domain/usecase/fetch_issue_flow_use_case.dart';
import '../../domain/usecase/fetch_news_search_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';
import 'issue_flow_controller.dart';

class IssueFlowPage extends StatefulWidget {
  const IssueFlowPage({super.key});

  @override
  State<IssueFlowPage> createState() => _IssueFlowPageState();
}

class _IssueFlowPageState extends State<IssueFlowPage>
    with SingleTickerProviderStateMixin {
  // 차트 막대 너비 반응형 상수
  static const double _barWidthCompact = 35.0;
  static const double _barWidthDefault = 60.0;

  late final IssueFlowController _controller;

  // 차트 막대 hover 상태
  int? _hoveredBarIndex;

  void _handleNavigateToPrevious(IssueFlowController controller) {
    setState(() {
      _hoveredBarIndex = null;
    });
    controller.navigateToPrevious();
  }

  void _handleNavigateToNext(IssueFlowController controller) {
    setState(() {
      _hoveredBarIndex = null;
    });
    controller.navigateToNext();
  }

  @override
  void initState() {
    super.initState();
    _controller = IssueFlowController(
      fetchTodayKeywordUseCase: locator<FetchTodayKeywordUseCase>(),
      fetchIssueFlowUseCase: locator<FetchIssueFlowUseCase>(),
      fetchNewsSearchUseCase: locator<FetchNewsSearchUseCase>(),
      tickerProvider: this,
    )..loadTodayKeyword(shouldForceRefresh: false);
    // queryParameters에서 keyword 확인 및 자동 검색
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String? keyword = GoRouterState.of(
        context,
      ).uri.queryParameters['keyword'];
      if (keyword != null && keyword.isNotEmpty) {
        _controller.selectKeyword(keyword);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompact =
        MediaQuery.sizeOf(context).width <= AppLayoutConstants.maxCompactWidth;

    return ChangeNotifierProvider<IssueFlowController>.value(
      value: _controller,
      child: Consumer<IssueFlowController>(
        builder:
            (
              BuildContext context,
              IssueFlowController controller,
              Widget? child,
            ) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 820.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 30),
                              _buildSearchField(controller),
                              const SizedBox(height: 20),
                              _buildDateDisplay(controller, isCompact),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (controller.selectedKeyword != null) ...<Widget>[
                      _buildTabSection(controller),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Color.fromRGBO(0, 0, 0, 0.10),
                      ),
                      _buildKeywordTitle(controller),
                      _buildChartSection(controller, isCompact),
                      const SizedBox(height: 24),
                      if (controller.selectedDate != null)
                        _buildNewsSection(controller, isCompact),
                    ],
                  ],
                ),
              );
            },
      ),
    );
  }

  /// 검색 필드 위젯
  Widget _buildSearchField(IssueFlowController controller) {
    final bool isActive = controller.hasSearchText && !controller.isLoading;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 7, 0),
      decoration: BoxDecoration(
        border: Border.all(color: AppCustomColors.greyE5E5E5),
        borderRadius: BorderRadius.circular(24.0),
        color: AppCustomColors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller.searchController,
              focusNode: controller.searchFocusNode,
              decoration: const InputDecoration(
                hintText: '검색하려는 이슈를 입력해 주세요.',
                hintStyle: AppTextStyles.noto16R,
                border: InputBorder.none,
              ),
              style: AppTextStyles.noto16M,
              onSubmitted: (_) => controller.searchKeyword(),
            ),
          ),
          MouseRegion(
            cursor: isActive
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: isActive ? controller.searchKeyword : null,
              child: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppCustomColors.blue006CFF
                      : AppCustomColors.backgroundF6F7F9,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Icon(
                  Icons.search,
                  size: 24,
                  color: isActive
                      ? AppCustomColors.white
                      : AppCustomColors.grey999,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 날짜 표시 및 아코디언 영역
  Widget _buildDateDisplay(IssueFlowController controller, bool isCompact) {
    final List<KeywordEntry> keywords = controller.todayKeyword?.keywords ?? [];
    final String displayDate = DateFormat(
      'yyyy년 M월 d일 h:mm 기준',
    ).format(DateTime.now());

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => controller.toggleExpansion(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: AppCustomColors.backgroundF6F7F9,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              // 첫 번째 행: 날짜와 화살표
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(displayDate, style: AppTextStyles.noto11M),
                  Image.asset(
                    controller.isExpanded
                        ? 'assets/icons/common/arrow_up_icon.webp'
                        : 'assets/icons/common/arrow_down_icon.webp',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              // 로딩 상태
              if (controller.isLoading) ...[
                const SizedBox(height: 12),
                const Center(
                  child: SpinKitThreeBounce(
                    color: AppCustomColors.blue006CFF,
                    size: 16,
                  ),
                ),
              ]
              // 키워드가 없는 경우
              else if (keywords.isEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppCustomColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    children: <Widget>[
                      Icon(
                        Icons.info_outline,
                        color: AppCustomColors.grey666,
                        size: 16,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '표시할 키워드가 없습니다.',
                          style: AppTextStyles.noto14M,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
              // 정상 데이터: 아코디언 상태에 따라 표시
              else ...[
                const SizedBox(height: 12),
                // 아코디언이 펼쳐진 경우: 모든 키워드 표시
                if (controller.isExpanded) ...[
                  ...keywords.map(
                    (KeywordEntry keyword) => Padding(
                      padding: EdgeInsets.only(
                        top: keyword == keywords.first ? 0.0 : 8.0,
                      ),
                      child: _buildKeywordItem(keyword, controller, isCompact),
                    ),
                  ),
                ]
                // 아코디언이 접힌 경우: 키워드 로테이션 애니메이션
                else ...[
                  _buildRotatingKeywordItem(keywords, controller, isCompact),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// 개별 키워드 아이템
  Widget _buildKeywordItem(
    KeywordEntry keyword,
    IssueFlowController controller,
    bool isCompact,
  ) {
    return GestureDetector(
      onTap: () => controller.selectKeyword(keyword.keywordName),
      child: HoverContainer(
        padding: const EdgeInsets.fromLTRB(10, 6, 14, 6),
        decoration: BoxDecoration(
          color: AppCustomColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverDecoration: BoxDecoration(
          color: AppCustomColors.backgroundEFEFEF,
          borderRadius: BorderRadius.circular(20),
        ),
        cursor: SystemMouseCursors.click,
        child: Row(
          children: <Widget>[
            const Icon(Icons.search, color: AppCustomColors.grey666, size: 16),
            const SizedBox(width: 12),
            Text(
              keyword.keywordName,
              style: isCompact ? AppTextStyles.noto14M : AppTextStyles.noto16M,
            ),
          ],
        ),
      ),
    );
  }

  /// 로테이션 키워드 아이템 (아코디언 접힌 상태)
  Widget _buildRotatingKeywordItem(
    List<KeywordEntry> keywords,
    IssueFlowController controller,
    bool isCompact,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 14, 0),
      decoration: BoxDecoration(
        color: AppCustomColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.search, color: AppCustomColors.grey666, size: 16),
          const SizedBox(width: 12),
          SizedBox(
            height: isCompact ? 33 : 35,
            child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              pause: const Duration(milliseconds: 500),
              animatedTexts: keywords.map((keyword) {
                return RotateAnimatedText(
                  keyword.keywordName,
                  textStyle: isCompact
                      ? AppTextStyles.noto14M
                      : AppTextStyles.noto16M,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 탭 섹션 (연도별, 월별, 일별)
  Widget _buildTabSection(IssueFlowController controller) {
    return Container(
      width: double.infinity,
      color: AppCustomColors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar.secondary(
                controller: controller.tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelStyle: AppTextStyles.pretendard14SBBlue.copyWith(
                  color: AppCustomColors.black1C,
                ),
                unselectedLabelStyle: AppTextStyles.noto14M.copyWith(
                  color: AppCustomColors.grey666,
                ),
                labelColor: AppCustomColors.black1C,
                unselectedLabelColor: AppCustomColors.grey666,
                indicatorColor: AppCustomColors.black1C,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2.0,
                dividerHeight: 0,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                tabs: const <Widget>[
                  Tab(text: '연도별'),
                  Tab(text: '월별'),
                  Tab(text: '일별'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 키워드 제목 표시
  Widget _buildKeywordTitle(IssueFlowController controller) {
    if (controller.selectedKeyword == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      color: AppCustomColors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  '#',
                  style: AppTextStyles.noto20B.copyWith(
                    color: AppCustomColors.blue006CFF,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  controller.selectedKeyword!,
                  style: AppTextStyles.noto20B.copyWith(
                    color: AppCustomColors.black1C,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 차트 섹션
  Widget _buildChartSection(IssueFlowController controller, bool isCompact) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      color: AppCustomColors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppCustomColors.backgroundF6F7F9,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 32,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: controller.canNavigateToPrevious
                          ? () => _handleNavigateToPrevious(controller)
                          : null,
                      icon: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 24,
                        color: controller.canNavigateToPrevious
                            ? AppCustomColors.grey999
                            : AppCustomColors.grey999.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ),
                // 차트 콘텐츠
                Expanded(child: _buildChartContent(controller, isCompact)),
                SizedBox(
                  width: 32,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: controller.canNavigateToNext
                          ? () => _handleNavigateToNext(controller)
                          : null,
                      icon: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 24,
                        color: controller.canNavigateToNext
                            ? AppCustomColors.grey999
                            : AppCustomColors.grey999.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 차트 콘텐츠
  Widget _buildChartContent(IssueFlowController controller, bool isCompact) {
    if (controller.isLoadingChart) {
      return SizedBox(
        height: 180,
        child: Center(
          child: SpinKitThreeBounce(
            color: AppCustomColors.blue006CFF,
            size: 16,
          ),
        ),
      );
    }

    if (controller.hasError && controller.issueFlowData == null) {
      return SizedBox(
        height: 180,
        child: Center(
          child: Text(
            controller.errorMessage ?? '데이터를 불러올 수 없습니다.',
            style: AppTextStyles.noto14M.copyWith(
              color: AppCustomColors.black1C,
            ),
          ),
        ),
      );
    }

    if (controller.issueFlowData == null) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text('키워드를 선택하여 데이터를 확인하세요.', style: AppTextStyles.noto14M),
        ),
      );
    }

    return SizedBox(
      height: 180,
      child: _buildBarChart(
        controller.issueFlowData!,
        controller.selectedInterval,
        isCompact,
      ),
    );
  }

  /// interval에 따라 라벨 포맷팅
  String _formatLabel(String label, String interval, bool isCompact) {
    switch (interval) {
      case 'month':
        return label.toFormattedMonth();
      case 'day':
        final String formatted = label.toFormattedDay();
        if (!isCompact) {
          return formatted;
        }
        final List<String> segments = formatted.split('.');
        if (segments.length != 3) {
          return formatted;
        }
        return '${segments[0]}.\n${segments[1]}.${segments[2]}';
      case 'year':
      default:
        return label;
    }
  }

  /// 뉴스 섹션
  Widget _buildNewsSection(IssueFlowController controller, bool isCompact) {
    return Container(
      width: double.infinity,
      color: AppCustomColors.white,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildNewsTitle(controller, isCompact),
                const SizedBox(height: 32),
                if (controller.isLoadingNews)
                  const Center(
                    child: SpinKitThreeBounce(
                      color: AppCustomColors.blue006CFF,
                      size: 16,
                    ),
                  )
                else if (controller.newsSearchResult == null)
                  const Center(
                    child: Text(
                      '뉴스 데이터를 불러올 수 없습니다.',
                      style: AppTextStyles.noto14M,
                    ),
                  )
                else if (controller.displayedNews.isEmpty)
                  const Center(
                    child: Text('검색된 뉴스가 없습니다.', style: AppTextStyles.noto14M),
                  )
                else ...[
                  ...controller.displayedNews.asMap().entries.map((
                    MapEntry<int, NewsDocument> entry,
                  ) {
                    final int index = entry.key;
                    final NewsDocument news = entry.value;
                    final bool isLast =
                        index == controller.displayedNews.length - 1;
                    return _buildNewsItem(
                      news,
                      isLast,
                      controller.selectedInterval,
                      isCompact,
                    );
                  }),
                  const SizedBox(height: 10),
                  if (controller.hasMoreNews) _buildShowMoreButton(controller),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 뉴스 제목
  Widget _buildNewsTitle(IssueFlowController controller, bool isCompact) {
    final String formattedDate = _formatNewsDate(
      controller.selectedDate!,
      controller.selectedInterval,
    );
    final int totalCount = controller.newsSearchResult?.totalHits ?? 0;

    return Row(
      children: <Widget>[
        Text(
          formattedDate,
          style: isCompact
              ? AppTextStyles.noto16B.copyWith(color: AppCustomColors.black1C)
              : AppTextStyles.noto20B.copyWith(color: AppCustomColors.black1C),
        ),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(
            color: AppCustomColors.backgroundF6F7F9,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            '$totalCount',
            style: isCompact
                ? AppTextStyles.noto12MB
                : AppTextStyles.noto14MB.copyWith(
                    color: AppCustomColors.blue006CFF,
                  ),
          ),
        ),
      ],
    );
  }

  /// 뉴스 날짜 포맷팅
  String _formatNewsDate(String date, String interval) {
    try {
      switch (interval) {
        case 'year':
          // "2025" -> "2025년"
          return '${date}년';
        case 'month':
          // "202508" -> "2025년 08월"
          if (date.length == 6) {
            final String year = date.substring(0, 4);
            final String month = date.substring(4, 6);
            return '$year년 $month월';
          }
          return date;
        case 'day':
          // "20250811" -> "2025년 08월 11일"
          if (date.length == 8) {
            final String year = date.substring(0, 4);
            final String month = date.substring(4, 6);
            final String day = date.substring(6, 8);
            return '$year년 $month월 $day일';
          }
          return date;
        default:
          return date;
      }
    } catch (_) {
      return date;
    }
  }

  /// 뉴스 아이템 (타임라인 형태)
  Widget _buildNewsItem(
    NewsDocument news,
    bool isLast,
    String interval,
    bool isCompact,
  ) {
    // 일별일 때는 HH:mm, 그 외에는 MM.dd 형식
    final String leftLabel = interval == 'day'
        ? DateFormat('HH:mm').format(news.dateline)
        : DateFormat('MM.dd').format(news.dateline);
    final String dateTime = DateFormat(
      'yyyy.MM.dd HH:mm',
    ).format(news.dateline);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(news.providerLinkPage),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                leftLabel,
                style: AppTextStyles.noto14M.copyWith(
                  color: AppCustomColors.grey666,
                ),
              ),
              const SizedBox(width: 9),
              Column(
                children: <Widget>[
                  const SizedBox(height: 6),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppCustomColors.black1C,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 1,
                        color: AppCustomColors.greyE5E5E5,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        news.title,
                        style: isCompact
                            ? AppTextStyles.noto15B
                            : AppTextStyles.noto18B,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        dateTime,
                        style: AppTextStyles.noto13M.copyWith(
                          color: AppCustomColors.grey999,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        news.content,
                        style: isCompact
                            ? AppTextStyles.noto15R.copyWith(height: 1.5)
                            : AppTextStyles.noto16R.copyWith(
                                height: 1.5,
                                color: AppCustomColors.grey666,
                              ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 더보기 버튼
  Widget _buildShowMoreButton(IssueFlowController controller) {
    return Center(
      child: TextButton.icon(
        onPressed: controller.toggleNewsExpanded,
        iconAlignment: IconAlignment.end,
        icon: Icon(
          controller.isNewsExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          size: 20,
          color: AppCustomColors.black1C,
        ),
        label: Text(
          controller.isNewsExpanded ? '접기' : '더보기',
          style: AppTextStyles.noto14M.copyWith(color: AppCustomColors.black1C),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }

  /// URL 열기
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// 막대 그래프
  Widget _buildBarChart(
    IssueFlowResponse data,
    String interval,
    bool isCompact,
  ) {
    return Consumer<IssueFlowController>(
      builder:
          (
            BuildContext context,
            IssueFlowController controller,
            Widget? child,
          ) {
            final List<BarChartGroupData> barGroups = data.timeLine
                .asMap()
                .entries
                .map((entry) {
                  final int index = entry.key;
                  final timeline = entry.value;
                  final bool isSelected =
                      controller.selectedDate == timeline.label;
                  final bool isHovered = _hoveredBarIndex == index;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: timeline.hits.toDouble(),
                        color: isSelected || isHovered
                            ? AppCustomColors.blue006CFF
                            : AppCustomColors.blue006CFF26,
                        width: isCompact ? _barWidthCompact : _barWidthDefault,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                    showingTooltipIndicators: [0],
                  );
                })
                .toList();

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY:
                        data.timeLine
                            .map((t) => t.hits.toDouble())
                            .reduce((a, b) => a > b ? a : b) *
                        1.2,
                    gridData: FlGridData(show: false),
                    barTouchData: BarTouchData(
                      mouseCursorResolver:
                          (FlTouchEvent event, BarTouchResponse? response) {
                            if (event is FlPointerHoverEvent) {
                              return response?.spot != null
                                  ? SystemMouseCursors.click
                                  : SystemMouseCursors.basic;
                            }
                            return SystemMouseCursors.basic;
                          },

                      enabled: true,
                      touchCallback:
                          (FlTouchEvent event, BarTouchResponse? response) {
                            if (event is FlPointerHoverEvent) {
                              setState(() {
                                _hoveredBarIndex =
                                    response?.spot?.touchedBarGroupIndex;
                              });
                            } else if (event is FlPointerExitEvent) {
                              setState(() {
                                _hoveredBarIndex = null;
                              });
                            } else if (event is FlTapUpEvent &&
                                response?.spot != null) {
                              final int index =
                                  response!.spot!.touchedBarGroupIndex;
                              final String label = data.timeLine[index].label;
                              controller.onBarChartTap(label);
                            }
                          },
                      touchTooltipData: BarTouchTooltipData(
                        direction: TooltipDirection.top,
                        tooltipMargin: 0,
                        tooltipPadding: EdgeInsets.zero,
                        fitInsideHorizontally: true,
                        getTooltipColor: (group) => Colors.transparent,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${data.timeLine[groupIndex].hits}건',
                            AppTextStyles.pretendard14SBBlue,
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value.toInt() >= 0 &&
                                value.toInt() < data.timeLine.length) {
                              final String label =
                                  data.timeLine[value.toInt()].label;
                              final String formattedLabel = _formatLabel(
                                label,
                                interval,
                                isCompact,
                              );
                              return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  formattedLabel,
                                  style: AppTextStyles.noto14M.copyWith(
                                    color: AppCustomColors.grey444,
                                    height: 1,
                                  ),
                                ),
                              );
                            }
                            return const Text('');
                          },
                          reservedSize: 30,
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: barGroups,
                  ),
                ),
                Positioned(
                  bottom: 29,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 1,
                    color: AppCustomColors.greyE5E5E5,
                  ),
                ),
              ],
            );
          },
    );
  }
}
