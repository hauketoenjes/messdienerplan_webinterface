import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/data_table_view/data_table_view.dart';

class LocationView extends StatelessWidget {
  final locationRepository = KiwiContainer().resolve<LocationRepository>();

  @override
  Widget build(BuildContext context) {
    return DataTableView<Location>(
      title: 'Orte',
      description: 'Hier können Orte erstellt und bearbeitet werden',
      createRoute: locationsCreate,
      getUpdateRoute: (item) => locationsUpdate.replaceAll(
        ':locationId',
        item.id.toString(),
      ),
      readAllRepository: locationRepository,
      deleteRepository: locationRepository,
      deleteDialogTitle: 'Ort löschen?',
      deleteDialogContent: 'Der Ort wird endgültig gelöscht.',
      searchPrompt: 'Suche nach Orten',
      searchableValues: (item) => [
        item.locationName,
      ],
      columns: (sort) => [
        DataColumn(
          label: const Text('Name'),
          onSort: (index, asc) => sort(index, asc, (item) => item.locationName),
        ),
      ],
      dataCells: (item, _) => [
        DataCell(Text(item.locationName)),
      ],
    );
  }
}
