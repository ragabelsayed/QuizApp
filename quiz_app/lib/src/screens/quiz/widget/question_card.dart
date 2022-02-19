import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/constants.dart';
import '../../../config/enums.dart';
import '../../../config/palette.dart';
import '../../../models/question.dart';
import '../../../provider/quetion_provider.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final PageController pageController;
  const QuestionCard({
    Key? key,
    required this.question,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Consumer(
        builder: (context, ref, child) => Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Palette.kBlackColor),
            ),
            const SizedBox(height: AppConstants.defaultPadding / 2),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) => Option(
                  index: index,
                  answer: question.answer,
                  text: question.options[index],
                  press: () async {
                    if (question.answer == index) {
                      ref.read(answerProvider.state).state = Answer.correct;
                    } else {
                      ref.read(answerProvider.state).state = Answer.notCorrect;
                    }
                    await Future.delayed(const Duration(seconds: 1));
                    pageController.nextPage(
                      duration: AppConstants.duration,
                      curve: Curves.ease,
                    );
                    ref.read(answerProvider.state).state = Answer.notAnswer;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
