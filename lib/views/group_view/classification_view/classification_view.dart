import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class ClassificationView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Classification>(
      (routeParameters) async {
        var groupRepository = Get.find<GroupRepository>();
        await groupRepository.getDataList();

        return groupRepository
            .classifications[int.parse(routeParameters['groupId'])];
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return DataCardListView<Classification>(
      controller: controller,
      title: 'Einteilungen',
      description:
          'Hier können Einteilungen zu einer bestimmten Gruppe erstellt und bearbeitet werden.',
      noDataText: 'Keine Einteilungen vorhanden',
      createNewElementRoute: AppRoutes.GROUPS_CLASSIFICATIONS_NEW
          .replaceAll(':groupId', Get.parameters['groupId']),
      getDataCard: (data) {
        return DataCard(
          title: '${data.ageFrom} - ${data.ageTo}',
          onTap: () async {
            await Get.toNamed(
              AppRoutes.GROUPS_CLASSIFICATIONS_EDIT
                  .replaceAll(':groupId', Get.parameters['groupId'])
                  .replaceAll(':classificationId', data.id.toString()),
            );
            await controller.refreshDataList();
          },
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
