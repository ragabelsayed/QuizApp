import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';
import '../../../widgets/rounded_btn.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();

  Future<void> _saveForm() async {
    final _isValid = _formKey.currentState!.validate();

    if (_isValid) {
      _formKey.currentState!.save();
      try {} catch (e) {}
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    cPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(
              'Welcome',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text('Signup'),
            const Spacer(),
            TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: nameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Palette.backgroundColor,
                hintText: "Full Name",
                border: AppConstants.border,
                errorBorder: AppConstants.errorBorder,
                focusedBorder: AppConstants.focusedBorder,
              ),
              validator: (newValue) {
                if (newValue!.isEmpty) {
                  return 'قُمْ بإدخال الإسم رجاءً';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              controller: passController,
              decoration: const InputDecoration(
                fillColor: Palette.backgroundColor,
                filled: true,
                hintText: 'Passoword',
                border: AppConstants.border,
                errorBorder: AppConstants.errorBorder,
                focusedBorder: AppConstants.focusedBorder,
              ),
              validator: (newValue) {
                if (newValue!.isEmpty) {
                  return 'قُمْ بإدخال كلمة السر رجاءً';
                }
                if (newValue.length <= 4) {
                  return 'كلمة السر أقل من 4 حروف';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: cPassController,
              decoration: const InputDecoration(
                fillColor: Palette.backgroundColor,
                filled: true,
                hintText: 'Confirm Passoword',
                border: AppConstants.border,
                errorBorder: AppConstants.errorBorder,
                focusedBorder: AppConstants.focusedBorder,
              ),
              validator: (newValue) {
                if (newValue!.isEmpty) {
                  return 'قُمْ بتاكيد كلمة السر رجاءً';
                }
                if (passController.text != cPassController.text) {
                  return 'كلمة السر لاتتطابق';
                }
              },
            ),
            const Spacer(),
            RoundedBtn(
              text: 'Signup',
              padding: AppConstants.defaultPadding,
              onPress: () => _saveForm(),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
