import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';
import '../../config/utils.dart';
import '../../provider/auth_provider.dart';
import '../../widgets/custom_back_btn.dart';
import '../../widgets/rounded_btn.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routName = '/forgot_pass';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
        await Auth.resetPassword(emailController.text.trim());
        Utils.showSnackBar('Password Reset Email Sent');
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
        Navigator.pop(context);
      } catch (e) {}
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
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
                    'Receive an email to reset your password',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
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
                      if (!AppConstants.emailValidatorRegExp
                          .hasMatch(newValue)) {
                        return 'Please enter valid email';
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  RoundedBtn(
                    text: '✉️   Reset Password',
                    padding: AppConstants.defaultPadding,
                    onPress: () => _saveForm(),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
          const CustomBackBtn(),
        ],
      ),
    );
  }
}
