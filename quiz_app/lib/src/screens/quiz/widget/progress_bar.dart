import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../config/constants.dart';
import '../../../config/palette.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            lineHeight: 30.0,
            percent: 1.0,
            barRadius: const Radius.circular(30),
            animation: true,
            animationDuration: 6000,
            backgroundColor: Palette.backgroundColor,
            linearGradient: Palette.kPrimaryGradient,
            onAnimationEnd: () {
              print('end');
            },
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding / 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('1 minute'),
                  SvgPicture.asset("assets/icons/clock.svg"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
