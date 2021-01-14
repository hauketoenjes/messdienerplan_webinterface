import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Die obere Bar, welche ein Profilbild und den Button zum Drawer öffnen anzeigt.
/// Beim Klick auf das Profilbild das NotificationCenter geöffnet.
///
/// [showDrawerButton] sollte nur angezeigt werden, wenn der Drawer ausgeklappt werden
/// kann und nicht, wenn er statisch an der Linken Seite ist und nicht bewegt
/// werden kann.
///
/// Wenn es neue Ereigniss im Notification Center gibt, dann wird eine [Badge]
/// (Punkt neben dem Profilbild) angzeigt um den Nutzer auf eine neue Meldung
/// hinzuweisen.
///
class HeaderBar extends StatelessWidget {
  final bool showDrawerButton;

  HeaderBar({Key key, this.showDrawerButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showBackButton = Navigator.of(context).canPop();

    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDrawerButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.notes_outlined),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
            if (showBackButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            if (showDrawerButton || showBackButton)
              Expanded(
                child: Container(),
              ),
            PopupMenuButton<int>(
              offset: Offset(0, 40),
              onSelected: (value) async {
                switch (value) {
                  case 0:
                    try {
                      var client = Get.find<MessdienerApiClient>();
                      await client.logoutUser();

                      var sharedPrefs = await SharedPreferences.getInstance();
                      await sharedPrefs.clear();
                      Get.find<Dio>().options.headers.clear();

                      await Get.offAllNamed(AppRoutes.LOGIN);
                    } catch (e) {
                      return;
                    }
                    break;
                  default:
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Ausloggen'),
                    value: 0,
                  ),
                ];
              },
              child: Container(
                width: 56,
                height: 56,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  child: Text(
                    'U',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
