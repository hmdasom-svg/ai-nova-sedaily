import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/model/news_chat_reference.dart';
import '../../domain/model/news_chat_request.dart';
import '../../domain/model/news_chat_result.dart';
import '../../domain/usecase/request_news_chat_use_case.dart';

/// 채팅 메시지 타입
enum MessageType { user, assistant }

/// 채팅 메시지 모델
class ChatMessage {
  const ChatMessage({
    required this.type,
    required this.content,
    this.isLoading = false,
    this.isTyping = false,
    this.sources,
  });

  final MessageType type;
  final String content;
  final bool isLoading;
  final bool isTyping;
  final List<NewsSource>? sources;
}

/// 뉴스 출처 모델
class NewsSource {
  const NewsSource({
    required this.title,
    required this.publisher,
    required this.date,
    this.newsId,
  });

  final String title;
  final String publisher;
  final String date;
  final String? newsId;
}

/// 빅카인즈 페이지의 상태를 관리하는 컨트롤러
class BigKindsController extends ChangeNotifier {
  BigKindsController({
    required RequestNewsChatUseCase requestNewsChatUseCase,
    String? initialPrompt,
  }) : _requestNewsChatUseCase = requestNewsChatUseCase {
    promptController.addListener(_onPromptTextChanged);
    if (initialPrompt != null && initialPrompt.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        promptController.text = initialPrompt;
        sendPrompt();
      });
    }
  }

  final RequestNewsChatUseCase _requestNewsChatUseCase;

  /// 프롬프트 텍스트 컨트롤러
  final TextEditingController promptController = TextEditingController();

  /// 프롬프트 텍스트필드 포커스 노드
  final FocusNode promptFocusNode = FocusNode();

  /// 스크롤 컨트롤러
  final ScrollController scrollController = ScrollController();

  final DateFormat _dateFormat = DateFormat('yyyy.MM.dd');

  /// 채팅 메시지 리스트
  final List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatMessage> get messages => List.unmodifiable(_messages);

  /// 로딩 상태
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// 에러 상태
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  /// 채팅이 시작되었는지 여부
  bool get hasStartedChat => _messages.isNotEmpty;

  /// 프롬프트 입력 여부
  bool _hasPromptText = false;
  bool get hasPromptText => _hasPromptText;

  /// 자동 스크롤 타이머
  Timer? _autoScrollTimer;

  /// 타이핑 완료 플래그 (중복 호출 방지)
  bool _typingCompleted = false;

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    promptController.removeListener(_onPromptTextChanged);
    promptController.dispose();
    promptFocusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  /// 프롬프트 텍스트 변경 감지
  void _onPromptTextChanged() {
    final bool hasText = promptController.text.trim().isNotEmpty;
    if (_hasPromptText != hasText) {
      _hasPromptText = hasText;
      notifyListeners();
    }
  }

  /// 프롬프트 전송 처리
  Future<void> sendPrompt() async {
    final String prompt = promptController.text.trim();
    if (prompt.isEmpty) {
      return;
    }

    // 사용자 메시지 추가
    _addUserMessage(prompt);
    promptController.clear();

    // 로딩 상태의 AI 답변 추가
    _addLoadingAssistantMessage();

    _setLoading(true);
    _clearError();

    try {
      final NewsChatRequest request = NewsChatRequest(content: prompt);
      final NewsChatResult result = await _requestNewsChatUseCase.execute(
        request,
      );
      final List<NewsSource> sources = _mapReferences(result.references);
      _updateLastAssistantMessage(result.content, sources);
    } on Object catch (error) {
      _setError('프롬프트 전송 중 오류가 발생했습니다: $error');
      // 로딩 메시지 제거
      if (_messages.isNotEmpty &&
          _messages.last.type == MessageType.assistant) {
        _messages.removeLast();
        notifyListeners();
      }
      // 에러 발생 시 로딩 상태 해제
      _setLoading(false);
    } finally {
      // 타이핑 애니메이션이 완료될 때까지 로딩 상태 유지
      // _setLoading(false)는 onTypingComplete()에서 처리
      _scrollToBottom();
    }
  }

  /// 사용자 메시지 추가
  void _addUserMessage(String content) {
    _messages.add(ChatMessage(type: MessageType.user, content: content));
    notifyListeners();
    _scrollToBottom();
  }

  /// 로딩 상태의 AI 답변 추가
  void _addLoadingAssistantMessage() {
    _messages.add(
      const ChatMessage(
        type: MessageType.assistant,
        content: '사용자의 질문을 분석하여 뉴스 데이터를 기반으로 적절한 AI 답변을 생성하고 있습니다...',
        isLoading: true,
      ),
    );
    notifyListeners();
    _scrollToBottom();
  }

  /// 마지막 AI 답변 업데이트
  void _updateLastAssistantMessage(String content, List<NewsSource> sources) {
    _typingCompleted = false;
    if (_messages.isNotEmpty && _messages.last.type == MessageType.assistant) {
      _messages[_messages.length - 1] = ChatMessage(
        type: MessageType.assistant,
        content: content,
        isTyping: true,
        sources: sources.isEmpty ? null : sources,
      );
      notifyListeners();
      _scrollToBottom();
      _startAutoScroll();
    }
  }

  /// 자동 스크롤 시작 (타이핑 애니메이션 중)
  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 100), (
      Timer timer,
    ) {
      _scrollToBottom();
    });
  }

  /// 타이핑 완료 콜백
  void onTypingComplete() {
    // 중복 호출 방지
    if (_typingCompleted) {
      return;
    }
    _typingCompleted = true;
    _autoScrollTimer?.cancel();
    _scrollToBottom();
    if (_messages.isNotEmpty && _messages.last.type == MessageType.assistant) {
      final ChatMessage lastMessage = _messages.last;
      _messages[_messages.length - 1] = ChatMessage(
        type: lastMessage.type,
        content: lastMessage.content,
        isTyping: false,
        sources: lastMessage.sources,
      );
      notifyListeners();
    }
    // 타이핑 애니메이션 완료 후 로딩 상태 해제
    _setLoading(false);
    // 포커스 복원: 스트리밍 완료 후 입력창에 포커스를 되돌림
    WidgetsBinding.instance.addPostFrameCallback((_) {
      promptFocusNode.requestFocus();
    });
  }

  /// 하단으로 스크롤
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// 로딩 상태 설정
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// 에러 메시지 설정
  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// 에러 상태 클리어
  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// 뉴스 출처 매핑
  List<NewsSource> _mapReferences(List<NewsChatReference> references) {
    return references
        .map(
          (NewsChatReference reference) => NewsSource(
            title: reference.title,
            publisher: reference.provider,
            date: _dateFormat.format(reference.publishedAt),
            newsId: reference.newsId,
          ),
        )
        .toList(growable: false);
  }
}
