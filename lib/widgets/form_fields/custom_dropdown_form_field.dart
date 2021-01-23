import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

class CustomDropdownFormField<DataType> extends StatelessWidget {
  final String title;
  final Function(DataType value) onChanged;
  final DataType value;
  final List<DropdownMenuItem<DataType>> items;

  const CustomDropdownFormField({
    Key key,
    @required this.title,
    @required this.onChanged,
    @required this.value,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      title: title,
      formField: DropdownButtonFormField<DataType>(
        onChanged: onChanged,
        hint: Text(title),
        value: value,
        items: items,
      ),
    );
  }
}
