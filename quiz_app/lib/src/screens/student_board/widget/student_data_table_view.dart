import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/palette.dart';

import '../../../models/student.dart';

class StudentDataTableView extends StatelessWidget {
  final List<Student> students;
  const StudentDataTableView({Key? key, required this.students})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = [
      'Name',
      'Subject',
      'Result',
      'Score',
    ];
    return Scrollbar(
      interactive: true,
      radius: const Radius.circular(30),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        physics: const AlwaysScrollableScrollPhysics(),
        child: DataTable(
          columns: _getColumns(columns),
          rows: _getRow(students: students, context: context),
          headingTextStyle:
              Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
          columnSpacing: MediaQuery.of(context).size.width / 10,
          horizontalMargin: 0.0,
          showBottomBorder: true,
        ),
      ),
    );
  }

  List<DataColumn> _getColumns(List<String> columns) => columns
      .map(
        (column) => DataColumn(
          numeric: true,
          label: SizedBox(
            width: 56,
            child: Text(
              column,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
      .toList();

  List<DataRow> _getRow(
          {required List<Student> students, required BuildContext context}) =>
      students.map(
        (student) {
          final cells = [
            student.name,
            student.score.first.subject,
            student.score.first.result,
            student.score.first.result,
          ];
          return DataRow(cells: [..._getCells(cells)].toList());
        },
      ).toList();

  List<DataCell> _getCells(List<dynamic> cells) {
    var cellList = cells
        .map(
          (cell) => DataCell(
            SizedBox(
              width: 56,
              child: Text(
                '$cell',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Palette.kSecondaryColor),
              ),
            ),
            // placeholder: true,
          ),
        )
        .toList();
    return cellList;
  }
}
