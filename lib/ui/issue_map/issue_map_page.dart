import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/utils/extensions.dart';
import '../../domain/model/issue_map_node.dart';
import '../../domain/model/keyword_entry.dart';
import '../../domain/model/news_document.dart';
import '../common/issue_map_graph_view.dart';
import 'issue_map_controller.dart';

/// 이슈맵 페이지
class IssueMapPage extends StatefulWidget {
  const IssueMapPage({super.key});

  @override
  State<IssueMapPage> createState() => _IssueMapPageState();
}

class _IssueMapPageState extends State<IssueMapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context.read<IssueMapController>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompact =
        MediaQuery.sizeOf(context).width <= AppLayoutConstants.maxCompactWidth;

    return Consumer<IssueMapController>(
      builder:
          (BuildContext context, IssueMapController controller, Widget? child) {
            if (controller.hasError) {
              return _buildErrorWidget(controller);
            }
            return Column(
              children: <Widget>[
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            _buildHeader(isCompact),
                            const SizedBox(height: 12),
                            _buildKeywordCards(controller, isCompact),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _buildIssueMapSection(controller, isCompact),
                const SizedBox(height: 24),
                _buildNewsSearchSection(controller, isCompact),
              ],
            );
          },
    );
  }

  /// 헤더 섹션 (날짜 및 제목)
  Widget _buildHeader(bool isCompact) {
    final DateTime now = DateTime.now();
    final String dateText = '${now.year}년 ${now.month}월 ${now.day}일';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dateText, style: AppTextStyles.noto18M),
        const SizedBox(height: 4),
        Text(
          '오늘의 이슈맵',
          style: isCompact ? AppTextStyles.noto24B : AppTextStyles.noto35B,
        ),
      ],
    );
  }

  /// 키워드 카드 섹션
  Widget _buildKeywordCards(IssueMapController controller, bool isCompact) {
    if (controller.isLoadingKeywords) {
      return const Center(
        child: SpinKitThreeBounce(color: AppCustomColors.blue006CFF, size: 16),
      );
    }

    final List<KeywordEntry> keywords = controller.keywords;
    if (keywords.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: keywords.map((KeywordEntry keyword) {
        final bool isSelected =
            controller.selectedKeyword == keyword.keywordName;
        return _buildKeywordCard(keyword, isSelected, controller, isCompact);
      }).toList(),
    );
  }

  /// 개별 키워드 카드
  Widget _buildKeywordCard(
    KeywordEntry keyword,
    bool isSelected,
    IssueMapController controller,
    bool isCompact,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => controller.selectKeyword(keyword.keywordName),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
          decoration: BoxDecoration(
            color: isSelected
                ? AppCustomColors.blue006CFF
                : AppCustomColors.white,
            border: Border.all(
              color: isSelected
                  ? AppCustomColors.blue006CFF
                  : AppCustomColors.grey999,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '#${keyword.keywordName}',
            style: isCompact
                ? (isSelected
                      ? AppTextStyles.noto14M.copyWith(
                          color: AppCustomColors.white,
                        )
                      : AppTextStyles.noto14M)
                : (isSelected
                      ? AppTextStyles.noto16M.copyWith(
                          color: AppCustomColors.white,
                        )
                      : AppTextStyles.noto16M),
          ),
        ),
      ),
    );
  }

  /// 이슈맵 그래프 섹션
  Widget _buildIssueMapSection(IssueMapController controller, bool isCompact) {
    return Container(
      width: double.infinity,
      color: AppCustomColors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '#',
                      style: isCompact
                          ? AppTextStyles.noto20B.copyWith(
                              color: AppCustomColors.blue006CFF,
                            )
                          : AppTextStyles.noto28B.copyWith(
                              color: AppCustomColors.blue006CFF,
                              fontWeight: FontWeight.w900,
                            ),
                    ),
                    Text(
                      '${controller.selectedKeyword}',
                      style: isCompact
                          ? AppTextStyles.noto20B.copyWith(
                              color: AppCustomColors.black1C,
                            )
                          : AppTextStyles.noto28B.copyWith(
                              color: AppCustomColors.black1C,
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (controller.issueMap?.summary != null)
                  Text(
                    controller.issueMap!.summary,
                    style: isCompact
                        ? AppTextStyles.noto15R.copyWith(
                            color: AppCustomColors.grey666,
                            height: 1.4,
                          )
                        : AppTextStyles.noto18R.copyWith(
                            color: AppCustomColors.grey666,
                            height: 1.4,
                          ),
                  ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: IssueMapGraphView(
                    isLoading: controller.isLoadingIssueMap,
                    issueMap: controller.issueMap,
                    onNodeTap: _handleNodeTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 노드 탭 시 해당 노드 이름으로 뉴스 검색
  void _handleNodeTap(BuildContext context, IssueMapNode node) {
    context.read<IssueMapController>().searchNewsByNodeName(node.name);
  }

  /// 뉴스 검색 결과 섹션
  Widget _buildNewsSearchSection(
    IssueMapController controller,
    bool isCompact,
  ) {
    if (controller.selectedKeyword == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      color: AppCustomColors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '#${controller.newsSearchKeyword}',
                      style: isCompact
                          ? AppTextStyles.noto16B.copyWith(
                              color: AppCustomColors.blue006CFF,
                            )
                          : AppTextStyles.noto20B.copyWith(
                              color: AppCustomColors.blue006CFF,
                              fontWeight: FontWeight.w900,
                            ),
                    ),
                    Text(
                      '에 대한 검색 결과 총',
                      style: isCompact
                          ? AppTextStyles.noto16B.copyWith(
                              color: AppCustomColors.black1C,
                            )
                          : AppTextStyles.noto20B.copyWith(
                              color: AppCustomColors.black1C,
                            ),
                    ),
                    Text(
                      '${controller.newsSearchResult?.totalHits ?? 0}',
                      style: isCompact
                          ? AppTextStyles.noto16B.copyWith(
                              color: AppCustomColors.blue006CFF,
                            )
                          : AppTextStyles.noto20B.copyWith(
                              color: AppCustomColors.blue006CFF,
                            ),
                    ),
                    Text(
                      '건',
                      style: isCompact
                          ? AppTextStyles.noto16B.copyWith(
                              color: AppCustomColors.black1C,
                            )
                          : AppTextStyles.noto20B.copyWith(
                              color: AppCustomColors.black1C,
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (controller.isLoadingNewsSearch)
                  const Center(
                    child: SpinKitThreeBounce(
                      color: AppCustomColors.blue006CFF,
                      size: 16,
                    ),
                  )
                else if (controller.displayedNews.isNotEmpty)
                  Column(
                    children: [
                      ...controller.displayedNews.map((NewsDocument document) {
                        return Column(
                          children: [
                            Divider(
                              height: 1,
                              color: AppCustomColors.dividerE5E5E5,
                            ),
                            _buildNewsItem(document, isCompact),
                          ],
                        );
                      }),
                      if (controller.hasMoreNews) ...[
                        const SizedBox(height: 10),
                        _buildShowMoreButton(controller),
                      ],
                    ],
                  )
                else
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    child: const Center(
                      child: Text('검색 결과가 없습니다.', style: AppTextStyles.noto14M),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 뉴스 아이템
  Widget _buildNewsItem(NewsDocument document, bool isCompact) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(document.providerLinkPage)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                document.title,
                style: isCompact
                    ? AppTextStyles.noto16B
                    : AppTextStyles.noto18B,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: isCompact ? 150 : null,
                    child: Text(
                      document.providerLinkPage,
                      style: AppTextStyles.noto13MBlue,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    document.dateline.toFormattedDateTime(),
                    style: AppTextStyles.noto13M,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                document.content,
                style: isCompact
                    ? AppTextStyles.noto15R.copyWith(height: 1.5)
                    : AppTextStyles.noto16R.copyWith(
                        color: AppCustomColors.grey666,
                        height: 1.5,
                      ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 더보기 버튼
  Widget _buildShowMoreButton(IssueMapController controller) {
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

  /// 에러 위젯
  Widget _buildErrorWidget(IssueMapController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppCustomColors.grey999,
          ),
          const SizedBox(height: 16),
          Text(
            controller.errorMessage ?? '알 수 없는 오류가 발생했습니다.',
            style: AppTextStyles.noto16M,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              controller.clearError();
              controller.refresh();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppCustomColors.blue006CFF,
              foregroundColor: AppCustomColors.white,
            ),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }
}
