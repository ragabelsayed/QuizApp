import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';

final studentslistProvider =
    FutureProvider.autoDispose<List<Student>>((ref) async {
  final students = FirebaseFirestore.instance.collection('students/');
  final snapshots = await students.get();
  List<Student> studentlist = [];
  var data = snapshots.docs.map(
    (snapshot) {
      return snapshot.data();
    },
  ).toList();

  for (var student in data) {
    if (student.isNotEmpty) {
      studentlist.add(Student.fromMap(student));
    }
  }
  return studentlist;
});

final studentProvider = StateNotifierProvider<StudentNotifier, Student>((ref) {
  return StudentNotifier();
});

class StudentNotifier extends StateNotifier<Student> {
  StudentNotifier()
      : super(
          Student(id: DateTime.now().toIso8601String(), name: '', score: []),
        );

  void setStudentName(String name) {
    state = Student(id: DateTime.now().toIso8601String(), name: '', score: []);
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
