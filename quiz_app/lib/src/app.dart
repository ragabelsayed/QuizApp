import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/routes.dart';
import 'package:quiz_app/src/config/utils.dart';
import 'screens/welcome/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Demo',
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
      routes: AppRoutes.routes,
    );
  }
}
