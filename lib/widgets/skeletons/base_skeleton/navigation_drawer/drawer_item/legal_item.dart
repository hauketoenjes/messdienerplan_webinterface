import 'package:flutter/material.dart';

import 'abstract_drawer_item.dart';
import 'drawer_item.dart';

///
/// Widget welches den eingebauten Flutter [AboutDialog] anzeigt, welcher die
/// aktuelle Versionsnummer, Beschreibung und einen Link zu einer Lizenzübersicht
/// enthält, die automatisch aus der `pubspec.yaml` generiert wird.
///
class LegalItem extends AbstractDrawerItem {
  @override
  Widget build(BuildContext context) {
    return DrawerItem(
      title: 'Über diese App',
      iconData: Icons.info_rounded,
      onTap: () {
        showAboutDialog(
          context: context,
          applicationVersion: '1.0.0',
          applicationLegalese:
              'Messdienerplan App zum erstellen des Messdienerplans.',
          applicationIcon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'H',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        );
      },
    );
  }
}
