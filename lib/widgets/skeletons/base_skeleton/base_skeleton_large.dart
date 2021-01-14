import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/navigation_drawer/navigation_drawer.dart';

import 'header_bar.dart';

///
/// Die Desktop Version des BaseSkeleton mit Drawer auf der linken Seite, der
/// sich nicht einklappen lässt.
///
/// Das [child] sollte im Normalfall ein [PageSkeleton] sein.
///
class BaseSekeletonLarge extends StatelessWidget {
  final Widget child;

  const BaseSekeletonLarge({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            child: NavigationDrawer(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderBar(),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
