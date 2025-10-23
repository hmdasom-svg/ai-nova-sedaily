import 'package:flutter/material.dart';

class NoBounceScrollBehavior extends MaterialScrollBehavior {
  const NoBounceScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
