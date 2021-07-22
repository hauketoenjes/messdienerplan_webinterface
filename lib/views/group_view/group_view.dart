import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/data_table_view/data_table_view.dart';

class GroupView extends StatelessWidget {
  final groupRepository = KiwiContainer().resolve<GroupRepository>();

  @override
  Widget build(BuildContext context) {
    return DataTableView<Group>(
      title: 'Gruppen',
      description: 'Hier können Gruppen erstellt und bearbeitet werden',
      addRoute: groupsAdd,
      readAllRepository: groupRepository,
      deleteRepository: groupRepository,
      deleteDialogTitle: 'Gruppe löschen?',
      deleteDialogContent: 'Die Gruppe wird endgültig gelöscht.',
      searchPrompt: 'Suche nach Gruppen',
      searchableValues: (item) => [
        item.groupName,
      ],
      columns: (sort) => [
        DataColumn(
          label: const Text('Name'),
          onSort: (index, asc) => sort(index, asc, (item) => item.groupName),
        ),
      ],
      dataCells: (item, _) => [
        DataCell(Text(item.groupName)),
      ],
    );
  }
}
