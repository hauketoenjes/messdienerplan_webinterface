import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/misc/utils.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/clickable_popup_menu_item/clickable_popup_menu_item.dart';
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
        return dataModel.firstName.toLowerCase().contains(query) ||
            dataModel.lastName.toLowerCase().contains(query) ||
            dataModel.extra.toLowerCase().contains(query) ||
            dateFormat.format(dataModel.birthday).contains(query);
      },
    ),
  );

  static final dateFormat = DateFormat('dd.MM.yyyy');
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DataCardListView<Acolyte>(
      controller: controller,
      title: 'Messdiener',
      description:
          'Hier können Messdiener erstellt und bearbeitet werden. Messdiener können auf "Inaktiv" gesetzt werden, damit sie beim Plan generien nicht mehr eingeteilt werden.',
      noDataText: 'Keine Messdiener vorhanden',
      createNewElementRoute: AppRoutes.ACOLYTES_NEW,
      getDataCard: (data) {
        var title = '${data.firstName} ${data.lastName}';

        if (data.extra.isNotEmpty) {
          title = '$title (${data.extra})';
        }

        if (data.inactive) {
          title = '$title (inaktiv)';
        }

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
          popupMenuItems: [
            ClickablePopupMenuItem(
              title: data.inactive
                  ? 'Auf "Aktiv" setzten'
                  : 'Auf "Inaktiv" setzen',
              icon: data.inactive
                  ? Icon(Icons.toggle_off_outlined)
                  : Icon(Icons.toggle_on_outlined),
              onSelected: () {
                controller.changeData(data..inactive = !data.inactive);
              },
            ),
          ],
          actions: [
            ElevatedButton(
              onPressed: () async {
                await Get.toNamed(
                  AppRoutes.ACOLYTES_MASSES
                      .replaceAll(':acolyteId', data.id.toString()),
                );
                await controller.refreshDataList();
              },
              child: Text('Messen anzeigen'),
            )
          ],
        );
      },
    );
  }
}
