import 'dart:convert';

class Student {
  String id;
  String name;
  List<Result> score;
  Student({
    required this.id,
    required this.name,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'score': score.map((x) => x.toMap()).toList(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      score: List<Result>.from(map['score']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));
}

class Result {
  String subject;
  String result;
  Result({
    required this.subject,
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'result': result,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      subject: map['subject'] ?? '',
      result: map['result'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));
}
