import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../widgets/custom_back_btn.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  static const routName = '/sign_up';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          const SafeArea(
            child: SignupForm(),
          ),
          const CustomBackBtn(),
        ],
      ),
    );
  }
}
