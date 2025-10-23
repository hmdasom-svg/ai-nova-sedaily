import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../core/constants/app_custom_colors.dart';
import '../../../core/constants/app_text_styles.dart';

/// 홈 콘텐츠 타이틀 섹션 위젯
class HomeContentTitleSection extends StatelessWidget {
  const HomeContentTitleSection({
    super.key,
    required this.titleImagePath,
    required this.label,
    required this.isCompact,
  });

  final String titleImagePath;
  final String label;
  final bool isCompact;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture(
            AssetBytesLoader(titleImagePath),
            height: isCompact ? 24 : 29,
          ),
          const SizedBox(height: 9),
          Text(
            label,
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
        ],
      ),
    );
  }
}
