import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class GroupView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Group>(
      (routeParameters) async {
        return Get.find<GroupRepository>();
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return DataCardListView<Group>(
      controller: controller,
      title: 'Gruppen',
      description: 'Hier können Gruppen erstellt und bearbeitet werden.',
      noDataText: 'Keine Orte vorhanden',
      createNewElementRoute: AppRoutes.GROUPS_NEW,
      getDataCard: (data) {
        return DataCard(
          title: data.groupName,
          onTap: () async {
            await Get.toNamed(
              AppRoutes.GROUPS_EDIT.replaceAll(':groupId', data.id.toString()),
            );
            await controller.refreshDataList();
          },
          points: [
            DataCardPoint(
              content: 'ID #${data.id.toString()}',
              icon: Icons.memory_outlined,
            )
          ],
          actions: [
            ElevatedButton(
              child: Text('Einteilungen bearbeiten'),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
