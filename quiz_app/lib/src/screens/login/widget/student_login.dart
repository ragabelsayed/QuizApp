import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../widgets/custom_back_btn.dart';
import '../../../widgets/rounded_btn.dart';
import '../../home/home_screen.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  Future<void> _saveForm() async {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, HomeScreen.routName);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppConstants.imageBackground,
        SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Text("Enter your informations below"),
                  const Spacer(),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    controller: nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Palette.backgroundColor,
                      hintText: 'Full Name',
                      border: AppConstants.border,
                      errorBorder: AppConstants.errorBorder,
                      focusedBorder: AppConstants.focusedBorder,
                    ),
                    validator: (newValue) {
                      if (newValue!.isEmpty) {
                        return 'Please enter your full name';
                      }
                    },
                  ),
                  const Spacer(),
                  RoundedBtn(
                    text: 'Lets Start Quiz',
                    padding: AppConstants.defaultPadding,
                    onPress: () => _saveForm(),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
        const CustomBackBtn(),
      ],
    );
  }
}
