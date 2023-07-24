import 'package:flutter/material.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';

class BaseText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final double fonside;
  final FontWeight? fontWeight;
  final Color color;

  const BaseText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.fonside = Sizes.p12,
    this.fontWeight,
    this.color = AppColor.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      key: key,
      style: style ??
          Theme.of(context).textTheme.titleSmall?.copyWith(
                color: color,
                fontSize: fonside,
                fontWeight: fontWeight,
              ),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}
