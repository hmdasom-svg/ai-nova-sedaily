import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/constants/app_text_styles.dart';

/// 상단 네비게이션 바
/// 반응형으로 구현되어 컴팩트 화면에서는 뒤로가기 버튼과 중앙 로고,
/// 일반 화면에서는 왼쪽 로고만 표시됩니다.
/// 컴팩트 화면에서는 고정(AppBar), 기본 화면에서는 스크롤됩니다.
class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppLayoutConstants.navbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isCompact =
        MediaQuery.sizeOf(context).width <= AppLayoutConstants.maxCompactWidth;
    return Container(
      height: isCompact ? 44 : AppLayoutConstants.navbarHeight,
      color: AppCustomColors.white,
      padding: isCompact ? EdgeInsets.zero : EdgeInsets.only(top: 10.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayoutConstants.contentMaxWidth,
          ),
          child: isCompact
              ? _buildCompactNavbar(context)
              : _buildDefaultNavbar(context),
        ),
      ),
    );
  }

  /// 컴팩트 화면용 네비게이션 바 (뒤로가기 버튼 유무에 따라 레이아웃 변경)
  Widget _buildCompactNavbar(BuildContext context) {
    final bool shouldShowBackButton = _shouldShowBackButton(context);
    // 뒤로가기 버튼이 없을 때: 왼쪽 로고 + 오른쪽 사용자 프로필
    if (!shouldShowBackButton) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 왼쪽 로고
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _handleLogoPress(context),
                child: Image.asset(
                  'assets/images/common/sedaily_nav_logo.webp',
                  height: 32,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // 사용자 프로필 아이콘
          _buildUserProfileIcon(context),
        ],
      );
    }
    // 뒤로가기 버튼이 있을 때: 뒤로가기 버튼 + 중앙 로고 + 사용자 프로필
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // 뒤로가기 버튼
        _buildBackButton(context),
        // 중앙 로고
        Expanded(
          child: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _handleLogoPress(context),
                child: Image.asset(
                  'assets/images/common/sedaily_nav_logo.webp',
                  height: 32,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        // 사용자 프로필 아이콘
        _buildUserProfileIcon(context),
      ],
    );
  }

  /// 기본 화면용 네비게이션 바 (왼쪽 로고 + 로그인/회원가입)
  Widget _buildDefaultNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 왼쪽 로고
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _handleLogoPress(context),
            child: Image.asset(
              'assets/images/common/sedaily_nav_logo.webp',
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // 로그인/회원가입
        Row(
          children: [
            // 로그인 버튼
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _showComingSoonSnackbar(context),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '로그인',
                    style: AppTextStyles.noto13R.copyWith(
                      color: AppCustomColors.grey333,
                    ),
                  ),
                ),
              ),
            ),
            // 세로 divider
            Container(width: 1, height: 13, color: AppCustomColors.greyD5D5D5),
            // 회원가입 버튼
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _showComingSoonSnackbar(context),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '회원가입',
                    style: AppTextStyles.noto13R.copyWith(
                      color: AppCustomColors.grey333,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 뒤로가기 버튼 클릭 처리
  void _handleBackPress(BuildContext context) {
    final GoRouter router = GoRouter.of(context);
    if (router.canPop()) {
      router.pop();
      return;
    }
    router.go('/');
  }

  /// 로고 클릭 처리 (서울경제신문 홈페이지로 이동)
  void _handleLogoPress(BuildContext context) {
    launchUrl(Uri.parse('https://sedaily.com/'));
  }

  /// 구현 예정 기능 스낵바 표시
  void _showComingSoonSnackbar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('구현 예정인 기능입니다.')));
  }

  bool _shouldShowBackButton(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    return state.matchedLocation != '/';
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleBackPress(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/icons/common/back.webp',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfileIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => _showComingSoonSnackbar(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/icons/common/user_profile_icon.webp',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
