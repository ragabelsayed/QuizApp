import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/src/screens/signup/signup_screen.dart';
import '/src/widgets/rounded_btn.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';

class LoginScreen extends StatefulWidget {
  static const routName = '/log_in';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPassowrdVisible = true;
  Map<String, String> _userData = {'name': '', 'password': ''};

  Future<void> _saveForm() async {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      try {} catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Palette.backgroundColor,
                        hintText: "Full Name",
                        border: AppConstants.border,
                        errorBorder: AppConstants.errorBorder,
                        focusedBorder: AppConstants.focusedBorder,
                      ),
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return 'قُمْ بإدخال الإسم رجاءً';
                        }
                      },
                      onSaved: (newValue) => _userData['name'] = newValue!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: _isPassowrdVisible,
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
                          return 'قُمْ بإدخال كلمة السر رجاءً';
                        }
                        if (newValue.length <= 4) {
                          return 'كلمة السر أقل من 4 حروف';
                        }
                      },
                      onSaved: (newValue) => _userData['password'] = newValue!,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
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
                              context, SignupScreen.routName),
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
        ],
      ),
    );
  }
}
