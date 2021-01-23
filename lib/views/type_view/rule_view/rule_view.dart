import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';
import 'package:messdienerplan_webinterface/misc/extension_methods.dart';

class RuleView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Rule>(
      (routeParameters) async {
        var typeRepository = Get.find<TypeRepository>();
        await typeRepository.getModelList();

        return typeRepository.rules[int.parse(routeParameters['typeId'])];
      },
      loadAdditionalData: (controller) async {
        await controller
            .storeAdditionalData<Location>(Get.find<LocationRepository>());
      },
    ),
  );

  final DateFormat timeFormat = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return DataCardListView<Rule>(
      controller: controller,
      title: 'Regeln zum Typ',
      description:
          'Hier werden die Regeln zu einem bestimmten Typ angezeigt und können bearbeitet werden.',
      noDataText: 'Keine Regeln vorhanden',
      createNewElementRoute: AppRoutes.TYPES_RULES_NEW
          .replaceAll(':typeId', Get.parameters['typeId']),
      getDataCard: (data) {
        return DataCard(
          title: "${data.dayOfWeek.value}'s um ${timeFormat.format(data.time)}",
          onTap: () async {
            await Get.toNamed(
              AppRoutes.TYPES_RULES_EDIT
                  .replaceAll(':typeId', Get.parameters['typeId'])
                  .replaceAll(':ruleId', data.id.toString()),
            );
            await controller.refreshDataList(forceUpdate: true);
          },
          points: [
            DataCardPoint(
              content: data.location == null
                  ? 'Kein Ort angegeben'
                  : controller
                      .getAdditionalDataById<Location>(data.location)
                      .locationName,
              icon: Icons.map_outlined,
            ),
          ],
        );
      },
    );
  }
}
