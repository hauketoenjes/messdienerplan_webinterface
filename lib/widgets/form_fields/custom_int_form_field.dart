import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

///
/// FormField um eine Ganzzahl zu bearbeiten
///
class CustomIntFormField extends StatelessWidget {
  final int initialValue;
  final String title;
  final Function(int value) onChanged;

  const CustomIntFormField({
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
        initialValue: initialValue != null ? initialValue.toString() : null,
        onChanged: (value) => onChanged(int.tryParse(value)),
        keyboardType: TextInputType.numberWithOptions(decimal: false),
        inputFormatters: [
          // Nur ganze Zahlen erlauben
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          labelText: title,
        ),
      ),
    );
  }
}
