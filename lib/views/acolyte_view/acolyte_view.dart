import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/data_table_view/data_table_view.dart';
import 'package:messdienerplan_webinterface/misc/extensions/date_format_extensions.dart';

class AcolyteView extends StatelessWidget {
  final acolyteRepository = KiwiContainer().resolve<AcolyteRepository>();
  final groupRepository = KiwiContainer().resolve<GroupRepository>();

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormats.yyyyMMdd();

    return DataTableView<Acolyte>(
      title: 'Messdiener:innen',
      description:
          'Hier können Messdiener:innen erstellt und bearbeitet werden',
      createRoute: acolytesCreate,
      tableRoute: acolytes,
      getUpdateRoute: (item) => acolytesUpdate.replaceAll(
        ':acolyteId',
        item.id.toString(),
      ),
      readAllRepository: acolyteRepository,
      deleteRepository: acolyteRepository,
      deleteDialogTitle: 'Messdiener:in löschen?',
      deleteDialogContent: 'Messdiener:in wird endgültig gelöscht.',
      searchPrompt: 'Suche nach Messdiener:in',
      optionalReadAllRepositories: (register) {
        register<Group>(groupRepository);
      },
      searchableValues: (item) => [
        item.firstName,
        item.lastName,
        item.extra,
      ],
      columns: (sort) => [
        DataColumn(
          label: const Text('Vorname'),
          onSort: (index, asc) => sort(index, asc, (item) => item.firstName),
        ),
        DataColumn(
          label: const Text('Nachname'),
          onSort: (index, asc) => sort(index, asc, (item) => item.lastName),
        ),
        DataColumn(
          label: const Text('Extrainformation'),
          onSort: (index, asc) => sort(index, asc, (item) => item.extra),
        ),
        DataColumn(
          label: const Text('Geburtstag'),
          onSort: (index, asc) => sort(index, asc, (item) => item.birthday),
        ),
        const DataColumn(label: Text('Status')),
        DataColumn(
          label: const Text('Gruppe'),
          onSort: (index, asc) => sort(index, asc, (item) => item.group ?? 0),
        ),
      ],
      dataCells: (item, resolve) => [
        DataCell(Text(item.firstName)),
        DataCell(Text(item.lastName)),
        DataCell(Text(item.extra.isEmpty ? '-' : item.extra)),
        DataCell(Text(dateFormat.format(item.birthday))),
        DataCell(Text(item.inactive ? 'Inaktiv' : 'Aktiv')),
        DataCell(Text(
          resolve<Group>()
              .singleWhere(
                (e) => e.id == item.group,
                orElse: () => Group(groupName: '-', classifications: []),
              )
              .groupName,
        )),
      ],
    );
  }
}
