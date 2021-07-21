import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/base_skeleton_header.dart';

import 'navigation_drawer/navigation_drawer.dart';

///
/// Eine kompakte Version des BaseSekeleton mit einem ausklappbarem Drawer.
///
/// Das [child] sollte im Normalfall ein [PageSkeleton] sein.
///
class BaseSkeletonMobile extends StatelessWidget {
  final Widget child;

  const BaseSkeletonMobile({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: NavigationDrawer(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BaseSkeletonHeader(showDrawerButton: true),
          child,
        ],
      ),
    );
  }
}
