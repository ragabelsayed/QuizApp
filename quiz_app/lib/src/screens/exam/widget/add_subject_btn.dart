import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/models/exam.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../provider/exam_provider.dart';
import '../../../widgets/input_title.dart';
import '../../../widgets/rounded_btn.dart';

class AddSubjectBtn extends ConsumerStatefulWidget {
  const AddSubjectBtn({Key? key}) : super(key: key);

  @override
  _AddSubjectBtnState createState() => _AddSubjectBtnState();
}

class _AddSubjectBtnState extends ConsumerState<AddSubjectBtn> {
  TextEditingController _subjectController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Palette.primaryColor1,
      foregroundColor: Colors.white,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => Dialog(
            backgroundColor: Palette.backgroundColor,
            child: StatefulBuilder(
              builder: (context, setState) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const InputTitle(title: 'Subject:'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Palette.primaryColor1,
                        hintText: 'Math, Science, Tech ...etc',
                        errorText:
                            _validate ? 'Enter your subject first' : null,
                        border: AppConstants.border,
                        errorBorder: AppConstants.errorBorder,
                        focusedBorder: AppConstants.focusedBorder,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundedBtn(
                      text: 'Save',
                      padding: AppConstants.defaultPadding,
                      onPress: () {
                        if (_subjectController.text.isEmpty) {
                          setState(() => _validate = true);
                        } else {
                          ref.read(examProvider.notifier).addExam(
                                Exam(
                                  id: DateTime.now().toIso8601String(),
                                  subject: _subjectController.text,
                                  question: [],
                                ),
                              );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      label: const Icon(Icons.quiz),
    );
  }
}
