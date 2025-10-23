import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/constants/app_text_styles.dart';

/// 페이지 전역에서 사용하는 헤더 위젯
class AppHeader extends StatelessWidget {
  const AppHeader(this.isCompact, {super.key, this.child, this.height});
  final Widget? child;
  final double? height;
  final bool isCompact;
  @override
  Widget build(BuildContext context) {
    final double resolvedHeight =
        height ??
        (isCompact
            ? AppLayoutConstants.headerHeightCompact
            : AppLayoutConstants.headerHeightDefault);
    return Container(
      height: resolvedHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppCustomColors.white,
        border: Border(
          bottom: BorderSide(color: AppCustomColors.dividerE5E5E5, width: 1),
        ),
      ),
      alignment: Alignment.center,
      child: child ?? _buildContent(context, isCompact),
    );
  }

  /// 헤더 콘텐츠 빌드 (메인 로고 이미지 및 텍스트)
  Widget _buildContent(BuildContext context, bool isCompact) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/common/ai_nova_logo.webp',
              width: 200,
              height: 57,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Text(
                  isCompact
                      ? '더 빠르고, 더 정확하고, 더 깊이 있는\n경제 정보를 제공합니다'
                      : '더 빠르고, 더 정확하고, 더 깊이 있는 경제 정보를 제공합니다',
                  style: AppTextStyles.noto16MGrey,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
