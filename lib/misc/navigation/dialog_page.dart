import 'package:flutter/material.dart';

///
/// Page um eine [RawDialogRoute] auf den Navigation Stack zu pushen.
///
/// Der Dialog wird von der rechten Seite in das Bild animiert und ist dismissable.
///
class DialogPage<T> extends Page<T> {
  final Widget child;

  const DialogPage({
    required LocalKey key,
    String? name,
    required this.child,
  }) : super(key: key, name: name);

  @override
  Route<T> createRoute(BuildContext context) {
    return RawDialogRoute<T>(
      pageBuilder: (context, _, __) => child,
      transitionBuilder: (context, animation, _, child) {
        const begin = Offset(1.0, 0.0);
        final end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      settings: this,
    );
  }
}
