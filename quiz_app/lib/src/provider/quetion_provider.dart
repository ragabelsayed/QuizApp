import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/config/enums.dart';
import 'package:quiz_app/src/models/question.dart';

import '../models/exam.dart';

final questionProvider =
    StateNotifierProvider<QuestionNotifier, List<Question>>((ref) {
  return QuestionNotifier();
});

final answerProvider =
    StateProvider.autoDispose<Enum>((ref) => Answer.notAnswer);

class QuestionNotifier extends StateNotifier<List<Question>> {
  QuestionNotifier() : super([]);

  void getQuestions(Exam exam) {
    state = exam.question.toList();
  }
}
