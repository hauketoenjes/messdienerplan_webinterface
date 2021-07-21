import 'package:flutter/material.dart';

class AcolyteDataSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: const [
        DataCell(Text('Hauke')),
        DataCell(Text('Tönjes')),
        DataCell(Text('12.09.1999')),
        DataCell(Text("OMI's")),
        DataCell(Text("aktiv")),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
