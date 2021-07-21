import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/navigation_drawer/drawer_item/drawer_category.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/navigation_drawer/drawer_item/drawer_item.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/navigation_drawer/drawer_item/legal_item.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/navigation_drawer/drawer_item/title_item.dart';

import 'drawer_item/abstract_drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  final scrollController = ScrollController();

  NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: theme.brightness == Brightness.dark ? 2 : 0,
      color: theme.brightness == Brightness.dark ? null : Colors.white,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                controller: scrollController,
                children: <AbstractDrawerItem>[
                  TitleItem(),
                  DrawerCategory(
                    title: 'Plandaten',
                  ),
                  DrawerItem(
                    title: 'Pläne',
                    iconData: Icons.date_range_rounded,
                    navigationRoute: plans,
                  ),
                  DrawerItem(
                    title: 'Messdiener:innen',
                    iconData: Icons.person_rounded,
                    navigationRoute: acolytes,
                  ),
                  DrawerCategory(
                    title: 'Einteilung',
                  ),
                  DrawerItem(
                    title: 'Orte',
                    iconData: Icons.map_rounded,
                    navigationRoute: locations,
                  ),
                  DrawerItem(
                    title: 'Rollen',
                    iconData: Icons.label_rounded,
                    navigationRoute: roles,
                  ),
                  DrawerItem(
                    title: 'Gruppen',
                    iconData: Icons.people_rounded,
                    navigationRoute: groups,
                  ),
                  DrawerItem(
                    title: 'Messetypen',
                    iconData: Icons.flag_rounded,
                    navigationRoute: types,
                  ),
                ],
              ),
            ),
            LegalItem(),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
