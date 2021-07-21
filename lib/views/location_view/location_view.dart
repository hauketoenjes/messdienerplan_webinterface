import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:messdienerplan_webinterface/views/location_view/data_table_view.dart';

class LocationView extends StatelessWidget {
  final locationRepository = KiwiContainer().resolve<LocationRepository>();

  @override
  Widget build(BuildContext context) {
    return DataTableView<Location>(
      title: 'Orte',
      description: 'Hier können Orte erstellt und bearbeitet werden',
      addRoute: locationsAdd,
      deleteRepository: locationRepository,
      columns: const [
        DataColumn(label: Text('Name')),
      ],
      readAllRepository: locationRepository,
      getDataCells: (item) => [
        DataCell(Text(item.locationName)),
      ],
    );
  }
}
