import 'package:flutter/material.dart';

class CustomBackBtn extends StatelessWidget {
  const CustomBackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewPadding.top,
      left: 10,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
