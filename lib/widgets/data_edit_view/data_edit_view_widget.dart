import 'package:flutter/material.dart';

///
/// Abstrakte Klasse für den [DataEditView] um zu unterscheiden, ob Daten erstellt
/// oder bearbeitet werden sollen.
///
abstract class DataEditViewWidget extends StatelessWidget {
  final bool createNewEntry;

  const DataEditViewWidget(this.createNewEntry, {Key key}) : super(key: key);
}
