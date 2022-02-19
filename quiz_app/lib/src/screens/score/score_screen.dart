import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/models/student.dart';
import 'package:quiz_app/src/provider/students_provider.dart';
import 'package:quiz_app/src/screens/home/home_screen.dart';
import 'package:quiz_app/src/widgets/rounded_btn.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';
import '../../config/utils.dart';
import '../../provider/quetion_provider.dart';
import '../welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  static const routName = '/score';
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          Consumer(
            builder: (context, ref, child) {
              final score = ref.watch(scoreProvider);
              final totalQuetion = ref.watch(questionProvider).length;
              final subject = ref.watch(questionProvider.notifier).lastExam;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                ),
                child: Column(
                  children: [
                    const Spacer(flex: 3),
                    Text(
                      "Score",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Palette.kSecondaryColor),
                    ),
                    const Spacer(),
                    Text(
                      "${score * 10}/${totalQuetion * 10}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Palette.kSecondaryColor),
                    ),
                    const Spacer(),
                    RoundedBtn(
                      text: 'Save',
                      padding: AppConstants.defaultPadding,
                      onPress: () async {
                        showDialog(
                          context: context,
                          builder: (ctx) => const Center(
                            child: CircularProgressIndicator(
                              color: Palette.primaryColor1,
                            ),
                          ),
                        );
                        try {
                          await ref
                              .read(studentProvider.notifier)
                              .addStudentScore(Result(
                                subject: subject,
                                result: "${score * 10}/${totalQuetion * 10}",
                              ));
                          Utils.showSnackBar('All saved Successfully 👌');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routName,
                            (route) => false,
                          );
                        } on FirebaseAuthException catch (e) {
                          Utils.showSnackBar(e.message);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routName,
                            (route) => false,
                          );
                        }
                      },
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routName),
            ),
          ),
        ],
      ),
    );
  }
}
