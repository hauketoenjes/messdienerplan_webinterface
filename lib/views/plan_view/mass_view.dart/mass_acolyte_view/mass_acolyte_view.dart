import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class MassAcolyteView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<MassAcolyte>(
      (routeParameters) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getModelList();

        var massRepository =
            planRepository.masses[int.parse(routeParameters['planId'])];
        await massRepository.getModelList();

        return massRepository
            .massAcolytes[int.parse(routeParameters['massId'])];
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Acolyte>(Get.find<AcolyteRepository>());
        await controller.storeAdditionalData<Role>(Get.find<RoleRepository>());
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
      createNewElementRoute: AppRoutes.PLANS_MASSES_ACOLYTES_NEW
          .replaceAll(':planId', Get.parameters['planId'])
          .replaceAll(':massId', Get.parameters['massId']),
      getDataCard: (data) {
        var acolyte = controller.getAdditionalDataById<Acolyte>(data.acolyte);
        var role = data.role != null
            ? controller.getAdditionalDataById<Role>(data.role).roleName
            : 'Messdiener';

        return DataCard(
          title: '${acolyte.firstName} ${acolyte.lastName}',
          onTap: () async {
            await Get.toNamed(
              AppRoutes.PLANS_MASSES_ACOLYTES_EDIT
                  .replaceAll(':planId', Get.parameters['planId'])
                  .replaceAll(':massId', Get.parameters['massId'])
                  .replaceAll(':massAcolyteId', data.id.toString()),
            );
            await controller.refreshDataList(forceUpdate: true);
          },
          points: [
            DataCardPoint(
              content: role,
              icon: Icons.label_outlined,
            ),
          ],
        );
      },
    );
  }
}
