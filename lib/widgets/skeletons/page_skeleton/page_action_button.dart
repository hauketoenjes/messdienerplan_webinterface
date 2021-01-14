import 'package:flutter/material.dart';

///
/// Ein PageActionButton ist der Button unter dem Titel und der Beschreibung eines
/// [PakeSkeleton]'s. Hier können zum Beispiel Aktionen wie "Aktualisieren" etc.
/// angezeigt werden. Die Aktionen sollten immer die gesamte Seite betreffen und keine
/// speziellen Aktionen, die nur für einen Datenpunkt relevant sind.
///
class PageActionButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  const PageActionButton({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Text(label, style: TextStyle(fontSize: 16)),
      onPressed: onPressed,
    );
  }
}
