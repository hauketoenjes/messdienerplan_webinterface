import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateStep extends StatefulWidget {
  final void Function(DateTimeRange value) onChanged;

  const SelectDateStep({Key key, this.onChanged}) : super(key: key);

  @override
  _SelectDateStepState createState() => _SelectDateStepState();
}

class _SelectDateStepState extends State<SelectDateStep> {
  final dateFormat = DateFormat('dd.MM.yyyy');
  DateTimeRange currentRange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton.icon(
            icon: Icon(Icons.date_range_outlined),
            label: Text('Bereich wählen'),
            onPressed: () async {
              var range = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 10 * 365)),
              );
              widget.onChanged(range);

              setState(() {
                currentRange = range;
              });
            },
          ),
        ),
        Text(
          currentRange != null
              ? '${dateFormat.format(currentRange.start)} - ${dateFormat.format(currentRange.end)}'
              : 'Noch keinen Bereich ausgewählt',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
