import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';
import '../../provider/quetion_provider.dart';
import '../score/score_screen.dart';
import 'widget/progress_bar.dart';
import 'widget/question_card.dart';

class QuizScreen extends ConsumerStatefulWidget {
  static const routName = '/quiz';
  const QuizScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  final pageController = PageController();
  int questionNumber = 1;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => pageController.nextPage(
              duration: AppConstants.duration,
              curve: Curves.ease,
            ),
            child: const Text('Skip', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProgressBar(),
                  const SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      text: 'Question ${questionNumber}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Palette.kSecondaryColor),
                      children: [
                        TextSpan(
                          text: '/${questions.length}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Palette.kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1.5),
                  const SizedBox(height: 20),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      itemCount: questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                        question: questions[index],
                        pageController: pageController,
                      ),
                      onPageChanged: (i) async {
                        setState(() => questionNumber = i + 1);
                        if (questionNumber == questions.length) {
                          await Future.delayed(const Duration(seconds: 1));
                          Navigator.pushNamed(context, ScoreScreen.routName);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
