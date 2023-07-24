import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_core_project/common/base_icon_button.dart';
import 'package:mvvm_core_project/common/base_text.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/core/app_route.dart';
import 'package:mvvm_core_project/utilities/extension%20/text_theme_extension.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Widget? title;
  final String? displayTitle;
  final Widget? leading;
  final bool? showLeading;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final bool? centerTitle;
  final bool automaticallyImplyLeading;
  final VoidCallback? onBackPressed;
  const BaseView({
    Key? key,
    required this.child,
    this.backgroundColor = AppColor.secondary,
    this.displayTitle,
    this.title,
    this.leading,
    this.showLeading = true,
    this.actions,
    this.bottomNavigationBar,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backButton = BaseIconButton(
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios_new_rounded : Icons.arrow_back_rounded,
        color: AppColor.white,
      ),
      onPressed: onBackPressed ??
          () {
            context.pop();
          },
    );

    var appBar = AppBar(
      title: title ??
          BaseText(
            displayTitle ?? "",
            style: context.title18,
          ),
      leading: (automaticallyImplyLeading && leading == null) ? backButton : null,
      actions: actions,
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
