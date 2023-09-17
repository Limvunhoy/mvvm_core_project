import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  // Headline
  TextStyle? get h1 => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get h2 => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get h3 => Theme.of(this).textTheme.headlineSmall;

  // Subtitle
  TextStyle? get title18 => Theme.of(this).textTheme.titleLarge;
  TextStyle? get title16 => Theme.of(this).textTheme.titleMedium;
  TextStyle? get title14 => Theme.of(this).textTheme.titleSmall;

  // Label with utilitarian styles
  TextStyle? get body16 => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get body14 => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get body12 => Theme.of(this).textTheme.bodySmall;

  // Label with utilitarian styles
  TextStyle? get lb16 => Theme.of(this).textTheme.labelLarge;
  TextStyle? get lb14 => Theme.of(this).textTheme.labelMedium;
  TextStyle? get lb12 => Theme.of(this).textTheme.labelSmall;
}
