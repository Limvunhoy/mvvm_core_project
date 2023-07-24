import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/base_text.dart';
import 'package:mvvm_core_project/common/base_view.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';
import 'package:mvvm_core_project/utilities/extension%20/text_theme_extension.dart';

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: BaseText(
        "Unknown Route",
        style: context.title18,
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: AppColor.primary,
                size: 48.0,
              ),
              gapH16,
              BaseText(
                "Opp...! Something went wrong",
                style: context.title18,
              ),
              gapH8,
              const BaseText("This screen is currently not available.")
            ],
          ),
        ),
      ),
    );
  }
}
