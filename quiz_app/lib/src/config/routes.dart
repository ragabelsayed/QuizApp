import 'package:flutter/material.dart';
import '../screens/exam/exam_screen.dart';
import '../screens/exam/widget/question_input_form.dart';
import '../screens/home/home_screen.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/reset_password/forgot_password_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/student_board/student_board_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    WelcomeScreen.routName: (ctx) => const WelcomeScreen(),
    LoginScreen.routName: (ctx) => const LoginScreen(),
    SignupScreen.routName: (ctx) => const SignupScreen(),
    ForgotPasswordScreen.routName: (ctx) => const ForgotPasswordScreen(),
    HomeScreen.routName: (cxt) => const HomeScreen(),
    ExamScreen.routName: (ctx) => const ExamScreen(),
    QuestionForm.routName: (cxt) => const QuestionForm(),
    StudentBoardScreen.routName: (cxt) => const StudentBoardScreen(),
    QuizScreen.routName: (context) => const QuizScreen(),
  };
}
