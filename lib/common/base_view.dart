import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/base_icon_button.dart';
import 'package:mvvm_core_project/constants/app_color.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final bool? showLeading;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final bool? centerTitle;
  const BaseView({
    Key? key,
    required this.child,
    this.backgroundColor = AppColor.secondary,
    this.title,
    this.leading,
    this.showLeading = true,
    this.actions,
    this.bottomNavigationBar,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backButton = BaseIconButton(
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios_new_rounded : Icons.arrow_back_rounded,
        color: AppColor.white,
      ),
      onPressed: () {},
    );

    var appBar = AppBar(
      title: title,
      leading: showLeading! ? leading ?? backButton : null,
      actions: actions,
      centerTitle: centerTitle,
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
