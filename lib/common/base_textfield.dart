import 'package:flutter/material.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';

class BaseTextField extends TextFormField {
  BaseTextField({
    Key? key,
    InputDecoration decoration = const InputDecoration(),
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    bool autofocus = false,
    bool obscureText = false,
    bool autocorrect = true,
    int? maxLines,
    int? minLines,
    bool expands = false,
    bool enabled = true,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    String? hintText,
    Color? fillColor = AppColor.tfBackground,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) : super(
          key: key,
          decoration: decoration.copyWith(
            contentPadding: const EdgeInsets.symmetric(
              vertical: Sizes.p10,
              horizontal: Sizes.p12,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: Sizes.p14,
              color: AppColor.lbSecondary,
            ),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Sizes.p8), // Change border radius here
            ),
            suffixIcon: suffixIcon,
          ),
          style: const TextStyle(color: AppColor.white, fontSize: Sizes.p14),
          cursorColor: AppColor.white,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          enabled: enabled,
          onEditingComplete: onEditingComplete,
          onChanged: onChanged,
          validator: validator,
          onTap: onTap,
        );
}
