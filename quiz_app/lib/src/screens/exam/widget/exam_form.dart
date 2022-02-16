import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/src/screens/exam/widget/input_text.dart';
import 'package:quiz_app/src/widgets/input_title.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../widgets/rounded_btn.dart';

class ExamForm extends StatefulWidget {
  static const routName = '/exam_form';
  const ExamForm({Key? key}) : super(key: key);

  @override
  State<ExamForm> createState() => _ExamFormState();
}

class _ExamFormState extends State<ExamForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> quiz = {
    'subject': '',
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
      try {} catch (e) {}
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
                      const InputTitle(title: 'Subject:'),
                      const SizedBox(height: 10),
                      InputText(
                        hint: 'Math, Science, Tech ...etc',
                        onSave: (value) => quiz['subject'] = value,
                      ),
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
                            return 'قُمْ بإدخال القيمة رجاءً';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      RoundedBtn(
                        text: 'Save',
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
