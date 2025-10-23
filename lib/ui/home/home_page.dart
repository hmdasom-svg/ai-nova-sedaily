import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/constants/app_text_styles.dart';
import 'components/ai_section.dart';
import 'components/category_section.dart';
import 'components/home_content_title_section.dart';
import 'components/issue_flow_section.dart';
import 'components/issue_map_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppLayoutConstants.homeContentMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double contentWidth = constraints.maxWidth;
              final bool isCompact =
                  contentWidth <= AppLayoutConstants.maxCompactWidth;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HomeContentTitleSection(
                    titleImagePath: 'assets/images/home/ai_nova_subtitle.svg',
                    label: '독자를 위한 스마트 뉴스 서비스',
                    isCompact: isCompact,
                  ),
                  const SizedBox(height: 24),
                  _buildTodaySection(isCompact),
                  const SizedBox(height: 24),
                  IssueFlowSection(isCompact),
                  const SizedBox(height: 24),
                  IssueMapSection(isCompact),
                  const SizedBox(height: 24),
                  AISection(isCompact),
                  const SizedBox(height: 24),
                  const CategorySection(),
                  const SizedBox(height: 74),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Today 섹션 위젯
  Widget _buildTodaySection(bool isCompact) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy년 M월 d일 이슈').format(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          'Today',
          style: isCompact
              ? AppTextStyles.noto18M
              : AppTextStyles.noto22M.copyWith(color: AppCustomColors.grey999),
        ),
        Text(
          formattedDate,
          style: isCompact ? AppTextStyles.noto24B : AppTextStyles.noto32B,
        ),
      ],
    );
  }
}
