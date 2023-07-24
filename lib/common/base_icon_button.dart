import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/platform_base.dart';

class BaseIconButton extends PlatformBaseWidget<IconButton, CupertinoButton> {
  // final Key? widgetKey;
  final Widget icon;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final MaterialIconButtonData? materialData;
  final CupertinoButtonData? cupertinoData;

  const BaseIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.padding,
    this.materialData,
    this.cupertinoData,
  }) : super(key: key);

  @override
  IconButton createMaterialWidget(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      padding: padding ?? const EdgeInsets.all(8),
      constraints: materialData?.constraints,
      splashColor: materialData?.splashColor,
      highlightColor: materialData?.highlightColor,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      key: key,
      onPressed: onPressed,
      padding: padding,
      minSize: cupertinoData?.minSize,
      alignment: cupertinoData?.alignment ?? Alignment.center,
      child: icon,
    );
  }
}

class MaterialIconButtonData {
  const MaterialIconButtonData({
    this.constraints,
    this.splashColor,
    this.highlightColor,
  });

  final BoxConstraints? constraints;
  final Color? splashColor;
  final Color? highlightColor;
}

class CupertinoButtonData {
  const CupertinoButtonData({
    this.minSize,
    this.alignment,
  });

  final double? minSize;
  final AlignmentGeometry? alignment;
}
