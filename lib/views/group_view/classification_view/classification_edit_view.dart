import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_int_form_field.dart';

class ClassificationEditView extends DataEditViewWidget {
  ClassificationEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Classification>(
      (routeParameters) async {
        var groupRepository = Get.find<GroupRepository>();
        await groupRepository.getDataList();

        return groupRepository
            .classifications[int.parse(routeParameters['groupId'])];
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('classificationId')) {
          return Classification();
        }

        return await baseRepository
            .getData(int.parse(routeParameters['classificationId']));
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Classification>(
      controller: controller,
      newDataTitle: 'Neue Einteilung erstellen',
      editDataTitle: 'Einteilung bearbeiten',
      editDataDescription: 'Hier kann eine Einteilung bearbeitet werden',
      newDataDescription: 'Hier kann eine neue Einteilung erstellt werden',
      noDataText: 'Einteilung konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomIntFormField(
          title: 'Alter von',
          initialValue: dataModel().ageFrom,
          onChanged: (value) => dataModel().ageFrom = value,
        ),
        CustomIntFormField(
          title: 'Alter bis',
          initialValue: dataModel().ageTo,
          onChanged: (value) => dataModel().ageTo = value,
        ),
      ],
    );
  }
}
