import 'package:flutter/material.dart';

class DecisionButton extends StatelessWidget {
  final bool selected;
  final Icon icon;
  final void Function() onTap;
  final String title;

  const DecisionButton({
    Key key,
    @required this.selected,
    @required this.icon,
    @required this.onTap,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: selected ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              selected ? Theme.of(context).accentColor.withOpacity(0.1) : null,
          border: Border.all(
            color: selected
                ? Theme.of(context).accentColor
                : Theme.of(context).disabledColor,
            width: 2,
          ),
        ),
        width: 150,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
