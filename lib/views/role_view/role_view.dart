import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/data_table_view/data_table_view.dart';

class RoleView extends StatelessWidget {
  final roleRepository = KiwiContainer().resolve<RoleRepository>();

  @override
  Widget build(BuildContext context) {
    return DataTableView<Role>(
      title: 'Rollen',
      description: 'Hier können Rollen erstellt und bearbeitet werden',
      createRoute: rolesCreate,
      readAllRepository: roleRepository,
      deleteRepository: roleRepository,
      deleteDialogTitle: 'Rolle löschen?',
      deleteDialogContent: 'Die Rolle wird endgültig gelöscht.',
      searchPrompt: 'Suche nach Rollen',
      searchableValues: (item) => [
        item.roleName,
      ],
      columns: (sort) => [
        DataColumn(
          label: const Text('Name'),
          onSort: (index, asc) => sort(index, asc, (item) => item.roleName),
        ),
      ],
      dataCells: (item, _) => [
        DataCell(Text(item.roleName)),
      ],
    );
  }
}
