import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/enums.dart';
import 'widget/admin_login.dart';
import 'widget/student_login.dart';

class LoginScreen extends ConsumerWidget {
  static const routName = '/log_in';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: user == User.admin ? const AdminLogin() : const StudentLogin(),
    );
  }
}
