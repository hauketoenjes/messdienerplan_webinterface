import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

///
/// Eine Fade-In-Animation die [duration] lang läuft.
///
/// Wenn [duration] nicht angegeben ist, dann dauert die Animation 150ms.
///
class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInAnimation({
    Key key,
    @required this.child,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      child: child,
      duration: duration ?? Duration(milliseconds: 150),
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      builder: (context, child, value) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}
