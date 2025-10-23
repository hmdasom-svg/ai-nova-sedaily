import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/di/service_locator.dart';
import '../../domain/usecase/request_news_chat_use_case.dart';
import '../big_kinds/big_kinds_controller.dart';

/// 빅카인즈 페이지 컨트롤러를 위한 Provider 생성
ChangeNotifierProvider<BigKindsController> createBigKindsProvider({
  String? initialPrompt,
  required Widget child,
}) {
  return ChangeNotifierProvider<BigKindsController>(
    create: (_) => BigKindsController(
      requestNewsChatUseCase: locator<RequestNewsChatUseCase>(),
      initialPrompt: initialPrompt,
    ),
    child: child,
  );
}
