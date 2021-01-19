import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card.dart';
import 'package:messdienerplan_webinterface/widgets/data_card/data_card_point.dart';
import 'package:messdienerplan_webinterface/widgets/data_card_view/data_card_list_view.dart';

class TypeView extends StatelessWidget {
  final controller = Get.put(
    DataListViewController<Type>(
      (routeParameters) async {
        return Get.find<TypeRepository>();
      },
      matchesSearchQuery: (dataModel, query) {
        if (query.isEmpty) return true;

        return dataModel.typeName.toLowerCase().contains(query.toLowerCase());
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return DataCardListView<Type>(
      controller: controller,
      title: 'Mesetypen',
      description: 'Hier können Messetypen erstellt und bearbeitet werden.',
      noDataText: 'Keine Messetypen vorhanden',
      createNewElementRoute: AppRoutes.TYPES_NEW,
      getDataCard: (data) {
        return DataCard(
          title: data.typeName,
          onTap: () async {
            await Get.toNamed(
              AppRoutes.TYPES_EDIT.replaceAll(':typeId', data.id.toString()),
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
              child: Text('Regeln bearbeiten'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text('Anforderungen bearbeiten'),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
