import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListFormField<T> extends StatefulWidget {
  final List<T> initialList;
  final Widget Function(T item, void Function() delete) buildItem;
  final void Function(List<T> items) onChanged;
  final Widget Function(void Function(T toAdd) add) buildAddWidget;
  final String Function(int length) itemCountText;

  const ListFormField({
    Key? key,
    required this.initialList,
    required this.itemCountText,
    required this.onChanged,
    required this.buildAddWidget,
    required this.buildItem,
  }) : super(key: key);

  @override
  _ListFormFieldState<T> createState() => _ListFormFieldState<T>();
}

class _ListFormFieldState<T> extends State<ListFormField<T>> {
  List<T> items = [];
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();

  void deleteItem(int index) {
    final toRemove = items[index];

    _animatedListKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: widget.buildItem(toRemove, () {
          deleteItem(index);
        }),
      );
    });

    setState(() {
      items.removeAt(index);
    });

    widget.onChanged(items);
  }

  void add(T item) {
    setState(() {
      items.insert(0, item);
    });

    _animatedListKey.currentState!.insertItem(0);

    widget.onChanged(items);
  }

  @override
  void initState() {
    items = widget.initialList.toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.buildAddWidget(add),
        const SizedBox(height: 16),
        Text(widget.itemCountText(items.length)),
        AnimatedList(
          key: _animatedListKey,
          shrinkWrap: true,
          initialItemCount: items.length,
          itemBuilder: (context, index, animation) {
            final item = items[index];
            return SizeTransition(
              sizeFactor: animation,
              child: widget.buildItem(
                item,
                () {
                  deleteItem(index);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
