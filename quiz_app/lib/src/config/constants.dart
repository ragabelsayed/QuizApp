import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/src/config/palette.dart';

class AppConstants {
  static const double defaultPadding = 20.0;

  static const OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  static const OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Palette.kGreenColor),
  );
  static const OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Palette.kRedColor),
  );
}
