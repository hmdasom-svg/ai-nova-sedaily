import 'package:flutter/material.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_text_styles.dart';

/// 페이지 전역에서 사용하는 푸터 위젯
class AppFooter extends StatelessWidget {
  const AppFooter(this.isCompact, {super.key, this.child, this.height});
  final Widget? child;
  final double? height;
  final bool isCompact;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppCustomColors.backgroundEFEFEF,
      alignment: Alignment.center,
      child: child ?? _buildContent(context, isCompact),
    );
  }

  /// 푸터 콘텐츠 빌드 (최대 padding: 좌우 250px 상하 40px, 최소 padding: 상하좌우 20px)
  Widget _buildContent(BuildContext context, bool isCompact) {
    return SizedBox(
      width: 820,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: isCompact ? 20.0 : 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildAcceleratedBySection(),
            const SizedBox(height: 6),
            _buildDescriptionSection(),
            const SizedBox(height: 6),
            _buildCopyrightSection(),
          ],
        ),
      ),
    );
  }

  /// "Accelerated by 서울경제신문" 섹션
  Widget _buildAcceleratedBySection() {
    return Row(
      children: <Widget>[
        Text('Accelerated by ', style: AppTextStyles.noto12RS),
        Text('서울경제신문', style: AppTextStyles.pretendard15B),
      ],
    );
  }

  /// AI NOVA 설명 섹션
  Widget _buildDescriptionSection() {
    return Text(
      'AI로 만드는 더 나은 경제 정보\nAI NOVA(News & Issue Orchestrating Vivid Agent)는 한국언론진흥재단 지원을 받아 개발한 빅카인즈 AI 기반의 뉴스와 이슈 분석 에이전트입니다.',
      style: AppTextStyles.noto12R,
    );
  }

  /// 저작권 정보 섹션
  Widget _buildCopyrightSection() {
    return Text(
      '© 2025. 서울경제신문. All rights reserved.\nPowered by Softlunch Inc. · Seoul, Republic of Korea',
      style: AppTextStyles.noto11R,
    );
  }
}
