import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

class CustomTimeFormField extends StatelessWidget {
  final String title;
  final DateTime time;
  final Function(DateTime newTime) onChanged;

  final timeFormat = DateFormat.Hm();

  CustomTimeFormField({
    Key key,
    @required this.title,
    @required this.time,
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
                  'Aktuelle Uhrzeit:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('${timeFormat.format(time.toLocal())}'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                var newTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(time.toLocal()),
                );
                if (newTime == null) return;

                var oldDateTime = time.toLocal();
                var newDateTime = DateTime(
                  oldDateTime.year,
                  oldDateTime.month,
                  oldDateTime.day,
                  newTime.hour,
                  newTime.minute,
                );

                onChanged(newDateTime);
              },
              child: Text('Uhrzeit ändern'),
            ),
          ),
        ],
      ),
    );
  }
}
