import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/data_edit_view_controller.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view.dart';
import 'package:messdienerplan_webinterface/widgets/data_edit_view/data_edit_view_widget.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';

class TypeEditView extends DataEditViewWidget {
  TypeEditView(bool createNewEntry) : super(createNewEntry);

  final controller = Get.put(
    DataEditViewController<Type>(
      (routeParameters) async {
        return Get.find<TypeRepository>();
      },
      getDataModel: (routeParameters, baseRepository) async {
        if (!routeParameters.containsKey('typeId')) {
          return Type();
        }

        return await baseRepository
            .getData(int.parse(routeParameters['typeId']));
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DataEditView<Type>(
      controller: controller,
      newDataTitle: 'Neuen Typ erstellen',
      editDataTitle: 'Typ bearbeiten',
      editDataDescription: 'Hier kann ein Typ bearbeitet werden',
      newDataDescription: 'Hier kann ein neuer Typ erstellt werden',
      noDataText: 'Typ konnte nicht geladen oder erstellt werden',
      createNewEntry: createNewEntry,
      formChildren: (dataModel) => [
        CustomTextFormField(
          title: 'Name',
          initialValue: dataModel().typeName,
          onChanged: (value) => dataModel().typeName = value,
        ),
      ],
    );
  }
}
