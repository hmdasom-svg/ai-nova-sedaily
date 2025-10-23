import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_custom_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/model/keyword_entry.dart';
import '../home_page_controller.dart';

/// 오늘의 이슈 흐름 분석 섹션 위젯
class IssueFlowSection extends StatelessWidget {
  const IssueFlowSection(this.isCompact, {super.key});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      onHover: (_) {},
      hoverChild: _buildCard(context, true),
      child: _buildCard(context, false),
    );
  }

  Widget _buildCard(BuildContext context, bool isHovered) {
    return Consumer<HomePageController>(
      builder:
          (BuildContext context, HomePageController controller, Widget? child) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
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
                  _buildHeader(context, isHovered),
                  const SizedBox(height: 20),
                  _buildAccordion(context, controller),
                ],
              ),
            );
          },
    );
  }

  Widget _buildHeader(BuildContext context, bool isHovered) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.push(AppRoutePaths.issueFlow),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  'assets/images/home/issue_flow_subtitle.webp',
                  height: isCompact
                      ? (isHovered ? 26 : 24)
                      : (isHovered ? 31 : 29),
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
                child: const Text('이슈의 흐름과 맥락을 분석하여 시간적 정보로 제공해 드려요!'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccordion(BuildContext context, HomePageController controller) {
    final List<KeywordEntry> keywords =
        controller.todayKeyword?.keywords ?? <KeywordEntry>[];
    final String displayDate = DateFormat(
      'yyyy년 M월 d일 h:mm 기준',
    ).format(DateTime.now());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: controller.toggleExpansion,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 2),
          decoration: BoxDecoration(
            color: AppCustomColors.backgroundF6F7F9,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      displayDate,
                      style: isCompact
                          ? AppTextStyles.noto11M
                          : AppTextStyles.noto13M,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: controller.toggleExpansion,
                      child: Image.asset(
                        controller.isExpanded
                            ? 'assets/icons/common/arrow_up_icon.webp'
                            : 'assets/icons/common/arrow_down_icon.webp',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              if (controller.isLoading)
                _buildLoadingIndicator()
              else if (controller.hasError)
                _buildErrorBox(controller.errorMessage)
              else if (keywords.isEmpty)
                _buildEmptyBox()
              else
                _buildKeywordContent(context, controller, keywords),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Column(
      children: const <Widget>[
        SizedBox(height: 12),
        Center(
          child: SpinKitThreeBounce(
            color: AppCustomColors.blue006CFF,
            size: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorBox(String? errorMessage) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: AppCustomColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              const Icon(Icons.error_outline, color: Colors.red, size: 16),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  errorMessage ?? '데이터를 불러올 수 없습니다.',
                  style: AppTextStyles.noto14M,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyBox() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: AppCustomColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: const <Widget>[
              Icon(
                Icons.info_outline,
                color: AppCustomColors.grey666,
                size: 16,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text('표시할 키워드가 없습니다.', style: AppTextStyles.noto14M),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeywordContent(
    BuildContext context,
    HomePageController controller,
    List<KeywordEntry> keywords,
  ) {
    if (controller.isExpanded) {
      return Column(
        children: <Widget>[
          const SizedBox(height: 12),
          ...keywords.map(
            (KeywordEntry keyword) => _buildKeywordItem(context, keyword),
          ),
        ],
      );
    }
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        _buildRotatingKeywordItem(keywords),
      ],
    );
  }

  Widget _buildKeywordItem(BuildContext context, KeywordEntry keyword) {
    return GestureDetector(
      onTap: () {
        context.push(
          '${AppRoutePaths.issueFlow}?keyword=${Uri.encodeComponent(keyword.keywordName)}',
        );
      },
      child: HoverContainer(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
            Expanded(
              child: Text(
                keyword.keywordName,
                style: isCompact
                    ? AppTextStyles.noto14M
                    : AppTextStyles.noto16M,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRotatingKeywordItem(List<KeywordEntry> keywords) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 14, 0),
      margin: const EdgeInsets.only(bottom: 10),
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
              animatedTexts: keywords
                  .map(
                    (KeywordEntry keyword) => RotateAnimatedText(
                      keyword.keywordName,
                      textStyle: isCompact
                          ? AppTextStyles.noto14M
                          : AppTextStyles.noto16M,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
