import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';

class LocationEditView extends DataEditViewWidget {
  LocationEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Location>(
      (routeParameters) async {
        return Get.find<LocationRepository>();
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('locationId')) {
          return Location();
        }

        return await baseRepository
            .getData(int.parse(routeParameters['locationId']));
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Location>(
      controller: controller,
      newDataTitle: 'Neuen Ort erstellen',
      editDataTitle: 'Ort bearbeiten',
      editDataDescription: 'Hier kann ein Ort bearbeitet werden',
      newDataDescription: 'Hier kann ein neuer Ort erstellt werden',
      noDataText: 'Ort konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomTextFormField(
          title: 'Name',
          initialValue: dataModel().locationName,
          onChanged: (value) => dataModel().locationName = value,
        ),
      ],
    );
  }
}
