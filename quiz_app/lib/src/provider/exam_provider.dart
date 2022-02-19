import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/exam.dart';
import '../models/question.dart';

final examProvider = StateNotifierProvider<ExamNotifier, List<Exam>>((ref) {
  return ExamNotifier();
});

final futureExamsProvider = FutureProvider.autoDispose<List<Exam>>((ref) async {
  return ExamNotifier().fetchExamsData();
});

class ExamNotifier extends StateNotifier<List<Exam>> {
  ExamNotifier() : super([]);
  final exams = FirebaseFirestore.instance.collection('exams/');

  Future<List<Exam>> fetchExamsData() async {
    final snapshots = await exams.get();
    List<Exam> _examlist = [];
    var data = snapshots.docs
        .map(
          (snapshot) => snapshot.data(),
        )
        .toList();

    for (var exam in data) {
      if (exam.isNotEmpty) {
        _examlist.add(Exam.fromMap(exam));
      }
    }
    state = _examlist;
    return _examlist;
  }

  Future<void> addExam(Exam exam) async {
    state = [...state, exam];
    // await exams.doc(exam.id).set(
    //       exam.toMap(),
    //     );
  }

  Future<void> addQuestionToExam(String examId, Question question) async {
    state.firstWhere((element) => element.id == examId).question.add(question);
    await exams.doc(examId).update({
      'question': [question.toMap()]
    });
  }

  Future<void> saveAllExams() async {
    for (var exam in state) {
      await exams.doc(exam.id).set(
            exam.toMap(),
          );
    }
  }
}
