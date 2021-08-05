import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_skeleton.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import 'data_source.dart';

class DataTableView<T> extends StatelessWidget {
  final String title;
  final String description;
  final String? createRoute;
  final String tableRoute;
  final String Function(T item)? getUpdateRoute;
  final List<DataColumn> Function(
    void Function(
      int sortColumnIndex,
      bool sortAscending,
      Comparable Function(T item) getComparable,
    ),
  ) columns;
  final ReadAll<T> readAllRepository;
  final void Function(void Function<U>(ReadAll<U> readAll) register)?
      optionalReadAllRepositories;
  final Delete<T>? deleteRepository;
  final String? deleteDialogTitle;
  final String? deleteDialogContent;
  final String? searchPrompt;
  final List<String> Function(T item)? searchableValues;
  final List<DataCell> Function(
      T item, List<U> Function<U>() resolveOptionalItems) dataCells;
  final List<IconButton> Function(T item)? additionalActions;

  const DataTableView({
    Key? key,
    required this.title,
    required this.description,
    required this.columns,
    required this.readAllRepository,
    required this.dataCells,
    required this.tableRoute,
    this.createRoute,
    this.getUpdateRoute,
    this.deleteRepository,
    this.deleteDialogTitle,
    this.deleteDialogContent,
    this.searchPrompt,
    this.searchableValues,
    this.additionalActions,
    this.optionalReadAllRepositories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataSource<T>>(
      create: (context) => DataSource<T>(
        context: context,
        readAllRepository: readAllRepository,
        deleteRepository: deleteRepository,
        deleteDialogTitle: deleteDialogTitle,
        deleteDialogContent: deleteDialogContent,
        getUpdateRoute: getUpdateRoute,
        additionalActions: additionalActions,
        optionalReadAllRepositories: optionalReadAllRepositories,
        dataCells: dataCells,
      ),
      builder: (context, child) {
        return Consumer<DataSource<T>>(
          builder: (context, source, child) {
            return VWidgetGuard(
              onPop: (_) async {},
              afterUpdate: (_, from, to) {
                if (to == tableRoute) {
                  Provider.of<DataSource<T>>(context, listen: false)
                      .loadItems();
                }
              },
              child: PageSkeleton(
                title: title,
                description: description,
                actionButtons: [
                  PageActionButton(
                    icon: const Icon(Icons.refresh_rounded),
                    label: 'Aktualisieren',
                    onPressed: () async {
                      await source.loadItems();
                    },
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AnimatedOpacity(
                        duration:
                            Duration(milliseconds: source.loading ? 0 : 1200),
                        opacity: source.loading ? 1.0 : 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                    ),
                    PaginatedDataTable(
                      sortAscending: source.sortAscending,
                      sortColumnIndex: source.sortColumnIndex,
                      rowsPerPage: source.rowsPerPage,
                      source: source,
                      header: searchPrompt != null
                          ? TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                isDense: false,
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                ),
                                hintText: '$searchPrompt ...',
                              ),
                              onChanged: (value) {
                                source.search(value, searchableValues!);
                              },
                            )
                          : Text(title),
                      actions: [
                        if (createRoute != null)
                          TextButton.icon(
                            onPressed: () {
                              context.vRouter.to(createRoute!);
                            },
                            icon: const Icon(Icons.add_rounded),
                            label: const Text('Hinzufügen'),
                          ),
                      ],
                      onRowsPerPageChanged: (value) {
                        if (value == null) return;
                        source.rowsPerPage = value;
                      },
                      columns: [
                        ...columns(source.sort),
                        if (deleteRepository != null ||
                            additionalActions != null ||
                            getUpdateRoute != null)
                          const DataColumn(label: Text('Aktionen'))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
