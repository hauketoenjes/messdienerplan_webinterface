import 'package:flutter/material.dart';

abstract class DataEditViewWidget extends StatelessWidget {
  final bool createNewEntry;

  const DataEditViewWidget(this.createNewEntry, {Key key}) : super(key: key);
}
