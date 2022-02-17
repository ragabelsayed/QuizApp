import 'package:flutter/material.dart';
import 'package:quiz_app/src/provider/exam_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/widgets/item_view.dart';
import 'package:quiz_app/src/widgets/rounded_btn.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';
import '../../widgets/input_title.dart';
import 'widget/add_subject_btn.dart';
import 'widget/quiz_input_form.dart';

class ExamScreen extends ConsumerWidget {
  static const routName = '/exam';
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exams = ref.watch(examProvider);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          SafeArea(
            child: ListView.builder(
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
                  onPress: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizForm(examId: exams[i].id),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            left: 10,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
      floatingActionButton: const AddSubjectBtn(),
    );
  }
}
  // floatingActionButton: FloatingActionButton.extended(
  //         backgroundColor: Palette.primaryColor1,
  //         foregroundColor: Colors.white,
  //         onPressed: () => Navigator.pushNamed(context, ExamForm.routName),
  //         label: Icon(Icons.quiz)),
  //   );