import 'package:flutter/material.dart';

///
/// Punkt, welcher im unteren Bereich einer [DataCard] angezeigt wird.
///
/// Zeigt ein [icon] und den [content] in einer Reihe an.
///
class DataCardPoint extends StatelessWidget {
  final String content;
  final IconData icon;

  const DataCardPoint({
    Key key,
    @required this.content,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(icon, size: 24),
          ),
          Expanded(
            child: Text(content, style: TextStyle()),
          ),
        ],
      ),
    );
  }
}
