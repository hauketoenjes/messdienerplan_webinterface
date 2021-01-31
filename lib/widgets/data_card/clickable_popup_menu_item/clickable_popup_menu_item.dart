import 'package:flutter/material.dart';

///
/// Ein Wrapper für ein [PopupMenuItem] um es in StatelessWidgets klickbar zu machen
/// ohne manuell eine Value anzugeben.
///
/// Der [title] wird als Text im PopupMenuEntry angezeigt
///
/// [onSelected] wird aufgerufen, wenn das Item ausgewählt wurde.
///
class ClickablePopupMenuItem {
  final void Function() onSelected;
  final String title;
  final Icon icon;

  ClickablePopupMenuItem({
    @required this.title,
    @required this.icon,
    @required this.onSelected,
  });

  PopupMenuItem<int> popupMenuEntry(int value) {
    return PopupMenuItem<int>(
      child: ListTile(
        title: Text(title),
        leading: icon,
      ),
      value: value,
    );
  }
}
