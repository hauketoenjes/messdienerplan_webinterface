import 'package:flutter/cupertino.dart';

import 'base_skeleton_desktop.dart';
import 'base_skeleton_mobile.dart';

class BaseSkeleton extends StatelessWidget {
  final Widget child;

  const BaseSkeleton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200
        ? BaseSkeletonDesktop(
            child: child,
          )
        : BaseSkeletonMobile(
            child: child,
          );
  }
}
