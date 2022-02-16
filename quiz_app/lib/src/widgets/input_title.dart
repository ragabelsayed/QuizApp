import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  final String title;
  const InputTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: Theme.of(context)
            .textTheme
            .merge(
              const TextTheme(
                headline6: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            .headline6,
      ),
    );
  }
}
