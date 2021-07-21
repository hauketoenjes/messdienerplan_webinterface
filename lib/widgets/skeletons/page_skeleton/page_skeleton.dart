import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page_action_button.dart';
import 'page_skeleton_header.dart';

class PageSkeleton extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final String title;
  final String description;
  final List<PageActionButton> actionButtons;
  final Widget? sliverChild;
  final List<Widget>? sliverChildren;
  final Widget? child;

  PageSkeleton({
    Key? key,
    required this.title,
    required this.description,
    this.actionButtons = const [],
    this.sliverChild,
    this.sliverChildren,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[
      SliverToBoxAdapter(
        child: PageSkeletonHeader(
          description: description,
          title: title,
          actionButtons: actionButtons,
        ),
      ),
    ];

    if (sliverChild != null) {
      slivers.add(sliverChild!);
    }

    if (child != null) {
      slivers.add(
        SliverToBoxAdapter(
          child: child,
        ),
      );
    }

    if (sliverChildren != null) {
      slivers.addAll(sliverChildren!);
    }

    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: slivers,
            ),
          ),
        ),
      ),
    );
  }
}
