import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/screens/quiz/quiz_screen.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../config/utils.dart';
import '../../../provider/exam_provider.dart';
import '../../../provider/quetion_provider.dart';
import '../../../widgets/item_view.dart';
import '../../welcome/welcome_screen.dart';

class StudentHome extends ConsumerWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examList = ref.watch(futureExamsProvider);
    return Stack(
      fit: StackFit.expand,
      children: [
        AppConstants.imageBackground,
        SafeArea(
          child: examList.when(
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: Palette.primaryColor2,
                backgroundColor: Palette.kGrayColor,
              ),
            ),
            error: (error, stackTrace) =>
                Utils.showSnackBar('Something wrong happened'),
            data: (exams) => ListView.builder(
              itemCount: exams.length,
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: 40,
              ),
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ItemView(
                  title: exams[i].subject,
                  subTitle: '${exams[i].question.length} Question',
                  imagePath: 'assets/icons/exam.png',
                  onPress: () {
                    ref.read(questionProvider.notifier).getQuestions(exams[i]);
                    Navigator.pushNamed(context, QuizScreen.routName);
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).viewPadding.top,
          right: 10,
          child: TextButton.icon(
            style: TextButton.styleFrom(primary: Palette.primaryColor1),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              WelcomeScreen.routName,
              (route) => false,
            ),
            icon: const Icon(Icons.exit_to_app),
            label: const Text('LogOut'),
          ),
        ),
      ],
    );
  }
}
