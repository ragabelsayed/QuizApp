import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../../../widgets/item_view.dart';
import '../../exam/exam_screen.dart';
import '../../student_board/student_board_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
          ),
        ),
      ],
    );
  }
}
