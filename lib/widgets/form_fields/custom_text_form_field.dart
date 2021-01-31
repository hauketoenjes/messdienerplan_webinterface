import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

///
/// FormField um Text zu bearbeiten.
///
class CustomTextFormField extends StatelessWidget {
  final String initialValue;
  final String title;
  final Function(String value) onChanged;

  const CustomTextFormField({
    Key key,
    @required this.title,
    @required this.initialValue,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      title: title,
      formField: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: title,
        ),
      ),
    );
  }
}
