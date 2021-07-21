import 'package:messdienerplan_webinterface/misc/hero_tags.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter/material.dart';

import 'abstract_drawer_item.dart';

///
/// Drawer Item mit einem Titel und Icon. Beim Klick auf das Item wird [onTap]
/// aufgerufen.
///
class DrawerItem extends AbstractDrawerItem {
  final String title;
  final IconData iconData;
  final String? navigationRoute;
  final GestureTapCallback? onTap;

  DrawerItem({
    required this.title,
    required this.iconData,
    this.navigationRoute,
    this.onTap,
  }) : assert((onTap != null && navigationRoute == null) ||
            (onTap == null && navigationRoute != null));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isSelected = navigationRoute != null &&
        context.vRouter.url.startsWith(navigationRoute!);

    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: theme.brightness == Brightness.dark ? 2 : 0,
            shadowColor: Colors.transparent,
            color: theme.brightness == Brightness.dark ? null : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: Icon(
                  iconData,
                  color: isSelected
                      ? theme.colorScheme.secondary
                      : theme.disabledColor,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: isSelected
                        ? theme.textTheme.bodyText1!.color
                        : theme.disabledColor,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                onTap: onTap ??
                    () => context.vRouter.to(
                          navigationRoute!,
                          isReplacement: true,
                        ),
                hoverColor: theme.canvasColor,
              ),
            ),
          ),
        ),
        if (isSelected)
          Hero(
            tag: HeroTags.drawerActiveIndicator,
            child: Container(
              width: 2,
              height: 48,
              color: theme.colorScheme.secondary,
            ),
          ),
      ],
    );
  }
}
