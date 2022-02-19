import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/constants.dart';
import '../../../config/enums.dart';
import '../../../config/palette.dart';
import '../../../provider/quetion_provider.dart';

class Option extends ConsumerStatefulWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.answer,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final int answer;
  final VoidCallback press;

  @override
  ConsumerState<Option> createState() => _OptionState();
}

class _OptionState extends ConsumerState<Option> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppConstants.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: getTheRightColor()),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: widget.press,
        leading: Text(
          "${widget.index + 1}. ${widget.text}",
          style: TextStyle(color: getTheRightColor(), fontSize: 16),
        ),
        trailing: Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            color: getTheRightColor() == Palette.kGrayColor
                ? Colors.transparent
                : getTheRightColor(),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: getTheRightColor()),
          ),
          child: getTheRightColor() == Palette.kGrayColor
              ? null
              : Icon(getTheRightIcon(), size: 16),
        ),
      ),
    );
  }

  Color getTheRightColor() {
    final isAnswerd = ref.watch(answerProvider);
    if (isAnswerd == Answer.correct && widget.index == widget.answer) {
      return Palette.kGreenColor;
    } else if (isAnswerd == Answer.notCorrect &&
        widget.index != widget.answer) {
      return Palette.kRedColor;
    } else {
      return Palette.kGrayColor;
    }
  }

  IconData getTheRightIcon() {
    return getTheRightColor() == Palette.kRedColor ? Icons.close : Icons.done;
  }
}
