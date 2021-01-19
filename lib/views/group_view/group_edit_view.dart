import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';

class GroupEditView extends DataEditViewWidget {
  GroupEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Group>(
      (routeParameters) async {
        return Get.find<GroupRepository>();
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('groupId')) {
          return Group();
        }

        return await baseRepository
            .getData(int.parse(routeParameters['groupId']));
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Group>(
      controller: controller,
      newDataTitle: 'Neue Gruppe erstellen',
      editDataTitle: 'Gruppe bearbeiten',
      editDataDescription: 'Hier kann eine Gruppe bearbeitet werden',
      newDataDescription: 'Hier kann eine neue Gruppe erstellt werden',
      noDataText: 'Gruppe konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomTextFormField(
          title: 'Name',
          initialValue: dataModel().groupName,
          onChanged: (value) => dataModel().groupName = value,
        ),
      ],
    );
  }
}
