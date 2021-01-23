import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/misc/utils.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class AcolyteView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Acolyte>(
      (routeParameters) async {
        return Get.find<AcolyteRepository>();
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Group>(Get.find<GroupRepository>());
      },
      matchesSearchQuery: (dataModel, query) {
        if (query.isEmpty) return true;

        var lowerQuery = query.toLowerCase();

        return dataModel.firstName.toLowerCase().contains(lowerQuery) ||
            dataModel.lastName.toLowerCase().contains(lowerQuery);
      },
    ),
  );

  final dateFormat = DateFormat('dd.MM.yyyy');
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DataCardListView<Acolyte>(
      controller: controller,
      title: 'Messdiener',
      description: 'Hier können Messdiener erstellt und bearbeitet werden.',
      noDataText: 'Keine Messdiener vorhanden',
      createNewElementRoute: AppRoutes.ACOLYTES_NEW,
      getDataCard: (data) {
        var title = data.extra.isNotEmpty
            ? '${data.firstName} ${data.lastName} (${data.extra})'
            : '${data.firstName} ${data.lastName}';
        return DataCard(
          title: title,
          onTap: () async {
            await Get.toNamed(
              AppRoutes.ACOLYTES_EDIT
                  .replaceAll(':acolyteId', data.id.toString()),
            );
            await controller.refreshDataList();
          },
          points: [
            DataCardPoint(
              content:
                  '${dateFormat.format(data.birthday)} (${Utils.calculateAge(data.birthday, now: now)})',
              icon: Icons.cake_outlined,
            ),
            DataCardPoint(
              content: data.group == null
                  ? 'In keiner Gruppe'
                  : controller
                      .getAdditionalDataById<Group>(data.group)
                      .groupName,
              icon: Icons.people_outline_outlined,
            )
          ],
          actions: [
            ElevatedButton(
              child: Text('Messen anzeigen'),
              onPressed: () async {
                await Get.toNamed(
                  AppRoutes.ACOLYTES_MASSES
                      .replaceAll(':acolyteId', data.id.toString()),
                );
                await controller.refreshDataList();
              },
            )
          ],
        );
      },
    );
  }
}
