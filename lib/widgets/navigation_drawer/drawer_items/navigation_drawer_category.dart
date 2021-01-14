import 'package:flutter/material.dart';

import 'abstract_drawer_item.dart';

///
/// Drawer Item, welches eine Kategorie darstellt.
///
class NavigationDrawerCategory extends AbstractDrawerItem {
  final String title;

  NavigationDrawerCategory(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        enabled: false,
        title: Text(
          title,
        ),
      ),
    );
  }
}
