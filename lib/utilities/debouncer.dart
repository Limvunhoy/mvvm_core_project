import 'dart:async';

import 'package:flutter/foundation.dart';

/// This class used to perform run thread delay
class Debouncer {
  VoidCallback? action;
  static Timer? _debounce;

  static run({required int milliseconds, required VoidCallback action}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: milliseconds), action);
  }
}
