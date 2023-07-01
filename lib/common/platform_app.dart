import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/platform_base.dart';

class PlatformApp extends PlatformBaseWidget<MaterialApp, CupertinoApp> {
  final TransitionBuilder? builder;
  final String title;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner;
  final Widget? home;
  final MaterialAppData? materialData;
  final CupertinoAppData? cupertinoData;

  const PlatformApp({
    Key? key,
    this.builder,
    required this.title,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowCheckedModeBanner = true,
    this.home,
    this.materialData,
    this.cupertinoData,
  }) : super(key: key);

  @override
  MaterialApp createMaterialWidget(BuildContext context) {
    return MaterialApp(
      key: key,
      builder: builder,
      title: title,
      color: color,
      theme: materialData?.theme ?? Theme.of(context),
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      home: home,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }

  @override
  CupertinoApp createCupertinoWidget(BuildContext context) {
    return CupertinoApp(
      key: key,
      builder: builder,
      title: title,
      color: color,
      theme: cupertinoData?.theme,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      home: home,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }
}

class MaterialAppData {
  const MaterialAppData({
    this.theme,
  });

  final ThemeData? theme;
}

class CupertinoAppData {
  const CupertinoAppData({
    this.theme,
  });

  final CupertinoThemeData? theme;
}
