import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_date_range_form_field.dart';

class PlanEditView extends DataEditViewWidget {
  PlanEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Plan>(
      (routeParameters) async {
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
    return DataEditView<Plan>(
      controller: controller,
      newDataTitle: 'Neuen Plan erstellen',
      editDataTitle: 'Plan bearbeiten',
      editDataDescription: 'Hier kann ein Plan bearbeitet werden',
      newDataDescription: 'Hier kann ein neuer Ort erstellt werden',
      noDataText: 'Plan konnte nicht geladen werden.',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomDateRangeFormField(
          title: 'Planbereich',
          dateFrom: dataModel().dateFrom,
          dateTo: dataModel().dateTo,
          onChanged: (newFrom, newTo) {
            dataModel().dateFrom = newFrom;
            dataModel().dateTo = newTo;
            dataModel.refresh();
          },
        ),
      ],
    );
  }
}
