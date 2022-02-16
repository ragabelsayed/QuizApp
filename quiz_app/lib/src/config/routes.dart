import 'package:flutter/material.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    WelcomeScreen.routName: (ctx) => const WelcomeScreen(),
    LoginScreen.routName: (ctx) => const LoginScreen(),
    SignupScreen.routName: (ctx) => const SignupScreen(),
  };
}
