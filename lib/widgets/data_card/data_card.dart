import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/widgets/animations/fade_in_animation.dart';

import 'clickable_popup_menu_item/clickable_popup_menu_item.dart';

///
/// Eine Card, welche einen [title] und eine [description] anzeigt. Außerdem können
/// unter Title und Beschreibung noch weitere Widgets mit [points] angezeigt werden.
/// In der Regel sollten das [DataCardPoints] sein.
///
/// Wenn [onTap] gesetzt ist, dann ist die Card klickbar und hat einen hover Effekt.
///
/// Wenn [dense] gesetzt ist, wird der Abstand zwischen [description] und
/// [points] verringert.
///
/// Wenn [popupMenuItems] angegeben werden, dann wir ein PopupMenu oben rechts
/// in der Karte angezeigt und es gibt ein Callback, wenn ein Item ausgewählt
/// wird.
///
/// Es können [actions] angegeben werden, welche rechts unten in der Karte angezeigt
/// werden.
///
class DataCard extends StatelessWidget {
  final String title;
  final List<Widget> points;
  final String description;
  final GestureTapCallback onTap;
  final List<ClickablePopupMenuItem> popupMenuItems;
  final List<ElevatedButton> actions;

  const DataCard({
    Key key,
    @required this.title,
    this.description = '',
    this.points = const [],
    this.popupMenuItems = const [],
    this.onTap,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    if (popupMenuItems.isNotEmpty)
                      PopupMenuButton<int>(
                        onSelected: (value) =>
                            popupMenuItems[value].onSelected(),
                        itemBuilder: (context) {
                          return popupMenuItems
                              .map((e) =>
                                  e.popupMenuEntry(popupMenuItems.indexOf(e)))
                              .toList();
                        },
                      ),
                  ],
                ),
                if (popupMenuItems.isEmpty && points.isNotEmpty)
                  SizedBox(height: 8),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                if (points.isNotEmpty) ...[
                  SizedBox(height: 4),
                  ...points,
                ],
                if (actions.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 8,
                    runSpacing: 8,
                    children: actions,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
