import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class RequirementView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Requirement>(
      (routeParameters) async {
        var typeRepository = Get.find<TypeRepository>();
        await typeRepository.getDataList();

        return typeRepository
            .requirements[int.parse(routeParameters['typeId'])];
      },
      loadAdditionalData: (controller) async {
        await controller.storeAdditionalData<Role>(Get.find<RoleRepository>());
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataCardListView<Requirement>(
      controller: controller,
      title: 'Anforderungen zum Typ',
      description:
          'Hier werden die Anforderungen zu einem bestimmten Typ angezeigt und können bearbeitet werden.',
      noDataText: 'Keine Anforderungen vorhanden',
      createNewElementRoute: AppRoutes.TYPES_REQUIREMENTS_NEW
          .replaceAll(':typeId', Get.parameters['typeId']),
      getDataCard: (data) {
        return DataCard(
          title:
              '${data.quantity} ${data.role == null ? 'Messdiener' : controller.getAdditionalDataById<Role>(data.role).roleName}',
          onTap: () async {
            await Get.toNamed(
              AppRoutes.TYPES_REQUIREMENTS_EDIT
                  .replaceAll(':typeId', Get.parameters['typeId'])
                  .replaceAll(':requirementId', data.id.toString()),
            );
            await controller.refreshDataList(forceUpdate: true);
          },
          points: [
            DataCardPoint(
              content: 'Aus ${data.classifications.length} Gruppeneinteilungen',
              icon: Icons.people_outlined,
            ),
          ],
        );
      },
    );
  }
}
