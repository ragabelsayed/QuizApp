import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/palette.dart';
import '../../config/constants.dart';
import '../../widgets/rounded_btn.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routName = '/reset_pass';
  const ResetPasswordScreen({Key? key}) : super(key: key);

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
                // Text(
                //   'Forgot Your Password?',
                //   style: Theme.of(context).textTheme.headline4?.copyWith(
                //       color: Colors.white, fontWeight: FontWeight.bold),
                // ),
                // const Text(
                //     'Enter the email address associated with\n your account'),
                // const SizedBox(height: 15),
                // const TextField(
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Palette.backgroundColor,
                //     hintText: 'Email',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(12)),
                //     ),
                //   ),
                // ),
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
        ],
      ),
    );
  }
}
