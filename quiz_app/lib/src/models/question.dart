import 'dart:convert';

class Question {
  final String id;
  final String subject;
  final String question;
  final List<String> options;
  final int answer;
  Question({
    required this.id,
    required this.subject,
    required this.question,
    required this.options,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'question': question,
      'options': options,
      'answer': answer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] ?? '',
      subject: map['subject'] ?? '',
      question: map['question'] ?? '',
      options: List<String>.from(map['options']),
      answer: map['answer']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));
}
