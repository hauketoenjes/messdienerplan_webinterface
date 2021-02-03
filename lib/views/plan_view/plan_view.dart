import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/clickable_popup_menu_item/clickable_popup_menu_item.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/stepper_widgets/stepper/create_new_plan/create_new_plan_assistant.dart';

class PlanView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Plan>(
      (routeParameters) async {
        return Get.find<PlanRepository>();
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return DataCardListView<Plan>(
      controller: controller,
      title: 'Pläne',
      description: 'Hier könne Pläne erstellt und bearbeitet werden.',
      noDataText: 'Keine Pläne vorhanden',
      createNewElementRoute: AppRoutes.PLANS_NEW,
      additionalActionButtons: [
        PageActionButton(
          label: 'Plan Assistent',
          icon: Icon(Icons.assistant),
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return CreateNewPlanAssistant();
                });
            await controller.refreshDataList();
          },
        ),
      ],
      getDataCard: (data) {
        return DataCard(
          title: 'Plan #${data.id.toString()}',
          description:
              '${DateFormat.yMMMd().format(data.dateFrom)} - ${DateFormat.yMMMd().format(data.dateTo)}',
          onTap: () async {
            await Get.toNamed(
                AppRoutes.PLANS_EDIT.replaceAll(':planId', data.id.toString()));
            await controller.refreshDataList();
          },
          points: [
            DataCardPoint(
              content: data.public ? 'Öffentlich' : 'Geheim gehalten',
              icon: data.public ? Icons.public : Icons.public_off,
            )
          ],
          popupMenuItems: [
            ClickablePopupMenuItem(
              title: data.public ? 'Geheim halten' : 'Veröffentlichen',
              icon: data.public ? Icon(Icons.public_off) : Icon(Icons.public),
              onSelected: () {
                controller.changeData(data..public = !data.public);
              },
            ),
          ],
          actions: [
            ElevatedButton(
              child: Text('Messen anzeigen'),
              onPressed: () async {
                await Get.toNamed(AppRoutes.PLANS_MASSES
                    .replaceAll(':planId', data.id.toString()));
                await controller.refreshDataList();
              },
            ),
          ],
        );
      },
    );
  }
}
