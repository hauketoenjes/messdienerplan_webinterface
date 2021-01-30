import 'package:flutter/material.dart';

class CustomStep {
  final String title;
  final String subtitle;
  final String completedSubtitle;
  final bool error;
  final int id;
  final int currentId;
  final Widget content;
  final Widget errorContent;

  const CustomStep({
    @required this.title,
    @required this.subtitle,
    @required this.content,
    @required this.id,
    @required this.currentId,
    this.completedSubtitle,
    this.errorContent,
    this.error = false,
  });

  Step getStep() {
    return Step(
      title: Text(title),
      subtitle: Text(currentId > id ? completedSubtitle : subtitle),
      content: error ? errorContent : content,
      state: error
          ? StepState.error
          : currentId > id
              ? StepState.complete
              : StepState.indexed,
      isActive: currentId == id,
    );
  }
}
