import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messdienerplan_webinterface/widgets/animations/fade_in_animation.dart';

import 'page_action_button.dart';
import 'page_skeleton_header.dart';

///
/// Ein Rohbau für eine Seite mit Titel, Beschreibung und Buttons darunter.
/// Sollte benutzt werden, wenn eine Liste von Item's auf der Seite angezeigt wird.
///
/// Es gibt drei Möglichkeiten ein child-Widget anzuzeigen (Nur ein Wert darf gesetzt
/// werden):
///
/// Ein [child] ist Scrollbar, wird allerdings direkt voll gerendert (Sollte aus
/// perfomance Gründen bei Listen nicht verwendet werden)
///
/// Ein [sliverChild] ist scrollbar und muss ein Sliver sein. Denkbar ist hier
/// eine Liste, welche erst nach und nach gebaut wird.
///
/// Die [sliverChildren] sind alle ebenfalls scrollbar und werden untereinander
/// verwendet, wenn mehrere Listen untereinander gebraucht werden. Hier können
/// auch z.B. [SliverToBoxAdapter] eingebaut werden.
///
/// Wenn [hasData] false ist, dann wird eine Illustration und eine Information
/// angezeigt, das keine Daten vorhanden sind. Hier sollte auch überprüft werden,
/// ob es sicher ist, das Widget zu bauen, was die Daten anzeigt. Wenn die Daten
/// [null] sind und [hasData] true ist, dann wird das [child] Widget nämlich
/// gebaut und es könnte auf null zugegriffen werden, was zu Fehlern führt.
///
/// Wenn [hasError] true ist, dann wird eine Illustration und eine Information
/// angezeigt, das ein Fehler aufgetreten ist. [errorText] wird angezeigt, wenn
/// er nicht leer ist.
///
/// [hasError] > [hasData]. Es wird immer der Error angezeigt, auch wenn keine Daten
/// vorhanden sind.
///
/// Wenn Daten geladen werden, sollte [loading] auf true gesetzt werden.
///
/// TODO Hier ist der einbau einer Such/Filter Funktion sinnvoll:
///
/// Dazu müssen vom Benutzer des PageSkeleton sinnvolle Filteroptionen (abstrakte Klasse
/// mit Vorgabe von Name, Datum etc.) gegeben werden. Wenn nach einem Punkt gefiltert
/// wird, dann wird ein Callback ausgelöst, welches die Möglichkeit gibt, die Daten
/// neu zu sortieren.
///
/// Außerdem ist ein Suchfeld sinnvoll, welches ebenfalls ein Callback auslöst, welches
/// dann die Daten neu sortiert.
///
/// Wenn keine Filteroptionen und kein Such-Callback angegeben sind, dann werden die
/// Felder auch nicht angezeigt.
///
/// Es soll die Möglichkeit geben einen Standardfilter beim Konstruktor anzugeben.
///
///
class PageSkeleton extends StatelessWidget {
  final String title;
  final String description;
  final List<PageActionButton> actionButtons;
  final Widget sliverChild;
  final List<Widget> sliverChildren;
  final Widget child;
  final bool hasData;
  final String noDataText;
  final String error;
  final String formError;
  final bool loading;
  final bool showSearch;
  final void Function(String searchQuery) onSearch;
  final bool showFilter;
  final String initialSearchValue;

  final _scrollController = ScrollController();

  PageSkeleton({
    Key key,
    @required this.title,
    @required this.description,
    this.hasData = true,
    this.noDataText = '',
    this.error = '',
    this.loading = false,
    this.actionButtons = const [],
    this.sliverChild,
    this.sliverChildren,
    this.child,
    this.formError = '',
    this.showSearch = false,
    this.onSearch,
    this.showFilter = false,
    this.initialSearchValue,
  })  : assert(
          (sliverChild != null && child == null && sliverChildren == null) ||
              (child != null &&
                  sliverChild == null &&
                  sliverChildren == null) ||
              (sliverChildren != null && child == null && sliverChild == null),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var slivers = <Widget>[
      SliverToBoxAdapter(
        child: PageSkeletonHeader(
          description: description,
          title: title,
          actionButtons: actionButtons,
          loading: loading,
          showSearch: showSearch,
          showFilter: showFilter,
          onSearch: onSearch,
          initialSearchValue: initialSearchValue,
        ),
      ),
    ];

    // Wenn ein FormError existiert (Beim Speichern einer Form z.B. ein API Error)
    // dann zeige eine Error Bar oben untern den Action Buttons

    if (formError.isNotEmpty) {
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).errorColor.withOpacity(0.2),
                border: Border.all(color: Theme.of(context).errorColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                formError,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    }
    // Je nachdem, ob gerade Daten oder ein Fehler vorliegt oder geladen wird,
    // müssen verschiedene Zustände abgebildet werden:
    //
    // Das verhindert, dass auf Daten zugegriffen wird, die nicht existieren,
    // was zu null Fehlern führen kann.
    //
    // if(hasError) -> Fehlermeldung
    // else if(!hasData && !loading) -> Keine Daten
    // else -> Daten anzeigen
    //
    //

    if (error.isNotEmpty) {
      slivers.add(
        SliverToBoxAdapter(
          child: FadeInAnimation(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: SvgPicture.network(
                      'assets/undraw_server_down.svg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      'Fehler beim Laden der Daten',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      error,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).errorColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (!hasData && !loading) {
      slivers.add(
        SliverToBoxAdapter(
          child: FadeInAnimation(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: SvgPicture.network(
                      'assets/undraw_empty.svg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      noDataText.isEmpty ? 'Keine Daten vorhanden' : noDataText,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      if (sliverChild != null) {
        slivers.add(sliverChild);
      }

      if (child != null) {
        slivers.add(
          SliverToBoxAdapter(
            child: child,
          ),
        );
      }

      if (sliverChildren != null) {
        slivers.addAll(sliverChildren);
      }
    }

    return Expanded(
      // Show Scrollbar on the edge of screen, not on the edge of Scrollview
      child: Scrollbar(
        controller: _scrollController,
        thickness: 8,
        radius: Radius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: slivers,
            ),
          ),
        ),
      ),
    );
  }
}
