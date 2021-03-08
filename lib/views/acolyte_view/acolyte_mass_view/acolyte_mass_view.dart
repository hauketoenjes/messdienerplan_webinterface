import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class AcolyteMassView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<AcolyteMass>(
      (routeParameters) async {
        var acolyteRepository = Get.find<AcolyteRepository>();
        await acolyteRepository.getDataList();

        return acolyteRepository
            .acolyteMasses[int.parse(routeParameters['acolyteId'])];
      },
      loadAdditionalData: (controller) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getDataList();

        planRepository.masses.forEach((key, value) async {
          await controller.storeAdditionalData<Mass>(value);
        });

        await controller.storeAdditionalData<Role>(Get.find<RoleRepository>());
        await controller
            .storeAdditionalData<Location>(Get.find<LocationRepository>());
      },
    ),
  );

  final DateFormat dateTimeFormat = DateFormat.MMMMEEEEd().add_y().add_Hm();
  final DateFormat dateFormat = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return DataCardListView<AcolyteMass>(
      controller: controller,
      title: 'Messen von Messdiener:in',
      description:
          'Hier werden Messen zu einem:einer bestimmten Messdiener:in angezeigt',
      noDataText: 'Keine Messen',
      getDataCard: (data) {
        var role = controller.getAdditionalDataById<Role>(data.role);
        var mass = controller.getAdditionalDataById<Mass>(data.mass);
        var location =
            controller.getAdditionalDataById<Location>(mass.location);

        return DataCard(
          title: dateTimeFormat.format(mass.time.toLocal()),
          points: [
            DataCardPoint(
              content: location.locationName,
              icon: Icons.map_outlined,
            ),
            DataCardPoint(
              content: role.roleName,
              icon: Icons.label_outlined,
            ),
          ],
        );
      },
    );
  }
}
