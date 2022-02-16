import 'dart:convert';

import 'package:quiz_app/src/models/question.dart';

class Exam {
  String id;
  String subject;
  List<Question> question;
  Exam({
    required this.id,
    required this.subject,
    required this.question,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'question': question.map((x) => x.toMap()).toList(),
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'] ?? '',
      subject: map['subject'] ?? '',
      question:
          List<Question>.from(map['question']?.map((x) => Question.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) => Exam.fromMap(json.decode(source));
}
