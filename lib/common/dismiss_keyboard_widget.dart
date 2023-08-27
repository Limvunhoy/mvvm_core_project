import 'package:flutter/material.dart';

class DismissKeyboardWidget extends StatelessWidget {
  const DismissKeyboardWidget({Key? key, required this.child, this.onTap});

  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        print("Dismiss Keyboard");
        // FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
