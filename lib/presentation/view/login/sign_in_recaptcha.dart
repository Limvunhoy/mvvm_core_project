import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_core_project/constants/app_color.dart';
import 'package:mvvm_core_project/constants/gap.dart';

class SignInRecaptcha extends StatelessWidget {
  final VoidCallback onLearnMoreTap;

  const SignInRecaptcha({Key? key, required this.onLearnMoreTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Sign in is protected by Google reCAPTCHA to\n",
              style: TextStyle(
                fontSize: Sizes.p12,
                color: AppColor.lbSecondary,
              ),
            ),
            const TextSpan(
              text: "ensure your're not a bot.",
              style: TextStyle(
                fontSize: Sizes.p12,
                color: AppColor.lbSecondary,
              ),
            ),
            TextSpan(
              text: " Learn More.",
              style: const TextStyle(
                fontSize: Sizes.p12,
                color: AppColor.lbSecondary,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()..onTap = onLearnMoreTap,
            ),
          ],
        ),
      ),
    );
  }
}
