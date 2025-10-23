import 'package:flutter/material.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import 'app_footer.dart';
import 'app_header.dart';
import 'app_navbar.dart';

/// 헤더와 푸터가 포함된 공통 스캐폴드 레이아웃
/// 모든 콘텐츠가 스크롤 가능한 영역에 포함됩니다.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.headerChild,
    this.footerChild,
  });

  /// 메인 바디 콘텐츠
  final Widget body;

  /// 헤더 영역에 표시할 위젯 (선택사항)
  final Widget? headerChild;

  /// 푸터 영역에 표시할 위젯 (선택사항)
  final Widget? footerChild;

  @override
  Widget build(BuildContext context) {
    final bool isCompact =
        MediaQuery.sizeOf(context).width <= AppLayoutConstants.maxCompactWidth;

    return Scaffold(
      backgroundColor: AppCustomColors.backgroundF6F7F9,
      // 컴팩트 화면에서만 appBar로 고정 네비게이션 바 사용
      appBar: isCompact ? const AppNavbar() : null,
      body: CustomScrollView(
        slivers: [
          if (!isCompact) const SliverToBoxAdapter(child: AppNavbar()),

          SliverToBoxAdapter(child: AppHeader(isCompact, child: headerChild)),

          SliverToBoxAdapter(child: body),

          const SliverFillRemaining(hasScrollBody: false, child: SizedBox()),

          SliverToBoxAdapter(child: AppFooter(isCompact, child: footerChild)),
        ],
      ),
    );
  }
}
