import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final Widget formField;

  const CustomFormField({
    Key key,
    @required this.title,
    @required this.formField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(title, style: Theme.of(context).textTheme.subtitle1),
          ),
          formField
        ],
      ),
    );
  }
}
