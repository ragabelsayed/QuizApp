import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/config/enums.dart';
import 'widget/admin_home.dart';
import 'widget/student_home.dart';

class HomeScreen extends ConsumerWidget {
  static const routName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: user == User.admin ? const AdminHome() : const StudentHome(),
    );
  }
}
