import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/palette.dart';
import 'package:quiz_app/src/screens/exam/exam_screen.dart';
import 'package:quiz_app/src/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/src/widgets/item_view.dart';
import '../../config/constants.dart';
import '../../provider/auth_provider.dart';
import '../student_board/student_board_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemView(
                  title: 'Exams',
                  subTitle: 'Hit there, good luck with quiz 😁',
                  imagePath: 'assets/icons/exam.png',
                  onPress: () =>
                      Navigator.pushNamed(context, ExamScreen.routName),
                ),
                const SizedBox(height: 15),
                ItemView(
                  title: 'Students',
                  subTitle: 'Students list with there score',
                  imagePath: 'assets/icons/student.png',
                  onPress: () =>
                      Navigator.pushNamed(context, StudentBoardScreen.routName),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            right: 10,
            child: TextButton.icon(
              style: TextButton.styleFrom(primary: Palette.primaryColor1),
              onPressed: () async {
                await Auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  WelcomeScreen.routName,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('LogOut'),
            ),
          ),
        ],
      ),
    );
  }
}
