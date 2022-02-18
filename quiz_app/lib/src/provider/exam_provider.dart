import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/models/question.dart';
import '../models/exam.dart';

final examProvider = StateNotifierProvider<ExamNotifier, List<Exam>>((ref) {
  return ExamNotifier();
});

class ExamNotifier extends StateNotifier<List<Exam>> {
  ExamNotifier() : super([]);
  final exams = FirebaseFirestore.instance.collection('exams/');

  Future<void> fetchExamsData() async {
    final snapshots = await exams.get();
    List<Exam> examlist = [];
    var data = snapshots.docs
        .map(
          (snapshot) => snapshot.data(),
        )
        .toList();

    for (var exam in data) {
      if (exam.isNotEmpty) {
        examlist.add(Exam.fromMap(exam));
      }
    }
    state = examlist;
  }

  Future<void> addExam(Exam exam) async {
    state = [...state, exam];
    await exams.doc(exam.id).set(
          exam.toMap(),
        );
  }

  void addQuestionToExam(String examId, Question question) {
    state.firstWhere((element) => element.id == examId).question.add(question);
  }
}
