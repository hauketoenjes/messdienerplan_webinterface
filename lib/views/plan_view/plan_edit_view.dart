import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';

class PlanEditView extends DataEditViewWidget {
  final DateFormat _dateFormat = DateFormat.yMMMd();

  PlanEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Plan>(
      (routeSettings) async {
        return Get.find<PlanRepository>();
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('planId')) {
          return Plan(
            dateFrom: DateTime.now(),
            dateTo: DateTime.now().add(Duration(days: 7)),
            public: false,
          );
        }

        return await baseRepository
            .getData(int.parse(routeParameters['planId']));
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return DataEditView<Plan>(
      controller: controller,
      newDataTitle: 'Neuen Plan erstellen',
      editDataTitle: 'Plan bearbeiten',
      editDataDescription: 'Hier kann ein Plan bearbeitet werden',
      newDataDescription: 'Hier kann ein neuer Ort erstellt werden',
      noDataText: 'Plan konnte nicht geladen werden.',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aktueller Bereich:',
                    style: textTheme.headline6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                        '${_dateFormat.format(dataModel().dateFrom)} bis zum ${_dateFormat.format(dataModel().dateTo)}'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  var newRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050),
                    initialDateRange: DateTimeRange(
                      start: dataModel().dateFrom,
                      end: dataModel().dateTo,
                    ),
                  );
                  if (newRange == null) return;

                  dataModel().dateFrom = newRange.start;
                  dataModel().dateTo = newRange.end;
                  dataModel.refresh();
                },
                child: Text('Bereich ändern'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
