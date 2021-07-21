import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';

class DataSource<T> extends DataTableSource {
  final ReadAll<T> readAllRepository;
  final Delete<T>? deleteRepository;
  final List<DataCell> Function(T item) getDataCells;
  final List<IconButton> Function(T item)? additionalActions;

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = false;
  int? _sortColumnIndex;

  bool loading = false;

  List<T> items = [];

  DataSource({
    required this.readAllRepository,
    required this.getDataCells,
    this.deleteRepository,
    this.additionalActions,
  }) {
    loadItems();
  }

  Future<void> loadItems() async {
    loading = true;
    notifyListeners();

    final result = await readAllRepository.readAll();

    if (result.isValue) {
      items = result.asValue!.value;
    }

    loading = false;
    notifyListeners();
  }

  Future<void> deleteItem(T item) async {
    loading = true;
    notifyListeners();

    await deleteRepository!.delete(item);

    loadItems();

    loading = false;
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final item = items[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        ...getDataCells(item),
        if (deleteRepository != null || additionalActions != null)
          DataCell(
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                if (additionalActions != null) ...additionalActions!(item),
                if (deleteRepository != null)
                  IconButton(
                    onPressed: () async {
                      await deleteRepository!.delete(item);
                      loadItems();
                    },
                    icon: const Icon(Icons.delete_rounded),
                  )
              ],
            ),
          ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;

  int get rowsPerPage => _rowsPerPage;

  bool get sortAscending => _sortAscending;

  int? get sortColumnIndex => _sortColumnIndex;

  set rowsPerPage(int value) {
    _rowsPerPage = value;
    notifyListeners();
  }

  set sortAscending(bool value) {
    _sortAscending = value;
    notifyListeners();
  }

  set sortColumnIndex(int? value) {
    _sortColumnIndex = value;
    notifyListeners();
  }
}
