import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:hovering/hovering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_streaming_text_markdown/flutter_streaming_text_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/api_constants.dart';
import 'big_kinds_controller.dart';

class BigKindsPage extends StatelessWidget {
  const BigKindsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isCompact =
        MediaQuery.sizeOf(context).width <= AppLayoutConstants.maxCompactWidth;

    return Consumer<BigKindsController>(
      builder:
          (BuildContext context, BigKindsController controller, Widget? child) {
            // 채팅이 시작되지 않았을 때는 초기 화면 표시
            if (!controller.hasStartedChat) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppLayoutConstants.contentMaxWidth,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isCompact
                          ? const SizedBox(height: 50)
                          : const SizedBox(height: 100),
                      _buildMainImage(isCompact),
                      const SizedBox(height: 32),
                      _buildChatInputArea(controller),
                    ],
                  ),
                ),
              );
            } else {
              // 채팅이 시작된 후에는 채팅 인터페이스 표시
              return SizedBox(
                height:
                    MediaQuery.sizeOf(context).height -
                    (AppLayoutConstants.navbarHeight +
                        AppLayoutConstants.headerHeightDefault),
                child: Column(
                  children: [
                    Expanded(child: _buildChatInterface(controller)),
                    _buildChatInputArea(controller),
                  ],
                ),
              );
            }
          },
    );
  }

  /// 메인 이미지 위젯
  Widget _buildMainImage(bool isCompact) {
    return Image.asset(
      'assets/images/big_kinds/big_kinds_main.webp',
      width: isCompact ? 355.0 : 426.0,
      height: isCompact ? 122.0 : 146.0,
      fit: BoxFit.contain,
    );
  }

  /// 채팅 인터페이스
  Widget _buildChatInterface(BigKindsController controller) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      color: AppCustomColors.backgroundF6F7F9,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayoutConstants.contentMaxWidth,
          ),
          child: ListView.builder(
            controller: controller.scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: controller.messages.length + 1,
            itemBuilder: (BuildContext context, int index) {
              // 첫 번째 아이템은 면책 조항 배너
              if (index == 0) {
                return _buildDisclaimerBanner();
              }
              // 나머지는 채팅 메시지
              final ChatMessage message = controller.messages[index - 1];
              return _buildMessageBubble(message, controller);
            },
          ),
        ),
      ),
    );
  }

  /// 면책 조항 배너
  Widget _buildDisclaimerBanner() {
    return Container(
      decoration: BoxDecoration(
        color: AppCustomColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: const Text(
        '빅카인즈 AI는 인공지능을 기반으로 하므로 부정확한 정보를 제공할 수 있습니다. 답변은 한국언론진흥재단의 공식의견이 아니며 정확한 정보는 출처로 함께 제공되는 기사를 통해 확인하실 수 있습니다.',
        style: AppTextStyles.noto13R,
        textAlign: TextAlign.start,
      ),
    );
  }

  /// 메시지 버블
  Widget _buildMessageBubble(
    ChatMessage message,
    BigKindsController controller,
  ) {
    final bool isUser = message.type == MessageType.user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isUser) ...[
                  // 답변 헤더
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/big_kinds/star_icon.webp',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 6),
                      const Text('답변', style: AppTextStyles.noto16B),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
                // 메시지 내용
                Container(
                  padding: isUser
                      ? const EdgeInsets.all(12)
                      : const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: isUser
                        ? AppCustomColors.white
                        : AppCustomColors.backgroundF6F7F9,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.isLoading) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: const Duration(milliseconds: 0),
                            animatedTexts: [
                              FadeAnimatedText(
                                message.content,
                                textStyle: AppTextStyles.noto15R,
                                duration: const Duration(milliseconds: 1000),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        if (isUser)
                          SelectableText(
                            message.content,
                            style: AppTextStyles.noto16B,
                          )
                        else
                          message.isTyping
                              ? StreamingTextMarkdown.chatGPT(
                                  text: message.content,
                                  styleSheet: AppTextStyles.noto16R.copyWith(
                                    color: AppCustomColors.black1C,
                                  ),
                                  onComplete: controller.onTypingComplete,
                                  animationsEnabled: true,
                                )
                              : SelectionArea(
                                  child: StreamingTextMarkdown.chatGPT(
                                    text: message.content,
                                    styleSheet: AppTextStyles.noto16R.copyWith(
                                      color: AppCustomColors.black1C,
                                    ),
                                    animationsEnabled: false,
                                  ),
                                ),
                      ],
                    ],
                  ),
                ),
                // 출처 영역
                if (!isUser &&
                    message.sources != null &&
                    message.sources!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _buildSourcesSection(message.sources!),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 출처 섹션
  Widget _buildSourcesSection(List<NewsSource> sources) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '출처',
              style: AppTextStyles.noto13R.copyWith(
                color: AppCustomColors.grey666,
              ),
            ),
            Text(
              ' ${sources.length}',
              style: AppTextStyles.noto13B.copyWith(
                color: AppCustomColors.blue006CFF,
              ),
            ),
            Text(
              '건',
              style: AppTextStyles.noto13R.copyWith(
                color: AppCustomColors.grey666,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return CarouselSlider.builder(
                itemCount: sources.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return SizedBox(
                    width: 180,
                    child: _buildSourceItem(sources[index]),
                  );
                },
                options: CarouselOptions(
                  height: 112,
                  viewportFraction: 180 / constraints.maxWidth,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// 출처 아이템
  Widget _buildSourceItem(NewsSource source) {
    return GestureDetector(
      onTap: () {
        launchUrl(
          Uri.parse('${ApiConstants.bigKindsNewsDetailPath}${source.newsId}'),
        );
      },
      child: HoverContainer(
        width: 180,
        margin: const EdgeInsets.only(right: 9),
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: AppCustomColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppCustomColors.greyE5E5E5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        hoverDecoration: BoxDecoration(
          color: AppCustomColors.backgroundEFEFEF,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppCustomColors.greyE5E5E5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        cursor: SystemMouseCursors.click,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              source.publisher,
              style: AppTextStyles.noto13B,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 9),
            Expanded(
              child: Text(
                source.title,
                style: AppTextStyles.noto13R.copyWith(
                  color: AppCustomColors.black1C,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              source.date,
              style: AppTextStyles.noto11M.copyWith(
                color: AppCustomColors.grey666,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  /// 채팅 입력 영역
  Widget _buildChatInputArea(BigKindsController controller) {
    return Container(
      width: double.infinity,
      color: AppCustomColors.backgroundF6F7F9,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayoutConstants.contentMaxWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 0, 7, 0),
                  decoration: BoxDecoration(
                    color: AppCustomColors.white,
                    border: Border.all(color: AppCustomColors.greyE5E5E5),
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.promptController,
                          focusNode: controller.promptFocusNode,
                          enabled: !controller.isLoading,
                          decoration: const InputDecoration(
                            hintText:
                                'AI 기반 뉴스 답변을 위해 사건이나 기간을 포함한 질문을 입력해 주세요.',
                            hintStyle: AppTextStyles.noto16R,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                          ),
                          style: AppTextStyles.noto16M,
                          onSubmitted: (String value) =>
                              controller.sendPrompt(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildSendButton(controller),
                    ],
                  ),
                ),
                if (controller.hasError) ...[
                  const SizedBox(height: 12),
                  _buildErrorMessage(controller.errorMessage!),
                ],
                _buildAttentionText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 전송 버튼
  Widget _buildSendButton(BigKindsController controller) {
    final bool isActive = controller.hasPromptText && !controller.isLoading;

    return MouseRegion(
      cursor: isActive ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: isActive ? controller.sendPrompt : null,
        child: Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
            color: isActive
                ? AppCustomColors.blue006CFF
                : AppCustomColors.backgroundF6F7F9,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: controller.isLoading
              ? const SpinKitThreeBounce(
                  color: AppCustomColors.blue006CFF,
                  size: 20,
                )
              : Icon(
                  Icons.arrow_upward_rounded,
                  size: 24,
                  color: isActive
                      ? AppCustomColors.white
                      : AppCustomColors.grey999,
                ),
        ),
      ),
    );
  }

  /// 유의사항 텍스트 위젯
  Widget _buildAttentionText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '빅카인즈 AI는 출처가 확인된 뉴스데이터 기반의 답변만 제공하며, 이는 한국언론진흥재단의 입장을 대변하지 않습니다. ',
                style: AppTextStyles.noto13R,
              ),
              TextSpan(
                text: '개인정보처리방침',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF2488FE),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard',
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(
                      Uri.parse(
                        'https://www.bigkinds.or.kr/v2/intro/privacy.do?pageDate=250707',
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 에러 메시지 위젯
  Widget _buildErrorMessage(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.noto14M.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
