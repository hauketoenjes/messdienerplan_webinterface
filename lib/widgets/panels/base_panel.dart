import 'package:flutter/material.dart';

///
/// Methode um ein Panel anzuzeigen.
/// Das Panel wird als Dialog angezeigt und von der rechten Seite ins Bild
/// animiert.
///
Future<T?> showPanel<T extends Object?>({
  required BuildContext context,
  required Widget panel,
}) {
  return showGeneralDialog<T>(
    context: context,
    pageBuilder: (context, _, __) {
      return panel;
    },
    barrierDismissible: true,
    barrierLabel: '',
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
    transitionDuration: const Duration(milliseconds: 200),
  );
}

///
/// Base Panel für die Nutzung mit [showPanel]. Zeigt ein Panel auf der rechten
/// Bildschirmseite mit [description], [title] und [children] an.
///
/// [loading] kann auf `true` gesetzt werden, wodurch der Text als "Skeleton" mit
/// einer loading Animation angezeigt wird.
///
/// [title] und [description] dürfen in dem Fall `null` sein, da der String dann durch
/// einen leeren String ersetzt und nicht angezeigt wird.
///
class BasePanel extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onBack;
  final List<Widget> children;

  const BasePanel({
    Key? key,
    required this.title,
    required this.description,
    this.children = const [],
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(width: 500),
        child: Material(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (onBack != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_rounded),
                                onPressed: onBack,
                              ),
                            ),
                          Expanded(
                            child: Text(
                              title,
                              style: textTheme.headline5!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (onBack == null)
                            IconButton(
                              icon: const Icon(Icons.close_rounded),
                              tooltip: 'Schließen',
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0, top: 8.0),
                        child: Text(
                          description,
                          style: textTheme.subtitle2!
                              .copyWith(color: theme.hintColor),
                        ),
                      ),
                    ],
                  ),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
