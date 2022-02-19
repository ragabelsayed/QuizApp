import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';

// final studentProvider = FutureProvider<List<Student>>((ref) async {
//   return ;
// });
final studentProvider = StateNotifierProvider<StudentNotifier, Student>((ref) {
  return StudentNotifier();
});

class StudentNotifier extends StateNotifier<Student> {
  StudentNotifier()
      : super(
          Student(id: DateTime.now().toIso8601String(), name: '', score: []),
        );

  void setStudentName(String name) {
    state.name = name;
  }

  Future<void> addStudentScore(Result result) async {
    state.score.add(result);
    await FirebaseFirestore.instance
        .collection('students/')
        .doc(state.id)
        .set(state.toMap());
  }
}
