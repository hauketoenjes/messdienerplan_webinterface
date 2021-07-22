import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionDialog extends StatelessWidget {
  final String title;
  final String content;

  const QuestionDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Nein'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Ja'),
        ),
      ],
    );
  }
}
