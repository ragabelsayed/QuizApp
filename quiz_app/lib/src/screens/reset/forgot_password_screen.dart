import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';
import '../../widgets/rounded_btn.dart';
import '../login/login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routName = '/forgot_pass';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Text(
                  'Forgot Your Password?',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                    'Enter the email address associated with\n your account',
                    textAlign: TextAlign.center),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Palette.backgroundColor,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const Spacer(),
                RoundedBtn(
                  text: 'Verfiy Email',
                  padding: AppConstants.defaultPadding,
                  onPress: () {},
                ),
                const Spacer(flex: 2),
              ],
            ),
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
