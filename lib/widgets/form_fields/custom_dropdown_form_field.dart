import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String title;
  final Function(int value) onChanged;
  final int value;
  final List<DropdownMenuItem<int>> items;

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
      formField: DropdownButtonFormField<int>(
        onChanged: onChanged,
        hint: Text(title),
        value: value,
        items: items,
      ),
    );
  }
}
