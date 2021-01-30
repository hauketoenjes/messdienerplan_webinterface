import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

class CustomDropdownFormField<DataType> extends StatelessWidget {
  final String title;
  final Function(DataType value) onChanged;
  final DataType value;
  final List<DropdownMenuItem<DataType>> items;
  final String nullValueTitle;

  const CustomDropdownFormField({
    Key key,
    @required this.title,
    @required this.onChanged,
    @required this.value,
    @required this.items,
    this.nullValueTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      title: title,
      formField: DropdownButtonFormField<DataType>(
        onChanged: onChanged,
        hint: Text(nullValueTitle ?? title),
        value: value,
        items: <DropdownMenuItem<DataType>>[
          if (nullValueTitle != null)
            DropdownMenuItem(
              child: Text(nullValueTitle),
              value: null,
            ),
          ...items,
        ],
      ),
    );
  }
}
