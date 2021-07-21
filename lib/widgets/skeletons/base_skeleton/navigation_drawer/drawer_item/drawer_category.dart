import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/navigation_drawer/drawer_item/abstract_drawer_item.dart';

class DrawerCategory extends AbstractDrawerItem {
  final String title;

  DrawerCategory({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        enabled: false,
        title: Text(title),
      ),
    );
  }
}
