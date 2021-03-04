import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/page_skeleton/page_skeleton.dart';

///
/// DataEditView zum bearbeiten eines [DataModel] mithilfe des [DataEditViewController]'s
///
/// [formChildren] definieren die Felder, mit denen das [DataModel] modifiziert
/// werden kann.
///
class DataEditView<DataModel> extends StatelessWidget {
  final String newDataTitle;
  final String editDataTitle;
  final String newDataDescription;
  final String editDataDescription;
  final String noDataText;
  final List<Widget> Function(Rx<DataModel> dataModel) formChildren;
  final bool createNewEntry;
  final DataEditViewController<DataModel> controller;

  final GlobalKey<FormState> _formKey = GlobalKey();

  DataEditView({
    Key key,
    @required this.newDataTitle,
    @required this.editDataTitle,
    @required this.newDataDescription,
    @required this.editDataDescription,
    @required this.noDataText,
    @required this.formChildren,
    @required this.createNewEntry,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageSkeleton(
        title: createNewEntry ? newDataTitle : editDataTitle,
        description: createNewEntry ? newDataDescription : editDataDescription,
        loading: controller.loading(),
        hasData: controller.dataModel() != null,
        noDataText: noDataText,
        error: controller.error(),
        formError: controller.formError(),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.dataModel() == null
                ? []
                : [
                    ...formChildren(controller.dataModel),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ButtonBar(
                        children: [
                          ...createNewEntry
                              ? [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    onPressed: controller.loading()
                                        ? null
                                        : () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              if (await controller
                                                  .createData()) {
                                                Get.back();
                                              }
                                            }
                                          },
                                    child: Text('Erstellen'),
                                  ),
                                ]
                              : [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    onPressed: controller.loading()
                                        ? null
                                        : () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              if (await controller
                                                  .modifyData()) {
                                                Get.back();
                                              }
                                            }
                                          },
                                    child: Text('Speichern'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                    onPressed: controller.loading()
                                        ? null
                                        : () async {
                                            if (await controller.deleteData()) {
                                              Get.back();
                                            }
                                          },
                                    child: Text('Löschen'),
                                  ),
                                ],
                        ],
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
