import 'package:flutter/material.dart';
import 'package:quiz_app/src/screens/login/login_screen.dart';
import '../../config/constants.dart';
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
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            left: 10,
            child: IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, LoginScreen.routName),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
