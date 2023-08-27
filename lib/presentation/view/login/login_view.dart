import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_core_project/common/base_button.dart';
import 'package:mvvm_core_project/common/base_text.dart';
import 'package:mvvm_core_project/common/base_text_button.dart';
import 'package:mvvm_core_project/common/base_textfield.dart';
import 'package:mvvm_core_project/common/base_view.dart';
import 'package:mvvm_core_project/common/base_widget.dart';
import 'package:mvvm_core_project/common/dismiss_keyboard_widget.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';
import 'package:mvvm_core_project/core/app_route.dart';
import 'package:mvvm_core_project/core/locator.dart';
import 'package:mvvm_core_project/presentation/view/login/sign_in_recaptcha.dart';
import 'package:mvvm_core_project/presentation/viewmodel/login_viewmodel.dart';
import 'package:mvvm_core_project/utilities/extension%20/text_theme_extension.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("$this Rebuild");
    return DismissKeyboardWidget(
      child: BaseView(
        centerTitle: true,
        displayTitle: "Login",
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: BaseTextButton(
              child: const BaseText("Help"),
              onPressed: () {
                context.push(AppRoute.home);
              },
            ),
          ),
        ],
        backgroundColor: AppColor.background,
        child: BaseWidget<LoginViewModel>(
          onModelReady: (viewModel) {},
          model: locator.get<LoginViewModel>(),
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(Sizes.p32),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BaseTextField(
                      controller: viewModel.txtUsernameController,
                      hintText: "Username",
                      maxLines: 1,
                      onChanged: viewModel.onUsernameTextChanged,
                      validator: viewModel.validateUsername,
                    ),
                    gapH16,
                    BaseTextField(
                      controller: viewModel.txtPasswordController,
                      hintText: "Password",
                      obscureText: viewModel.isHidePassword,
                      maxLines: 1,
                      onChanged: viewModel.onPasswordTextChanged,
                      validator: viewModel.validatePassword,
                      suffixIcon: BaseTextButton(
                        child: BaseText(
                          viewModel.isHidePassword ? "SHOW" : "HIDE",
                        ),
                        onPressed: () {
                          viewModel.onTogglePassword();
                        },
                      ),
                    ),
                    gapH20,
                    BaseButton(
                      child: const BaseText("Sign In"),
                      onPressed: viewModel.enableSignInButton
                          ? () {
                              // viewModel.onLogin();
                              viewModel.onGenerateToken();
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
      ),
    );
  }
}
