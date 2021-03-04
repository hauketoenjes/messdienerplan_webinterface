import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_dropdown_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_time_form_field.dart';
import 'package:messdienerplan_webinterface/misc/extension_methods.dart';

class RuleEditView extends DataEditViewWidget {
  RuleEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Rule>(
      (routeParameters) async {
        var typeRepository = Get.find<TypeRepository>();
        await typeRepository.getDataList();

        return typeRepository.rules[int.parse(routeParameters['typeId'])];
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('ruleId')) {
          return Rule(time: DateTime.now(), dayOfWeek: DayOfWeek.sun);
        }

        return await baseRepository
            .getData(int.parse(routeParameters['ruleId']));
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Location>(Get.find<LocationRepository>());
      },
    ),
  );
  final dateFormat = DateFormat.MMMMEEEEd().add_y();

  @override
  Widget build(BuildContext context) {
    return DataEditView<Rule>(
      controller: controller,
      newDataTitle: 'Neue Regel erstellen',
      editDataTitle: 'Regel bearbeiten',
      editDataDescription: 'Hier kann eine Regel bearbeitet werden',
      newDataDescription: 'Hier kann eine neue Regel erstellt werden',
      noDataText: 'Regel konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomDropdownFormField<DayOfWeek>(
          title: 'Wochentag',
          onChanged: (value) => dataModel().dayOfWeek = value,
          value: dataModel().dayOfWeek,
          items: [
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.mon,
              child: Text(DayOfWeek.mon.value),
            ),
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.tue,
              child: Text(DayOfWeek.tue.value),
            ),
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.wed,
              child: Text(DayOfWeek.wed.value),
            ),
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.thu,
              child: Text(DayOfWeek.thu.value),
            ),
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.fri,
              child: Text(DayOfWeek.fri.value),
            ),
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.sat,
              child: Text(DayOfWeek.sat.value),
            ),
            DropdownMenuItem<DayOfWeek>(
              value: DayOfWeek.sun,
              child: Text(DayOfWeek.sun.value),
            ),
          ],
        ),
        CustomTimeFormField(
          title: 'Uhrzeit',
          time: dataModel().time,
          onChanged: (value) {
            dataModel().time = value;
            dataModel.refresh();
          },
        ),
        CustomDropdownFormField<int>(
          title: 'Ort',
          onChanged: (value) => dataModel().location = value,
          value: dataModel().location,
          items: controller
              .getAdditionalDataList<Location>()
              .map((l) => DropdownMenuItem<int>(
                    value: l.id,
                    child: Text(l.locationName),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
