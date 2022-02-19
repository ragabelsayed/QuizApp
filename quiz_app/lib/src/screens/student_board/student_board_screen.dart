import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/constants.dart';
import '../../config/palette.dart';
import '../../config/utils.dart';
import '../../provider/students_provider.dart';
import '../../widgets/custom_back_btn.dart';
import 'widget/student_data_table_view.dart';

class StudentBoardScreen extends ConsumerWidget {
  static const routName = '/students_board';
  const StudentBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentlist = ref.watch(studentslistProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Students Board'),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          SafeArea(
            child: studentlist.when(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Palette.primaryColor2,
                  backgroundColor: Palette.kGrayColor,
                ),
              ),
              error: (error, stackTrace) =>
                  Utils.showSnackBar('Something wrong happened'),
              data: (students) => StudentDataTableView(students: students),
            ),
          ),
          const CustomBackBtn(),
        ],
      ),
    );
  }
}
