import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';

import '../../../core/constants/app_custom_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';

/// 빅카인즈 AI 섹션 위젯
class AISection extends StatefulWidget {
  const AISection(this.isCompact, {super.key});
  final bool isCompact;

  @override
  State<AISection> createState() => _AISectionState();
}

class _AISectionState extends State<AISection> {
  final TextEditingController _textController = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final bool hasText = _textController.text.trim().isNotEmpty;
    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  void _sendPrompt() {
    final String text = _textController.text.trim();
    if (text.isEmpty) {
      return;
    }
    _textController.clear();
    context.push(AppRoutePaths.bigKinds, extra: text);
  }

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      onHover: (_) {},
      hoverChild: _buildCard(context, true),
      child: _buildCard(context, false),
    );
  }

  Widget _buildCard(BuildContext context, bool isHovered) {
    return Container(
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
          GestureDetector(
            onTap: () => context.push(AppRoutePaths.bigKinds),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: _buildSectionHeader(isHovered)),
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      'assets/images/home/big_kinds_character.webp',
                      width: 104,
                      height: 95,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildChatInterface(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(bool isHovered) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'assets/images/home/big_kinds_subtitle.webp',
              height: widget.isCompact
                  ? (isHovered ? 26 : 24)
                  : (isHovered ? 31 : 29),
            ),
          ),
          const SizedBox(height: 6),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: widget.isCompact
                ? AppTextStyles.noto15R.copyWith(
                    color: AppCustomColors.grey666,
                    height: 1.4,
                  )
                : AppTextStyles.noto16R.copyWith(
                    color: AppCustomColors.grey666,
                    height: 1.4,
            ),
            child: const Text('질문에 답변과 함께는 기사를 찾아주는 생성형 인공지능 서비스'),
          ),
        ],
      ),
    );
  }

  Widget _buildChatInterface(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 7.0, 0),
      decoration: BoxDecoration(
        color: AppCustomColors.white,
        border: Border.all(color: AppCustomColors.greyE5E5E5),
        borderRadius: BorderRadius.circular(24),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2.0),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: (_) => _sendPrompt(),
              style: widget.isCompact
                  ? AppTextStyles.noto16M
                  : AppTextStyles.noto18M.copyWith(
                      color: AppCustomColors.black1C,
                    ),
              decoration: InputDecoration(
                hintText: '질문을 입력해 주세요!',
                hintStyle: widget.isCompact
                    ? AppTextStyles.noto16R
                    : AppTextStyles.noto18R.copyWith(
                        color: AppCustomColors.grey999,
                      ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          MouseRegion(
            cursor: _hasText
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: _hasText ? _sendPrompt : null,
              child: Container(
                height: 34,
                width: 34,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: _hasText
                      ? AppCustomColors.blue006CFF
                      : AppCustomColors.backgroundF6F7F9,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  Icons.arrow_upward_rounded,
                  size: 24,
                  color: _hasText
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
}
