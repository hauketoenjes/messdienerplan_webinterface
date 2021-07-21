import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isRequired;

  const BaseFormField({
    Key? key,
    required this.title,
    required this.child,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '$title ',
            style: textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
            children: <TextSpan>[
              if (isRequired)
                const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
