import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_dropdown_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_int_form_field.dart';

class RequirementEditView extends DataEditViewWidget {
  RequirementEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Requirement>(
      (routeParameters) async {
        var typeRepository = Get.find<TypeRepository>();
        await typeRepository.getDataList();

        return typeRepository
            .requirements[int.parse(routeParameters['typeId'])];
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('requirementId')) {
          return Requirement(classifications: []);
        }

        return await baseRepository
            .getData(int.parse(routeParameters['requirementId']));
      },
      loadAdditionalData: (controller) async {
        await controller.storeAdditionalData<Role>(Get.find<RoleRepository>());
        await controller
            .storeAdditionalData<Group>(Get.find<GroupRepository>());
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Requirement>(
      controller: controller,
      newDataTitle: 'Neue Anforderung erstellen',
      editDataTitle: 'Anforderung bearbeiten',
      editDataDescription: 'Hier kann eine Anforderung bearbeitet werden',
      newDataDescription: 'Hier kann eine neue Anforderung erstellt werden',
      noDataText: 'Anforderung konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomDropdownFormField<int>(
          title: 'Rolle',
          onChanged: (value) => dataModel().role = value,
          value: dataModel().role,
          items: controller
              .getAdditionalDataList<Role>()
              .map((l) => DropdownMenuItem<int>(
                    child: Text(l.roleName),
                    value: l.id,
                  ))
              .toList(),
        ),
        CustomIntFormField(
          title: 'Anzahl',
          initialValue: dataModel().quantity,
          onChanged: (value) => dataModel().quantity = value,
        ),
        CustomFormField(
          title: 'Einteilungen',
          formField: ListView(
            shrinkWrap: true,
            children: controller.getAdditionalDataList<Group>().expand<Widget>(
              (g) {
                return <Widget>[
                  ListTile(title: Text(g.groupName)),
                  ...g.classifications.map<Widget>((c) {
                    return CheckboxListTile(
                      title: Text('${c.ageFrom} - ${c.ageTo}'),
                      value:
                          controller.dataModel().classifications.contains(c.id),
                      onChanged: (bool selected) {
                        selected
                            ? controller.dataModel().classifications.add(c.id)
                            : controller
                                .dataModel()
                                .classifications
                                .remove(c.id);
                        dataModel.refresh();
                      },
                    );
                  })
                ];
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
