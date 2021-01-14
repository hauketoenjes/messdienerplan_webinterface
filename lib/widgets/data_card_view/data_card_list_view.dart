import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_list_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_action_button.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_skeleton.dart';
import 'package:responsive_grid/responsive_sliver_grid_list.dart';

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
    this.description = '',
    @required this.noDataText,
    this.additionalActionButtons = const [],
    @required this.getDataCard,
    this.desiredItemWidth = 300,
    this.minSpacing = 16,
    this.createNewElementRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageSkeleton(
        title: title,
        description: description,
        hasData: controller.dataModelList.isNotEmpty,
        noDataText: noDataText,
        error: controller.error(),
        loading: controller.loading(),
        actionButtons: [
              PageActionButton(
                label: 'Aktualisieren',
                icon: Icon(FontAwesomeIcons.sync),
                onPressed: () {
                  controller.refreshDataList(forceUpdate: true);
                },
              ),
              if (createNewElementRoute != null)
                PageActionButton(
                  label: 'Erstellen',
                  icon: Icon(FontAwesomeIcons.plus),
                  onPressed: () async {
                    await Get.toNamed(createNewElementRoute);
                    await controller.refreshDataList();
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
      ),
    );
  }
}
