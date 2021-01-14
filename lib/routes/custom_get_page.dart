import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

///
/// Eine eigene Version der [GetPage] um eine automatische Generierung vom
/// Navigation Drawer zu ermöglichen.
///
class CustomGetPage extends GetPage {
  final bool isDrawerItem;
  final String drawerTitle;
  final String drawerCategoryName;
  final IconData drawerIcon;

  const CustomGetPage({
    this.isDrawerItem = false,
    this.drawerTitle = '',
    this.drawerCategoryName = '',
    this.drawerIcon,
    //
    @required String name,
    @required GetPageBuilder page,
    String title,
    RouteSettings settings,
    bool maintainState = true,
    Curve curve = Curves.linear,
    Alignment alignment,
    Map<String, String> parameter,
    bool opaque = true,
    Duration transitionDuration,
    bool popGesture,
    Bindings binding,
    List<Bindings> bindings,
    Transition transition,
    CustomTransition customTransition,
    bool fullscreenDialog = false,
  }) : super(
          name: name,
          page: page,
          title: title,
          settings: settings,
          maintainState: maintainState,
          curve: curve,
          alignment: alignment,
          parameter: parameter,
          opaque: opaque,
          transitionDuration: transitionDuration,
          popGesture: popGesture,
          binding: binding,
          bindings: bindings,
          transition: transition,
          customTransition: customTransition,
          fullscreenDialog: fullscreenDialog,
        );
}
