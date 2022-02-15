import 'package:flutter/material.dart';
import '../config/palette.dart';

class RoundedBtn extends StatelessWidget {
  const RoundedBtn({
    Key? key,
    required this.text,
    required this.padding,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final double padding;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onPress(),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Ink(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: const BoxDecoration(
            gradient: Palette.kPrimaryGradient,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
    //  SizedBox(
    //   height: 50,
    //   width: MediaQuery.of(context).size.width * width,
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(primary: color),
    //     child: Text(
    //       text,
    //       style: const TextStyle(
    //         fontSize: 18,
    //         color: Colors.white,
    //       ),
    //     ),
    //     onPressed: () => onPress(),
    //   ),
    // );
  }
}
