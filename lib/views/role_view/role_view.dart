import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/clickable_popup_menu_item/clickable_popup_menu_item.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class RoleView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Role>(
      (routeParameters) async {
        return Get.find<RoleRepository>();
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return DataCardListView<Role>(
      controller: controller,
      title: 'Rollen',
      description: 'Hier können Rollen erstellt und bearbeitet werden.',
      noDataText: 'Keine Orte vorhanden',
      getDataCard: (data) {
        return DataCard(
          title: data.roleName,
          popupMenuItems: [
            ClickablePopupMenuItem(
              title: 'Bearbeiten',
              icon: Icon(Icons.edit),
              onSelected: () async {},
            ),
          ],
          points: [
            DataCardPoint(
              content: 'ID #${data.id.toString()}',
              icon: Icons.memory_outlined,
            )
          ],
        );
      },
    );
  }
}
