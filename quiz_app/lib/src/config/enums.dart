import 'package:flutter_riverpod/flutter_riverpod.dart';

enum User { admin, student }

final userProvider = StateProvider<Enum>((ref) => User.admin);

enum Answer { notAnswer, correct, notCorrect }
