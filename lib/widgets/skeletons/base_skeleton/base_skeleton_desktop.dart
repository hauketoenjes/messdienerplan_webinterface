import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/base_skeleton_header.dart';

import 'navigation_drawer/navigation_drawer.dart';

///
/// Die Desktop Version des BaseSkeleton mit Drawer auf der linken Seite, der
/// sich nicht einklappen lässt.
///
/// Das [child] sollte im Normalfall ein [PageSkeleton] sein.
///
class BaseSkeletonDesktop extends StatelessWidget {
  final Widget child;

  const BaseSkeletonDesktop({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: NavigationDrawer(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BaseSkeletonHeader(),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
