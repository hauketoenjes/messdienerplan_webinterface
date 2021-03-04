import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_dropdown_form_field.dart';

class MassAcolyteEditView extends DataEditViewWidget {
  MassAcolyteEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<MassAcolyte>(
      (routeParameters) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getDataList();

        var massRepository =
            planRepository.masses[int.parse(routeParameters['planId'])];
        await massRepository.getDataList();

        return massRepository
            .massAcolytes[int.parse(routeParameters['massId'])];
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('massAcolyteId')) {
          return MassAcolyte();
        }

        return await baseRepository
            .getData(int.parse(routeParameters['massAcolyteId']));
      },
      loadAdditionalData: (controller) async {
        await controller.storeAdditionalData<Role>(Get.find<RoleRepository>());
        await controller
            .storeAdditionalData<Acolyte>(Get.find<AcolyteRepository>());
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<MassAcolyte>(
      controller: controller,
      newDataTitle: 'Neuen Messdiener hinzufügen',
      editDataTitle: 'Messdiener bearbeiten',
      editDataDescription: 'Hier kann ein Messdiener bearbeitet werden',
      newDataDescription: 'Hier kann ein neuer Messdiener hinzugefügt werden',
      noDataText: 'Messdiener konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomDropdownFormField<int>(
          title: 'Messdiener',
          onChanged: (value) => dataModel().acolyte = value,
          value: dataModel().acolyte,
          items: controller.getAdditionalDataList<Acolyte>().map((a) {
            var name = a.extra.isNotEmpty
                ? '${a.firstName} ${a.lastName} (${a.extra})'
                : '${a.firstName} ${a.lastName}';
            return DropdownMenuItem<int>(
              value: a.id,
              child: Text(name),
            );
          }).toList(),
        ),
        CustomDropdownFormField<int>(
          title: 'Rolle',
          nullValueTitle: 'Keine Rolle',
          onChanged: (value) => dataModel().role = value,
          value: dataModel().role,
          items: controller
              .getAdditionalDataList<Role>()
              .map((t) => DropdownMenuItem<int>(
                    value: t.id,
                    child: Text(t.roleName),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
