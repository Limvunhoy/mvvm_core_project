import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/platform_base.dart';

class BaseTextButton extends PlatformBaseWidget<TextButton, CupertinoButton> {
  final Widget child;
  final VoidCallback onPressed;
  final MaterialTextButtonData? materialData;
  final CupertinoTextButtonData? cupertinoData;

  const BaseTextButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.materialData,
    this.cupertinoData,
  }) : super(key: key);

  @override
  TextButton createMaterialWidget(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: materialData?.onLongPress,
      style: materialData?.style,
      child: child,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      key: key,
      onPressed: onPressed,
      color: cupertinoData?.color,
      padding: cupertinoData?.padding,
      borderRadius: cupertinoData?.borderRadius,
      minSize: cupertinoData?.minSize,
      child: child,
    );
  }
}

class MaterialTextButtonData {
  const MaterialTextButtonData({
    this.onLongPress,
    this.style,
  });

  final VoidCallback? onLongPress;
  final ButtonStyle? style;
}

class CupertinoTextButtonData {
  const CupertinoTextButtonData({
    this.color,
    this.padding,
    this.borderRadius,
    this.minSize,
  });

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? minSize;
}
