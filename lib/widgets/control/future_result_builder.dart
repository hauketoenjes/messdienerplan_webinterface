import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureResultBuilder<T> extends StatelessWidget {
  final Future<Result<T>>? future;
  final Widget Function(BuildContext context, T value) buildValueChild;
  final void Function()? onReload;

  const FutureResultBuilder({
    Key? key,
    required this.future,
    required this.buildValueChild,
    this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result<T>>(
      future: future,
      builder: (context, snapshot) {
        Widget child;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            child = const LinearProgressIndicator();

            break;
          case ConnectionState.done:
            final result = snapshot.data!;

            if (result.isError) {
              child = const Text('Beim Laden ist ein Fehler aufgetreten');
            } else {
              child = buildValueChild(context, result.asValue!.value);
            }
            break;
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                ...previousChildren,
                if (currentChild != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: currentChild,
                  ),
              ],
            );
          },
          child: child,
        );
      },
    );
  }
}
