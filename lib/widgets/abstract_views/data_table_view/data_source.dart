import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/widgets/dialogs/question_dialog.dart';

class DataSource<T> extends DataTableSource {
  final BuildContext context;
  final ReadAll<T> readAllRepository;
  final Delete<T>? deleteRepository;
  final List<DataCell> Function(
      T item, List<U> Function<U>() resolveOptionalItems) dataCells;
  final List<IconButton> Function(T item)? additionalActions;
  final void Function(void Function<U>(ReadAll<U> readAll) register)?
      optionalReadAllRepositories;

  final String? deleteDialogTitle;
  final String? deleteDialogContent;

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool sortAscending = false;
  int? sortColumnIndex;

  bool loading = false;

  Comparable Function(T item)? currentComparable;
  String? currentSearchQuery;
  List<String> Function(T item)? currentSearchableValues;

  Map<Type, ReadAll<dynamic>> optionalReadAlls = {};
  Map<Type, List<dynamic>> optionalReadAllItems = {};

  List<T> items = [];
  List<T> itemsBackup = [];

  DataSource({
    required this.context,
    required this.readAllRepository,
    required this.dataCells,
    this.deleteRepository,
    this.deleteDialogTitle,
    this.deleteDialogContent,
    this.additionalActions,
    this.optionalReadAllRepositories,
  }) : assert((deleteRepository != null &&
                deleteDialogTitle != null &&
                deleteDialogContent != null) ||
            (deleteRepository == null &&
                deleteDialogTitle == null &&
                deleteDialogContent == null)) {
    if (optionalReadAllRepositories != null) {
      optionalReadAllRepositories!(registerOptionalReadAllRepository);
    }

    loadItems();
  }

  void registerOptionalReadAllRepository<U>(ReadAll<U> readAll) {
    optionalReadAlls[U] = readAll;
  }

  List<U> resolveOptionalItems<U>() {
    return (optionalReadAllItems[U] ?? <U>[]) as List<U>;
  }

  Future<void> loadItems() async {
    loading = true;
    notifyListeners();

    final result = await readAllRepository.readAll();

    if (result.isValue) {
      items = result.asValue!.value;
      itemsBackup = items.toList(); // To copy the list and not reference it
    }

    if (optionalReadAlls.isNotEmpty) {
      for (final type in optionalReadAlls.keys) {
        final readAll = optionalReadAlls[type];
        final result = await readAll!.readAll();

        if (result.isValue) {
          optionalReadAllItems[type] = result.asValue!.value;
        }
      }
    }

    if (currentComparable != null) {
      sort(sortColumnIndex, sortAscending, currentComparable!);
    }

    if (currentSearchQuery != null && currentSearchQuery!.isNotEmpty) {
      search(currentSearchQuery!, currentSearchableValues!);
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

  void sort(
    int? sortColumnIndex,
    // ignore: avoid_positional_boolean_parameters
    bool sortAscending,
    Comparable Function(T item) getComparable,
  ) {
    this.sortColumnIndex = sortColumnIndex;
    this.sortAscending = sortAscending;
    currentComparable = getComparable;
    items.sort(
      sortAscending
          ? (i1, i2) => getComparable(i1).compareTo(getComparable(i2))
          : (i1, i2) => getComparable(i2).compareTo(getComparable(i1)),
    );
    notifyListeners();
  }

  void search(String query, List<String> Function(T item) searchableValues) {
    currentSearchQuery = query;
    currentSearchableValues = searchableValues;

    items = itemsBackup.toList().where((item) {
      if (query.isEmpty) return true;

      final values = searchableValues(item);
      return values
          .any((value) => value.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    if (currentComparable != null) {
      sort(sortColumnIndex, sortAscending, currentComparable!);
    }

    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final item = items[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        ...dataCells(item, resolveOptionalItems),
        if (deleteRepository != null || additionalActions != null)
          DataCell(
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                if (additionalActions != null) ...additionalActions!(item),
                if (deleteRepository != null)
                  IconButton(
                    onPressed: () async {
                      final delete = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return QuestionDialog(
                            title: deleteDialogTitle!,
                            content: deleteDialogContent!,
                          );
                        },
                      );

                      if (delete ?? false) {
                        await deleteRepository!.delete(item);
                        loadItems();
                      }
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

  set rowsPerPage(int value) {
    _rowsPerPage = value;
    notifyListeners();
  }
}
