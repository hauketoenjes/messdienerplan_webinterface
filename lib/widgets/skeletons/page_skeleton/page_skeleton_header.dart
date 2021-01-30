import 'package:flutter/material.dart';

import 'page_action_button.dart';

///
/// Der obere Teil des PageSkeleton. Hier wird der Titel der Seite, eine Beschreibung
/// und eine Liste von Knöpfen angezeigt.
///
/// Der [title] und die [description] sollten nicht zu lang sein.
///
/// Die [actionButtons] werden wenn sie nicht mehr nebeneinander passen untereinander
/// "gewraped". Ist der Text in einem [PageActionButton] zu lang, kann es sein,
/// dass es zu Fehlern kommt. In Production wird der Text dann einfach abgeschnitten.
///
/// Sind die [actionButtons] nicht angegeben, dann wird an der Stelle nichts angezeigt.
///
/// [loading] zeigt einen Ladebalken hinter dem Title an. Der Ladebalken verschwindget
/// langsam, wenn der Status geändert wird, um falckern bei sehr kurzen Ladezeit zu
/// verhindern. So sieht der Nutzer immer, was passiert.
///
/// Das Text Widget mit dem Titel benötigt eine größe, damit der Text in zwei Zeilen
/// rutscht auf kleineren Geräten. Dazu ist der Wrap aber nicht optimal, da der
/// Ladeinidkator dann auf eine nicht schöne Position rutsch und eine Lücke erzeugt.
/// Vielleicht ist es sinnvoll einen Ladebalken mobil zu nutzen.
///
class PageSkeletonHeader extends StatelessWidget {
  final String title;
  final String description;
  final List<PageActionButton> actionButtons;
  final bool loading;
  final bool showSearch;
  final void Function(String searchQuery) onSearch;
  final bool showFilter;
  final String initialSearchValue;

  const PageSkeletonHeader({
    Key key,
    @required this.title,
    @required this.description,
    this.showSearch = false,
    this.onSearch,
    this.showFilter = false,
    this.actionButtons = const [],
    this.loading = false,
    this.initialSearchValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: loading ? 0 : 1200),
                  opacity: loading ? 1.0 : 0.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                  ),
                ),
                constraints: BoxConstraints(
                  maxHeight: 20,
                  maxWidth: 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 32,
        ),
        if (actionButtons.isNotEmpty)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: actionButtons,
          ),
        if (showSearch) ...[
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 350),
                child: TextFormField(
                  initialValue: initialSearchValue,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    hintText: 'Suche',
                  ),
                  onChanged: onSearch,
                ),
              )
            ],
          ),
        ],
        if (actionButtons.isNotEmpty)
          SizedBox(
            height: 32,
          ),
      ],
    );
  }
}
