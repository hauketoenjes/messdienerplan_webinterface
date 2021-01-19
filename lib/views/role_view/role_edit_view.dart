import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';

class RoleEditView extends DataEditViewWidget {
  RoleEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Role>(
      (routeParameters) async {
        return Get.find<RoleRepository>();
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('roleId')) {
          return Role();
        }

        return await baseRepository
            .getData(int.parse(routeParameters['roleId']));
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Role>(
      controller: controller,
      newDataTitle: 'Neue Rolle erstellen',
      editDataTitle: 'Rolle bearbeiten',
      editDataDescription: 'Hier kann eine Rolle bearbeitet werden',
      newDataDescription: 'Hier kann eine neue Rolle erstellt werden',
      noDataText: 'Rolle konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomTextFormField(
          title: 'Name',
          initialValue: dataModel().roleName,
          onChanged: (value) => dataModel().roleName = value,
        ),
      ],
    );
  }
}
