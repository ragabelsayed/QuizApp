import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/utils.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../provider/auth_provider.dart';
import '../../../widgets/rounded_btn.dart';
import '../../home/home_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();

  Future<void> _saveForm() async {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (ctx) => const Center(
          child: CircularProgressIndicator(
            color: Palette.primaryColor1,
          ),
        ),
      );
      try {
        await Auth.signUp(
            emailController.text.trim(), passController.text.trim());
        Navigator.pushNamed(context, HomeScreen.routName);
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
        Navigator.pop(context);
      } catch (e) {}
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    cPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(
              'Welcome',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text('Signup'),
            const Spacer(),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Palette.backgroundColor,
                hintText: 'Email',
                border: AppConstants.border,
                errorBorder: AppConstants.errorBorder,
                focusedBorder: AppConstants.focusedBorder,
              ),
              validator: (newValue) {
                if (newValue!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!AppConstants.emailValidatorRegExp.hasMatch(newValue)) {
                  return 'Please enter valid email';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                fillColor: Palette.backgroundColor,
                filled: true,
                hintText: 'Passoword',
                border: AppConstants.border,
                errorBorder: AppConstants.errorBorder,
                focusedBorder: AppConstants.focusedBorder,
              ),
              validator: (newValue) {
                if (newValue!.isEmpty) {
                  return 'Please enter your password';
                }
                if (newValue.length <= 6) {
                  return 'Password must be at least 6 characters';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: cPassController,
              obscureText: true,
              decoration: const InputDecoration(
                fillColor: Palette.backgroundColor,
                filled: true,
                hintText: 'Confirm Passoword',
                border: AppConstants.border,
                errorBorder: AppConstants.errorBorder,
                focusedBorder: AppConstants.focusedBorder,
              ),
              validator: (newValue) {
                if (newValue!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (passController.text != cPassController.text) {
                  return "Your password does not match";
                }
              },
            ),
            const Spacer(),
            RoundedBtn(
              text: 'Signup',
              padding: AppConstants.defaultPadding,
              onPress: () => _saveForm(),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
