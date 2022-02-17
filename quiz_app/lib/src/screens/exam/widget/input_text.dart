import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';

class InputText extends StatelessWidget {
  final String hint;
  final Function(String) onSave;
  const InputText({Key? key, required this.hint, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.backgroundColor,
        hintText: hint,
        border: AppConstants.border,
        errorBorder: AppConstants.errorBorder,
        focusedBorder: AppConstants.focusedBorder,
      ),
      validator: (newValue) {
        if (newValue!.isEmpty) {
          return 'Please Enter your value';
        }
      },
      onSaved: (newValue) => onSave(newValue!),
    );
    ;
  }
}
