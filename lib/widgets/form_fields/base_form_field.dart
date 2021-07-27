import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;
  final bool isRequired;

  const BaseFormField({
    Key? key,
    required this.title,
    this.description = '',
    required this.child,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
        if (description.isNotEmpty) ...[
          Text(
            description,
            style: textTheme.subtitle2!.copyWith(color: theme.hintColor),
          ),
          const SizedBox(height: 8),
        ],
        child,
      ],
    );
  }
}
