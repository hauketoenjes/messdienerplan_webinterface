import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/views/location_view/data_source.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_skeleton.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class DataTableView<T> extends StatelessWidget {
  final String title;
  final String description;
  final String addRoute;
  final List<DataColumn> columns;
  final ReadAll<T> readAllRepository;
  final Delete<T>? deleteRepository;
  final List<DataCell> Function(T item) getDataCells;
  final List<IconButton> Function(T item)? additionalActions;

  const DataTableView({
    Key? key,
    required this.title,
    required this.description,
    required this.addRoute,
    required this.columns,
    required this.readAllRepository,
    required this.getDataCells,
    this.deleteRepository,
    this.additionalActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataSource<T>>(
      create: (context) => DataSource<T>(
        readAllRepository: readAllRepository,
        deleteRepository: deleteRepository,
        additionalActions: additionalActions,
        getDataCells: getDataCells,
      ),
      builder: (context, child) {
        return Consumer<DataSource<T>>(
          builder: (context, source, child) {
            return VWidgetGuard(
              afterUpdate: (_, from, to) {
                if (from == addRoute) {
                  source.loadItems();
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
                      source: source,
                      header: const TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                          ),
                          hintText: 'Suche nach Orten...',
                        ),
                      ),
                      actions: [
                        TextButton.icon(
                          onPressed: () {
                            context.vRouter.to(addRoute);
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
                        ...columns,
                        if (deleteRepository != null ||
                            additionalActions != null)
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
