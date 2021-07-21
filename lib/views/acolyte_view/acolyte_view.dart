import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_data_source.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_skeleton.dart';

class AcolyteView extends StatefulWidget {
  @override
  _AcolyteViewState createState() => _AcolyteViewState();
}

class _AcolyteViewState extends State<AcolyteView> {
  int rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  final source = AcolyteDataSource();

  @override
  Widget build(BuildContext context) {
    return PageSkeleton(
      title: 'Messdiener:innen',
      description:
          'Hier können Messdiener:innen erstellt und bearbeitet werden. Messdiener:innen können auf "Inaktiv" gesetzt werden, damit sie beim Generieren des Plans nicht eingeteilt werden.',
      actionButtons: [
        PageActionButton(
          icon: const Icon(Icons.download_rounded),
          label: 'Download',
          onPressed: () async {
            final repository = LocationRepository();
            final logger = Logger();

            repository.readAll().then((value) => logger.i(value));
          },
        ),
      ],
      child: PaginatedDataTable(
        onRowsPerPageChanged: (value) {
          if (value == null) return;
          setState(() {
            rowsPerPage = value;
          });
        },
        rowsPerPage: rowsPerPage,
        header: const Text("Messdiener:innen"),
        actions: [
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: const TextField(
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.search_rounded),
                hintText: 'Suche',
              ),
            ),
          ),
        ],
        columns: const [
          DataColumn(label: Text('Vorname')),
          DataColumn(label: Text('Nachname')),
          DataColumn(label: Text('Geburtstag')),
          DataColumn(label: Text('Gruppe')),
          DataColumn(label: Text('Status')),
        ],
        source: source,
      ),
    );
  }
}
