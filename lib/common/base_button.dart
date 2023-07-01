import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/platform_base.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';

class BaseButton extends PlatformBaseWidget<ElevatedButton, CupertinoTheme> {
  final Widget child;
  final VoidCallback? onPressed;
  final MaterialElevatedButtonData? materialData;
  final CupertinoElevatedButtonData? cupertinoData;

  const BaseButton({Key? key, required this.child, this.onPressed, this.materialData, this.cupertinoData})
      : super(key: key);

  @override
  ElevatedButton createMaterialWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: materialData?.onLongPress,
      style: materialData?.style ??
          ElevatedButton.styleFrom(
            primary: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p8),
            ),
          ),
      child: child,
    );
  }

  @override
  CupertinoTheme createCupertinoWidget(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(
        primaryColor: cupertinoData?.color ?? AppColor.primary,
      ),
      child: CupertinoButton.filled(
        key: key,
        onPressed: onPressed,
        padding: cupertinoData?.padding,
        borderRadius: cupertinoData?.borderRadius ?? BorderRadius.circular(Sizes.p8),
        minSize: cupertinoData?.minSize,
        child: child,
      ),
    );
  }
}

class MaterialElevatedButtonData {
  const MaterialElevatedButtonData({
    this.onLongPress,
    this.style,
  });

  final VoidCallback? onLongPress;
  final ButtonStyle? style;
}

class CupertinoElevatedButtonData {
  const CupertinoElevatedButtonData({
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
