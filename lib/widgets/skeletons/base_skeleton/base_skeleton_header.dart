import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

///
/// Die obere Bar, welche ein Profilbild und den Button zum Drawer öffnen anzeigt.
/// Beim Klick auf das Profilbild das NotificationCenter geöffnet.
///
/// [showDrawerButton] sollte nur angezeigt werden, wenn der Drawer ausgeklappt werden
/// kann und nicht, wenn er statisch an der Linken Seite ist und nicht bewegt
/// werden kann.
///
/// Wenn es neue Ereigniss im Notification Center gibt, dann wird eine [Badge]
/// (Punkt neben dem Profilbild) angzeigt um den Nutzer auf eine neue Meldung
/// hinzuweisen.
///
class BaseSkeletonHeader extends StatelessWidget {
  final bool showDrawerButton;

  const BaseSkeletonHeader({
    Key? key,
    this.showDrawerButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showBackButton = Navigator.of(context).canPop();

    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDrawerButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      tooltip: 'Menü öffnen',
                      icon: const Icon(Icons.notes_outlined),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
            if (showBackButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      tooltip: 'Zurück',
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        context.vRouter.pop();
                      },
                    );
                  },
                ),
              ),
            if (showDrawerButton || showBackButton)
              Expanded(
                child: Container(),
              ),
            SizedBox(
              width: 56,
              height: 56,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Text(
                  'U',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
