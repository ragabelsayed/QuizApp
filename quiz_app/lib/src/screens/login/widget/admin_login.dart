import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/widgets/custom_back_btn.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../config/utils.dart';
import '../../../provider/auth_provider.dart';
import '../../../widgets/rounded_btn.dart';
import '../../home/home_screen.dart';
import '../../reset_password/forgot_password_screen.dart';
import '../../signup/signup_screen.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPassowrdVisible = true;

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
        await Auth.signIn(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
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
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppConstants.imageBackground,
        SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text('Login'),
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
                      if (!AppConstants.emailValidatorRegExp
                          .hasMatch(newValue)) {
                        return 'Please enter valid email';
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _isPassowrdVisible,
                    controller: passwordController,
                    decoration: InputDecoration(
                      fillColor: Palette.backgroundColor,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Palette.primaryColor1,
                      ),
                      hintText: 'passoword',
                      suffixIcon: IconButton(
                        icon: _isPassowrdVisible
                            ? const Icon(
                                Icons.visibility_off,
                                color: Palette.primaryColor2,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Palette.primaryColor2,
                              ),
                        onPressed: () => setState(
                          () => _isPassowrdVisible = !_isPassowrdVisible,
                        ),
                      ),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, ForgotPasswordScreen.routName),
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Palette.kGrayColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  RoundedBtn(
                    text: 'Login',
                    padding: AppConstants.defaultPadding,
                    onPress: () => _saveForm(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text("Don't have account? "),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          SignupScreen.routName,
                        ),
                        style: TextButton.styleFrom(
                          primary: Palette.kGreenColor,
                        ),
                        child: const Text('SignUp'),
                      )
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
        const CustomBackBtn(),
      ],
    );
  }
}
