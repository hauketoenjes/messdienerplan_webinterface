import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/routes/custom_get_page.dart';
import 'drawer_items/abstract_drawer_item.dart';
import 'drawer_items/legal_item.dart';
import 'drawer_items/navigation_drawer_category.dart';
import 'drawer_items/navigation_drawer_item.dart';
import 'drawer_items/project_title_item.dart';

///
/// Navigation Drawer Widget. Das im konstruktur übergebene [selectedDrawerItem]
/// wird als ausgewählt angezeigt. Es gibt im Drawer zwei Abschnitte, ein
/// angepinnter Abschnitt am unteren Ende, welcher immer statisch dort bleibt
/// (für Info-Links oder Einstellungen) und einen scrollbaren Abschnitt unter dem
/// Logo. Dieser Bereich ist für sämtliche Menüpunkte gedacht.
///
/// Die Items im Navigation Drawer werden automatisch generiert und es wird
/// automatisch aus der Route gelesen, welcher Punkt aktuell ausgewählt ist.
///
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Theme.of(context).brightness == Brightness.dark ? 2 : 0,
      color:
          Theme.of(context).brightness == Brightness.dark ? null : Colors.white,
      child: Container(
        width: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <AbstractDrawerItem>[
                  ProjectTitleItem(),
                  ...generateDrawerItems(),
                ],
              ),
            ),
            LegalItem(),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  ///
  /// Generiert die Drawer items aus den GetRoutes. Erstellt automatisch Kategorien etc.
  ///
  static List<AbstractDrawerItem> generateDrawerItems() {
    var pages = AppPages.routes;
    var categories = <String, List<CustomGetPage>>{};
    var out = <AbstractDrawerItem>[];
    var currentRoute = Get.currentRoute;

    // Jede Seite seiner Kategorie zuordnen.
    pages.where((p) => p.isDrawerItem).forEach((page) {
      if (categories[page.drawerCategoryName] == null) {
        categories[page.drawerCategoryName] = <CustomGetPage>[];
      }
      categories[page.drawerCategoryName].add(page);
    });

    // Durch die Kategorien iterieren und alle Menüpunkte einfügen
    categories.forEach(
      (key, value) {
        if (key.isNotEmpty) out.add(NavigationDrawerCategory(key));

        out.addAll(
          value.map((page) {
            var parts = currentRoute.split('/');
            parts.removeWhere((element) => element.isEmpty);

            return NavigationDrawerItem(
              page.drawerTitle,
              page.drawerIcon,
              navigationRoute: page.name,
              isSelected: parts.first.contains(page.name.replaceAll('/', '')),
            );
          }),
        );
      },
    );

    return out;
  }
}
