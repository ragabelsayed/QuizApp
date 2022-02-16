import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';

class ExamScreen extends StatelessWidget {
  static const routName = '/exam';
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
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
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Palette.primaryColor1,
          foregroundColor: Colors.white,
          onPressed: () {},
          label: Icon(Icons.quiz)),
    );
  }
}
