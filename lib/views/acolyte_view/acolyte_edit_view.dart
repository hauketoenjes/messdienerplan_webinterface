import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_date_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_dropdown_form_field.dart';

class AcolyteEditView extends DataEditViewWidget {
  AcolyteEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Acolyte>(
      (routeParameters) async {
        return Get.find<AcolyteRepository>();
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('acolyteId')) {
          return Acolyte(birthday: DateTime.now(), inactive: false, extra: '');
        }

        return await baseRepository
            .getData(int.parse(routeParameters['acolyteId']));
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Group>(Get.find<GroupRepository>());
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Acolyte>(
      controller: controller,
      newDataTitle: 'Neuen Messdiener erstellen',
      editDataTitle: 'Messdiener bearbeiten',
      editDataDescription: 'Hier kann ein Messdiener bearbeitet werden',
      newDataDescription: 'Hier kann ein neuer Messdiener erstellt werden',
      noDataText: 'Messdiener konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomTextFormField(
          title: 'Vorname',
          initialValue: dataModel().firstName,
          onChanged: (value) => dataModel().firstName = value,
        ),
        CustomTextFormField(
          title: 'Nachname',
          initialValue: dataModel().lastName,
          onChanged: (value) => dataModel().lastName = value,
        ),
        CustomTextFormField(
          title: 'Extrainformation',
          initialValue: dataModel().extra,
          onChanged: (value) => dataModel().extra = value,
        ),
        CustomDateFormField(
          title: 'Geburstag',
          date: dataModel().birthday,
          onChanged: (value) {
            dataModel().birthday = value;
            dataModel.refresh();
          },
        ),
        CustomDropdownFormField<int>(
          title: 'Gruppe',
          onChanged: (value) => dataModel().group = value,
          value: dataModel().group,
          items: controller
              .getAdditionalDataList<Group>()
              .map((g) => DropdownMenuItem<int>(
                    child: Text(g.groupName),
                    value: g.id,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
