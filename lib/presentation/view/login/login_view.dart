import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/base_button.dart';
import 'package:mvvm_core_project/common/base_text.dart';
import 'package:mvvm_core_project/common/base_text_button.dart';
import 'package:mvvm_core_project/common/base_textfield.dart';
import 'package:mvvm_core_project/common/base_view.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';
import 'package:mvvm_core_project/presentation/view/login/sign_in_recaptcha.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("$this Rebuild");
    return BaseView(
        centerTitle: true,
        title: const Text("MVVM Core Project"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: BaseTextButton(
              child: const BaseText("Help"),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: AppColor.background,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseTextField(
                hintText: "Username",
                maxLines: 1,
                onChanged: (value) {},
              ),
              gapH16,
              BaseTextField(
                hintText: "Password",
                obscureText: true,
                maxLines: 1,
                onChanged: (value) {},
                suffixIcon: BaseTextButton(
                  child: const BaseText("SHOW"),
                  onPressed: () {},
                ),
              ),
              gapH20,
              BaseButton(
                child: const BaseText("Sign In"),
                onPressed: () {},
              ),
              gapH8,
              BaseTextButton(
                child: const BaseText("Recover Password"),
                onPressed: () {},
              ),
              gapH8,
              SignInRecaptcha(
                onLearnMoreTap: () {},
              ),
            ],
          ),
        ));
  }
}
