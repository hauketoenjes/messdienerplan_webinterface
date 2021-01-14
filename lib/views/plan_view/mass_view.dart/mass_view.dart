import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/clickable_popup_menu_item/clickable_popup_menu_item.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class MassView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Mass>(
      (routeSettings) async {
        var planRepository = Get.find<PlanRepository>();
        await planRepository.getModelList();

        return planRepository.masses[int.parse(routeSettings['planId'])];
      },
      loadAdditionalData: (controller) async {
        var locationRepository = Get.find<LocationRepository>();
        var locations = await locationRepository.getDataList();

        var typeRepository = Get.find<TypeRepository>();
        var types = await typeRepository.getDataList();

        controller.storeAdditionalData<List<Location>>(locations);
        controller.storeAdditionalData<List<Type>>(types);
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
      getDataCard: (data) {
        return DataCard(
          title: dateTimeFormat.format(data.time.toLocal()),
          points: [
            DataCardPoint(
              content: data.extra,
              icon: Icons.info_outline,
            ),
            DataCardPoint(
              content: data.location == null
                  ? 'Kein Ort angegeben'
                  : controller
                      .getAdditionalData<List<Location>>()
                      .singleWhere((l) => l.id == data.location)
                      .locationName,
              icon: Icons.map_outlined,
            ),
            DataCardPoint(
              content: data.type == null
                  ? 'Kein Typ angegeben'
                  : controller
                      .getAdditionalData<List<Type>>()
                      .singleWhere((t) => t.id == data.type)
                      .typeName,
              icon: Icons.flag_outlined,
            ),
          ],
          popupMenuItems: [
            ClickablePopupMenuItem(
              title: 'Bearbeiten',
              icon: Icon(Icons.edit),
              onSelected: () async {
                await Get.toNamed(AppRoutes.PLANS_MASSES_EDIT, arguments: data);
                await controller.refreshDataList();
              },
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
