import 'package:flutter/material.dart';
import 'package:quiz_app/src/screens/reset/forgot_password_screen.dart';
import 'package:quiz_app/src/screens/reset/reset_password_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    WelcomeScreen.routName: (ctx) => const WelcomeScreen(),
    LoginScreen.routName: (ctx) => const LoginScreen(),
    SignupScreen.routName: (ctx) => const SignupScreen(),
    ForgotPasswordScreen.routName: (ctx) => const ForgotPasswordScreen(),
    ResetPasswordScreen.routName: (ctx) => const ResetPasswordScreen(),
  };
}
