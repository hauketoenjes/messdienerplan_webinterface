import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/clickable_popup_menu_item/clickable_popup_menu_item.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class MassAcolyteView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<MassAcolyte>(
      (routeSettings) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getModelList();

        var massRepository =
            planRepository.masses[int.parse(routeSettings['planId'])];
        await massRepository.getModelList();

        return massRepository.massAcolytes[int.parse(routeSettings['massId'])];
      },
      loadAdditionalData: (controller) async {
        var acolyteRepository = Get.find<AcolyteRepository>();
        var acolytes = await acolyteRepository.getDataList();

        var roleRepository = Get.find<RoleRepository>();
        var roles = await roleRepository.getDataList();

        controller.storeAdditionalData<List<Acolyte>>(acolytes);
        controller.storeAdditionalData<List<Role>>(roles);
      },
    ),
  );

  final DateFormat dateTimeFormat = DateFormat.MMMMEEEEd().add_y().add_Hm();
  final DateFormat dateFormat = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return DataCardListView<MassAcolyte>(
      controller: controller,
      title: 'Messdiener zur Messe',
      description:
          'Hier werden die Messdiener zu einer bestimmten Messe angezeigt und können bearbeitet werden.',
      noDataText: 'Keine Messdiener eingeteilt',
      getDataCard: (data) {
        var acolyte = controller
            .getAdditionalData<List<Acolyte>>()
            .singleWhere((a) => a.id == data.acolyte);

        var role = controller
            .getAdditionalData<List<Role>>()
            .singleWhere((r) => r.id == data.role);

        return DataCard(
          title: '${acolyte.firstName} ${acolyte.lastName}',
          points: [
            DataCardPoint(
              content: role.roleName,
              icon: Icons.label_outlined,
            ),
          ],
          popupMenuItems: [
            ClickablePopupMenuItem(
              title: 'Bearbeiten',
              icon: Icon(Icons.edit),
              onSelected: () async {},
            ),
          ],
        );
      },
    );
  }
}
