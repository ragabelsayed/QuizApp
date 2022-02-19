import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/enums.dart';
import '../models/exam.dart';
import '../models/question.dart';

final questionProvider =
    StateNotifierProvider<QuestionNotifier, List<Question>>((ref) {
  return QuestionNotifier();
});

final answerProvider =
    StateProvider.autoDispose<Enum>((ref) => Answer.notAnswer);

final scoreProvider = StateProvider<int>((ref) => 0);

class QuestionNotifier extends StateNotifier<List<Question>> {
  QuestionNotifier() : super([]);

  late String _lastExam;

  void getQuestions(Exam exam) {
    state = exam.question.toList();
    _lastExam = exam.subject;
  }

  String get lastExam {
    return _lastExam;
  }
}
