import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/navigation_drawer/drawer_item/abstract_drawer_item.dart';

///
/// Das Widget am oberen Rand des Drawer's, welches ein Logo und einen Title
/// beinhaltet
///
class TitleItem extends AbstractDrawerItem {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'H',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              'Messdienerplan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
