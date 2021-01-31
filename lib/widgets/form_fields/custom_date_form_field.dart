import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

///
/// FormField um ein Datum auszuwählen.
///
class CustomDateFormField extends StatelessWidget {
  final String title;
  final DateTime date;
  final Function(DateTime newTime) onChanged;

  final dateFormat = DateFormat('dd.MM.yyyy');

  CustomDateFormField({
    Key key,
    @required this.title,
    @required this.date,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      title: title,
      formField: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktuelles Datum:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('${dateFormat.format(date.toLocal())}'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                var newDate = await showDatePicker(
                  context: context,
                  firstDate: date.subtract(Duration(days: 100 * 365)),
                  initialDate: date.toLocal(),
                  lastDate: date.add(Duration(days: 100 * 365)),
                );
                if (newDate == null) return;

                var oldDateTime = date.toLocal();
                var newDateTime = DateTime(
                  newDate.year,
                  newDate.month,
                  newDate.day,
                  oldDateTime.hour,
                  oldDateTime.minute,
                );

                onChanged(newDateTime);
              },
              child: Text('Datum ändern'),
            ),
          ),
        ],
      ),
    );
  }
}
