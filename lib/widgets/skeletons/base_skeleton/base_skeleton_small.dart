import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/navigation_drawer/navigation_drawer.dart';

import 'header_bar.dart';

///
/// Eine kompakte Version des BaseSekeleton mit einem ausklappbarem Drawer.
///
/// Das [child] sollte im Normalfall ein [PageSkeleton] sein.
///
class BaseSekeletonSmall extends StatelessWidget {
  final Widget child;

  BaseSekeletonSmall({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: NavigationDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderBar(showDrawerButton: true),
          child,
        ],
      ),
    );
  }
}
