import 'package:flutter/material.dart';

import 'page_action_button.dart';

class PageSkeletonHeader extends StatelessWidget {
  final String title;
  final String description;
  final List<PageActionButton> actionButtons;

  const PageSkeletonHeader({
    Key? key,
    required this.title,
    required this.description,
    this.actionButtons = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(height: 32),
        if (actionButtons.isNotEmpty)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: actionButtons,
          ),
        if (actionButtons.isNotEmpty) const SizedBox(height: 32),
      ],
    );
  }
}
