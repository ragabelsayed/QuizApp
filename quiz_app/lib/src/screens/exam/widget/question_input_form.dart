import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../models/question.dart';
import '../../../provider/exam_provider.dart';
import '../../../widgets/input_title.dart';
import '../../../widgets/rounded_btn.dart';
import 'input_text.dart';

class QuestionForm extends ConsumerStatefulWidget {
  static const routName = '/question_form';
  final String? examId;
  const QuestionForm({Key? key, this.examId}) : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends ConsumerState<QuestionForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> quiz = {
    'question': '',
    'op1': '',
    'op2': '',
    'op3': '',
    'op4': '',
    'op5': '',
    'answer': 0,
  };
  Future<void> _saveForm() async {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      try {
        ref.read(examProvider.notifier).addQuestionToExam(
            widget.examId!,
            Question(
              id: DateTime.now().toIso8601String(),
              question: quiz['question'],
              options: [
                quiz['op1'],
                quiz['op2'],
                quiz['op3'],
                quiz['op4'],
                quiz['op5'],
              ],
              answer: quiz['answer'],
            ));

        Navigator.of(context).pop();
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Add new Quiz',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(height: 15),
                      const InputTitle(title: 'Question:'),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'What ....... ?',
                        onSave: (value) => quiz['question'] = value,
                      ),
                      const SizedBox(height: 15),
                      const InputTitle(title: 'Options:'),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'option 0',
                        onSave: (value) => quiz['op1'] = value,
                      ),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'option 1',
                        onSave: (value) => quiz['op2'] = value,
                      ),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'option 2',
                        onSave: (value) => quiz['op3'] = value,
                      ),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'option 3',
                        onSave: (value) => quiz['op4'] = value,
                      ),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'option 4',
                        onSave: (value) => quiz['op5'] = value,
                      ),
                      const SizedBox(height: 15),
                      const InputTitle(title: 'Answer:'),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-4]'))
                        ],
                        decoration: const InputDecoration(
                          fillColor: Palette.backgroundColor,
                          filled: true,
                          hintText: 'Option number from 0 to 4.',
                          border: AppConstants.border,
                          errorBorder: AppConstants.errorBorder,
                          focusedBorder: AppConstants.focusedBorder,
                        ),
                        validator: (newValue) {
                          if (newValue!.isEmpty) {
                            return 'Please Enter your value';
                          }
                        },
                        onSaved: (value) => quiz['answer'] = value,
                      ),
                      const SizedBox(height: 30),
                      RoundedBtn(
                        text: 'Add Question',
                        padding: AppConstants.defaultPadding,
                        onPress: () => _saveForm(),
                      ),
                      const SizedBox(height: 30),
                    ],
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
    );
  }
}
