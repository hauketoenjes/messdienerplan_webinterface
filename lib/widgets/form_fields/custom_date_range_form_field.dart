import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_form_field.dart';

///
/// FormField um ein Datums-Bereich auszuwählen.
///
class CustomDateRangeFormField extends StatelessWidget {
  final String title;
  final DateTime dateFrom;
  final DateTime dateTo;
  final Function(DateTime newFrom, DateTime newTo) onChanged;

  final dateFormat = DateFormat('dd.MM.yyyy');

  CustomDateRangeFormField({
    Key key,
    @required this.title,
    @required this.dateFrom,
    @required this.dateTo,
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
                  'Aktueller Bereich:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      '${dateFormat.format(dateFrom)} bis zum ${dateFormat.format(dateTo)}'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                var newRange = await showDateRangePicker(
                  context: context,
                  firstDate: dateFrom.subtract(Duration(days: 100 * 365)),
                  lastDate: dateTo.add(Duration(days: 100 * 365)),
                  initialDateRange: DateTimeRange(
                    start: dateFrom,
                    end: dateTo,
                  ),
                );
                if (newRange == null) return;

                onChanged(newRange.start, newRange.end);
              },
              child: Text('Bereich ändern'),
            ),
          ),
        ],
      ),
    );
  }
}
