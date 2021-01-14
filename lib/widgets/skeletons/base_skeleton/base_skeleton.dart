import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_skeleton_large.dart';
import 'base_skeleton_small.dart';

///
/// BaseSekeleton Widget, welches je nach Bildschirmgröße ein anderes Widget anzeigt.
///
class BaseSkeleton extends StatelessWidget {
  final Widget child;

  BaseSkeleton({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.responsiveValue<Widget>(
      desktop: BaseSekeletonLarge(
        child: child,
      ),
      mobile: BaseSekeletonSmall(
        child: child,
      ),
    );
  }
}
