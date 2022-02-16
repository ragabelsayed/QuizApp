import 'package:flutter/material.dart';
import 'package:quiz_app/src/screens/login/login_screen.dart';
import 'package:quiz_app/src/widgets/rounded_btn.dart';
import '/src/config/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const routName = 'welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Text(
                  'Welcome to Quiz app,',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text('Who are you'),
                const Spacer(),
                RoundedBtn(
                  text: 'Admin',
                  padding: AppConstants.defaultPadding,
                  onPress: () =>
                      Navigator.pushNamed(context, LoginScreen.routName),
                ),
                const SizedBox(height: 15),
                RoundedBtn(
                    text: 'Student',
                    padding: AppConstants.defaultPadding,
                    onPress: () {
                      print(1);
                    }),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
