import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/models/question.dart';
import '../models/exam.dart';

final examProvider = StateNotifierProvider<ExamNotifier, List<Exam>>((ref) {
  return ExamNotifier();
});

class ExamNotifier extends StateNotifier<List<Exam>> {
  ExamNotifier() : super([]);

  void addExam(Exam exam) {
    state.add(exam);
  }

  void addQuiestionToExam(String examId, Question question) {
    state.firstWhere((element) => element.id == examId).question.add(question);
  }
}
