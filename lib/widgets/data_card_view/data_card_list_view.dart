import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_skeleton.dart';
import 'package:responsive_grid/responsive_sliver_grid_list.dart';

///
/// View, um mit einem [DataListViewController] eine Liste von Daten anzuzeigen.
///
/// Die Methode [getDataCard] muss angegeben werden um ein Widget zu bauen, welches
/// die Daten anzeigt.
///
class DataCardListView<DataModel> extends StatelessWidget {
  final DataListViewController<DataModel> controller;
  final String title;
  final String description;
  final String noDataText;
  final List<PageActionButton> additionalActionButtons;
  final Widget Function(DataModel data) getDataCard;

  final double desiredItemWidth;
  final double minSpacing;
  final String createNewElementRoute;

  DataCardListView({
    Key key,
    @required this.controller,
    @required this.title,
    @required this.noDataText,
    @required this.getDataCard,
    this.description = '',
    this.additionalActionButtons = const [],
    this.desiredItemWidth = 300,
    this.minSpacing = 16,
    this.createNewElementRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageSkeleton(
        title: title,
        description: description,
        hasData: controller.dataModelList.isNotEmpty,
        noDataText: noDataText,
        error: controller.error(),
        loading: controller.loading(),
        showSearch: controller.matchesSearchQuery != null,
        onSearch: controller.onSearch,
        initialSearchValue: controller.currentQuery,
        formError: controller.formError(),
        actionButtons: [
              PageActionButton(
                label: 'Aktualisieren',
                icon: Icon(Icons.refresh_outlined),
                onPressed: () {
                  controller.refreshDataList(forceUpdate: true);
                },
              ),
              if (createNewElementRoute != null)
                PageActionButton(
                  label: 'Erstellen',
                  icon: Icon(Icons.add_outlined),
                  onPressed: () async {
                    await Get.toNamed(createNewElementRoute);
                    await controller.refreshDataList(forceUpdate: true);
                  },
                ),
            ] +
            additionalActionButtons,
        sliverChild: Obx(
          () => ResponsiveSliverGridList(
            desiredItemWidth: desiredItemWidth,
            minSpacing: minSpacing,
            children: controller.dataModelList
                .map((data) => getDataCard(data))
                .toList(),
          ),
        ),
      );
    });
  }
}
