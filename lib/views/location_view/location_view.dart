import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/clickable_popup_menu_item/clickable_popup_menu_item.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class LocationView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Location>(
      (routeSettings) async {
        return Get.find<LocationRepository>();
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataCardListView<Location>(
      controller: controller,
      title: 'Orte',
      description: 'Hier können Orte erstellt und bearbeitet werden.',
      noDataText: 'Keine Orte vorhanden',
      createNewElementRoute: AppRoutes.LOCATIONS_NEW,
      getDataCard: (data) {
        return DataCard(
          title: data.locationName,
          popupMenuItems: [
            ClickablePopupMenuItem(
              title: 'Bearbeiten',
              icon: Icon(Icons.edit),
              onSelected: () async {
                await Get.toNamed(
                  AppRoutes.LOCATIONS_EDIT
                      .replaceAll(':locationId', data.id.toString()),
                );
                await controller.refreshDataList();
              },
            ),
          ],
          points: [
            DataCardPoint(
              content: 'ID #${data.id}',
              icon: Icons.fingerprint_outlined,
            )
          ],
        );
      },
    );
  }
}
