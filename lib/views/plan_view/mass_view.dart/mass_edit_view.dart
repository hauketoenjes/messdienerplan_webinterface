import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_date_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_dropdown_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_time_form_field.dart';

class MassEditView extends DataEditViewWidget {
  MassEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Mass>(
      (routeParameters) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getDataList();

        return planRepository.masses[int.parse(routeParameters['planId'])];
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('massId')) {
          return Mass(time: DateTime.now());
        }

        return await baseRepository
            .getData(int.parse(routeParameters['massId']));
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Location>(Get.find<LocationRepository>());
        await controller.storeAdditionalData<Type>(Get.find<TypeRepository>());
      },
    ),
  );
  final dateFormat = DateFormat.MMMMEEEEd().add_y();

  @override
  Widget build(BuildContext context) {
    return DataEditView<Mass>(
      controller: controller,
      newDataTitle: 'Neue Messe erstellen',
      editDataTitle: 'Messe bearbeiten',
      editDataDescription: 'Hier kann eine Messe bearbeitet werden',
      newDataDescription: 'Hier kann eine neue Messe erstellt werden',
      noDataText: 'Messe konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomDateFormField(
          title: 'Datum',
          date: dataModel().time,
          onChanged: (value) {
            dataModel().time = value;
            dataModel.refresh();
          },
        ),
        CustomTimeFormField(
          title: 'Uhrzeit',
          time: dataModel().time,
          onChanged: (value) {
            dataModel().time = value;
            dataModel.refresh();
          },
        ),
        CustomTextFormField(
          title: 'Extrainformation',
          initialValue: dataModel().extra,
          onChanged: (value) => dataModel().extra = value,
        ),
        CustomDropdownFormField(
          title: 'Ort',
          onChanged: (value) => dataModel().location = value,
          value: dataModel().location,
          items: controller
              .getAdditionalDataList<Location>()
              .map((l) => DropdownMenuItem<int>(
                    child: Text(l.locationName),
                    value: l.id,
                  ))
              .toList(),
        ),
        CustomDropdownFormField(
          title: 'Typ',
          onChanged: (value) => dataModel().type = value,
          value: dataModel().type,
          items: controller
              .getAdditionalDataList<Type>()
              .map((t) => DropdownMenuItem<int>(
                    child: Text(t.typeName),
                    value: t.id,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
