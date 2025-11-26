import 'dart:async';

import 'package:flutter/material.dart';

extension CompleterExtension on Completer {
  void safeComplete([FutureOr<dynamic>? value]) {
    if (!isCompleted) complete(value);
  }
}

extension ContextExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
