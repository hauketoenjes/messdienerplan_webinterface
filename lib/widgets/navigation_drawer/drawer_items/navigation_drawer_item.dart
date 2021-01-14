import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../misc/enums/hero_tags.dart';
import 'abstract_drawer_item.dart';

///
/// Drawer Item mit einem Titel und Icon. Beim Klick auf das Item wird [onTap]
/// aufgerufen.
///
class NavigationDrawerItem extends AbstractDrawerItem {
  final String title;
  final IconData iconData;
  final String navigationRoute;
  final bool isSelected;
  final GestureTapCallback onTap;

  NavigationDrawerItem(
    this.title,
    this.iconData, {
    this.navigationRoute,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      assert(navigationRoute == null);
    } else {
      assert(navigationRoute != null);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Material(
            elevation: Theme.of(context).brightness == Brightness.dark ? 2 : 0,
            shadowColor: Colors.transparent,
            color: Theme.of(context).brightness == Brightness.dark
                ? null
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                leading: Icon(
                  iconData,
                  color: isSelected
                      ? Theme.of(context).accentColor
                      : Theme.of(context).disabledColor,
                ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: isSelected
                            ? Theme.of(context).textTheme.bodyText1.color
                            : Theme.of(context).disabledColor,
                      ),
                ),
                selected: false,
                onTap: onTap ?? () => Get.offAllNamed(navigationRoute),
                hoverColor: Theme.of(context).canvasColor,
              ),
            ),
          ),
        ),
        if (isSelected)
          Hero(
            tag: HeroTags.DRAWER_ACTIVE_INDICATOR,
            child: Container(
              width: 2,
              height: 48,
              color: Theme.of(context).accentColor,
            ),
          ),
      ],
    );
  }
}
