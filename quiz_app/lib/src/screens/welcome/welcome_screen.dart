import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/config/enums.dart';
import 'package:quiz_app/src/config/palette.dart';
import 'package:quiz_app/src/screens/home/home_screen.dart';
import 'package:quiz_app/src/screens/login/login_screen.dart';
import 'package:quiz_app/src/widgets/rounded_btn.dart';
import '/src/config/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const routName = 'welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Stack(fit: StackFit.expand, children: [
              AppConstants.imageBackground,
              const Center(
                  child: CircularProgressIndicator(
                color: Palette.primaryColor2,
              )),
            ]),
          );
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                AppConstants.imageBackground,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding),
                  child: Consumer(
                    builder: (context, ref, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 2),
                        Text(
                          'Welcome to Quiz app,',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Text('Who are you'),
                        const Spacer(),
                        RoundedBtn(
                          text: 'Admin',
                          padding: AppConstants.defaultPadding,
                          onPress: () {
                            ref.read(userProvider.state).state = User.admin;
                            Navigator.pushNamed(context, LoginScreen.routName);
                          },
                        ),
                        const SizedBox(height: 15),
                        RoundedBtn(
                          text: 'Student',
                          padding: AppConstants.defaultPadding,
                          onPress: () {
                            ref.read(userProvider.state).state = User.student;
                            Navigator.pushNamed(context, LoginScreen.routName);
                          },
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
