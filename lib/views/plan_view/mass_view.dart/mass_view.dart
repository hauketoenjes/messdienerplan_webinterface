import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/stepper_widgets/stepper/generate_plan/generate_plan_assistant.dart';

class MassView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Mass>(
      (routeParameters) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getModelList();

        return planRepository.masses[int.parse(routeParameters['planId'])];
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Location>(Get.find<LocationRepository>());
        await controller.storeAdditionalData<Type>(Get.find<TypeRepository>());
      },
    ),
  );

  final DateFormat dateTimeFormat = DateFormat.MMMMEEEEd().add_y().add_Hm();
  final DateFormat dateFormat = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return DataCardListView<Mass>(
      controller: controller,
      title: 'Messen zum Plan',
      description:
          'Hier werden die Messen zu einem bestimmten Plan angezeigt und können bearbeitet werden.',
      noDataText: 'Keine Messen vorhanden',
      createNewElementRoute: AppRoutes.PLANS_MASSES_NEW
          .replaceAll(':planId', Get.parameters['planId']),
      additionalActionButtons: [
        PageActionButton(
          label: 'Plan generieren',
          icon: Icon(Icons.casino_outlined),
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return GeneratePlanAssistant(
                    planId: int.tryParse(Get.parameters['planId']),
                  );
                });
            await controller.refreshDataList(forceUpdate: true);
          },
        ),
      ],
      getDataCard: (data) {
        return DataCard(
          title: dateTimeFormat.format(data.time.toLocal()),
          onTap: () async {
            await Get.toNamed(
              AppRoutes.PLANS_MASSES_EDIT
                  .replaceAll(':planId', Get.parameters['planId'])
                  .replaceAll(':massId', data.id.toString()),
            );
            await controller.refreshDataList(forceUpdate: true);
          },
          points: [
            DataCardPoint(
              content: data.extra,
              icon: Icons.info_outline,
            ),
            DataCardPoint(
              content: data.location == null
                  ? 'Kein Ort angegeben'
                  : controller
                      .getAdditionalDataById<Location>(data.location)
                      .locationName,
              icon: Icons.map_outlined,
            ),
            DataCardPoint(
              content: data.type == null
                  ? 'Kein Typ angegeben'
                  : controller.getAdditionalDataById<Type>(data.type).typeName,
              icon: Icons.flag_outlined,
            ),
          ],
          actions: [
            ElevatedButton(
              child: Text('Messdiener anzeigen'),
              onPressed: () async {
                await Get.toNamed(
                  AppRoutes.PLANS_MASSES_ACOLYTES
                      .replaceAll(':planId', Get.parameters['planId'])
                      .replaceAll(':massId', data.id.toString()),
                );
              },
            )
          ],
        );
      },
    );
  }
}
