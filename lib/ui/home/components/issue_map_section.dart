import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/flutter_force_directed_graph.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_custom_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../common/issue_map_graph_view.dart';
import '../home_page_controller.dart';

/// 오늘의 이슈 맵 섹션 위젯
class IssueMapSection extends StatelessWidget {
  const IssueMapSection(this.isCompact, {super.key});
  final bool isCompact;

  static const GraphConfig _defaultGraphConfig = GraphConfig(
    scaling: 0.0048,
    elasticity: 0.70,
    repulsion: 180.0,
    repulsionRange: 370.0,
    length: 100.0,
    damping: 0.1,
    maxStaticFriction: 18.0,
    minVelocity: 0.8,
  );

  static const GraphConfig _compactGraphConfig = GraphConfig(
    scaling: 0.0048,
    elasticity: 0.70,
    repulsion: 220.0,
    repulsionRange: 450.0,
    length: 130.0,
    damping: 0.1,
    maxStaticFriction: 18.0,
    minVelocity: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(
      builder:
          (BuildContext context, HomePageController controller, Widget? child) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => context.push(AppRoutePaths.issueMap),
              child: HoverWidget(
                onHover: (_) {},
                hoverChild: _buildCard(context, true, controller),
                child: _buildCard(context, false, controller),
              ),
            );
          },
    );
  }

  Widget _buildCard(
    BuildContext context,
    bool isHovered,
    HomePageController controller,
  ) {
    final String? keyword =
        controller.issueMapPreview?.keyword ??
        (controller.todayKeyword?.keywords.isNotEmpty == true
            ? controller.todayKeyword!.keywords.first.keywordName
            : null);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        decoration: BoxDecoration(
          color: AppCustomColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(isHovered),
            const SizedBox(height: 20),
            _buildIssueMapContent(keyword, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isHovered) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'assets/images/home/issue_map_subtitle.webp',
              height: isCompact ? (isHovered ? 26 : 24) : (isHovered ? 31 : 29),
            ),
          ),
          const SizedBox(height: 6),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: isCompact
                ? AppTextStyles.noto15R.copyWith(
                    color: AppCustomColors.grey666,
                    height: 1.4,
                  )
                : AppTextStyles.noto16R.copyWith(
              color: AppCustomColors.grey666,
              height: 1.4,
            ),
            child: const Text('하루 동안 가장 중요한 이슈 5가지를 선정해서 보여드려요!'),
          ),
        ],
      ),
    );
  }

  Widget _buildIssueMapContent(String? keyword, HomePageController controller) {
    if (controller.isIssueMapPreviewLoading) {
      return const SizedBox(
        height: 280,
        child: Center(
          child: SpinKitThreeBounce(
            color: AppCustomColors.blue006CFF,
            size: 16,
          ),
        ),
      );
    }

    if (keyword == null || keyword.isEmpty) {
      return Text(
        '표시할 키워드가 없습니다.',
        style: AppTextStyles.noto14M.copyWith(color: AppCustomColors.grey666),
      );
    }

    if (controller.issueMapErrorMessage != null) {
      return SizedBox(
        height: 280,
        child: Center(
          child: Text(
            controller.issueMapErrorMessage!,
            style: AppTextStyles.noto14M.copyWith(
              color: AppCustomColors.black1C,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppCustomColors.backgroundF6F7F9,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '#',
                style: isCompact
                    ? AppTextStyles.noto15B.copyWith(
                        color: AppCustomColors.blue006CFF,
                        fontWeight: FontWeight.w900,
                      )
                    : AppTextStyles.noto20B.copyWith(
                  color: AppCustomColors.blue006CFF,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                keyword,
                style: isCompact
                    ? AppTextStyles.noto15B
                    : AppTextStyles.noto20B,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppCustomColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IgnorePointer(
              child: IssueMapGraphView(
                isLoading: false,
                issueMap: controller.issueMapPreview,
                onNodeTap: null,
                emptyMessage: '이슈맵 데이터를 불러올 수 없습니다.',
                aspectRatio: 16 / 9,
                graphConfig: isCompact
                    ? _compactGraphConfig
                    : _defaultGraphConfig,
                staticLayout: true,
                isFixedWidth: isCompact,
                fixedWidth: 400,
                isFixedHeight: isCompact,
                fixedHeight: 250,
                spawnExtentFactor: isCompact ? 0.75 : 0.6,
                nodeScaleMultiplier: isCompact ? 3.2 : 2.7,
                nodeMinDiameter: isCompact ? 28.0 : 20.0,
                nodeMaxDiameter: 110.0,
                nodeLabelTextStyle: AppTextStyles.noto14M.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                nodeLabelMinWidth: 60.0,
                enableHoverGrowth: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
