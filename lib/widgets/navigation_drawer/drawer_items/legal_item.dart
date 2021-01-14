import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'abstract_drawer_item.dart';
import 'navigation_drawer_item.dart';

///
/// Widget welches den eingebauten Flutter [AboutDialog] anzeigt, welcher die
/// aktuelle Versionsnummer, Beschreibung und einen Link zu einer Lizenzübersicht
/// enthält, die automatisch aus der `pubspec.yaml` generiert wird.
///
class LegalItem extends AbstractDrawerItem {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawerItem(
      'Über diese App',
      Icons.info_outline,
      onTap: () {
        showAboutDialog(
          context: context,
          applicationVersion: '1.0.0',
          routeSettings: RouteSettings(name: '/legal'),
          applicationLegalese:
              'Messdienerplan App zum erstellen des Messdienerplans.',
          applicationIcon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
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
