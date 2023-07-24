import 'package:flutter/material.dart';
import 'package:mvvm_core_project/common/base_button.dart';
import 'package:mvvm_core_project/common/base_text.dart';
import 'package:mvvm_core_project/common/base_text_button.dart';
import 'package:mvvm_core_project/common/base_textfield.dart';
import 'package:mvvm_core_project/common/base_view.dart';
import 'package:mvvm_core_project/common/base_widget.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';
import 'package:mvvm_core_project/core/locator.dart';
import 'package:mvvm_core_project/presentation/view/login/sign_in_recaptcha.dart';
import 'package:mvvm_core_project/presentation/viewmodel/login_viewmodel.dart';

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
      child: BaseWidget<LoginViewModel>(
        onModelReady: (viewmodel) {},
        model: locator.get<LoginViewModel>(),
        builder: (context, viewmodel, child) {
          return Padding(
            padding: const EdgeInsets.all(Sizes.p32),
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BaseTextField(
                    controller: viewmodel.txtUsernameController,
                    hintText: "Username",
                    maxLines: 1,
                    onChanged: viewmodel.onUsernameTextChanged,
                    validator: viewmodel.validateUsername,
                  ),
                  gapH16,
                  BaseTextField(
                    controller: viewmodel.txtPasswordController,
                    hintText: "Password",
                    obscureText: viewmodel.isHidePassword,
                    maxLines: 1,
                    onChanged: viewmodel.onPasswordTextChanged,
                    validator: viewmodel.validatePassword,
                    suffixIcon: BaseTextButton(
                      child: BaseText(
                        viewmodel.isHidePassword ? "SHOW" : "HIDE",
                      ),
                      onPressed: () {
                        viewmodel.onTogglePassword();
                      },
                    ),
                  ),
                  gapH20,
                  BaseButton(
                    child: const BaseText("Sign In"),
                    onPressed: viewmodel.enableSignInButton
                        ? () {
                            viewmodel.onLogin();
                          }
                        : null,
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
            ),
          );
        },
      ),
    );
  }
}
