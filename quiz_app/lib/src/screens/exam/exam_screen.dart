import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/palette.dart';
import 'package:quiz_app/src/config/utils.dart';
import 'package:quiz_app/src/provider/exam_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/widgets/item_view.dart';
import '../../config/constants.dart';
import 'widget/add_subject_btn.dart';
import 'widget/quiz_input_form.dart';

class ExamScreen extends ConsumerStatefulWidget {
  static const routName = '/exam';
  const ExamScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends ConsumerState<ExamScreen> {
  @override
  void initState() {
    ref.read(examProvider.notifier).fetchExamsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  imagePath: 'assets/icons/exam.png',
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
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            right: 20,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(), primary: Palette.primaryColor1),
              icon: const Icon(Icons.save),
              label: const Text('Save'),
              onPressed: () => _saveExams(),
            ),
          ),
        ],
      ),
      floatingActionButton: const AddSubjectBtn(),
    );
  }

  Future<void> _saveExams() async {
    showDialog(
      context: context,
      builder: (ctx) => const Center(
        child: CircularProgressIndicator(
          color: Palette.primaryColor1,
        ),
      ),
    );
    try {
      await ref.read(examProvider.notifier).saveAllExams();
      Utils.showSnackBar('All saved Successfully 👌');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      Navigator.pop(context);
    }
  }
}
