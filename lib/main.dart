import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/messdienerplan_api.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/misc/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:vrouter/vrouter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(
    VRouter(
      title: 'Messdienerplan',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('de'),
      ],
      locale: const Locale('de'),
      routes: routes,
      buildTransition: (animation1, _, child) {
        return FadeTransition(
          opacity: animation1,
          child: child,
        );
      },
    ),
  );
}

Future<void> initialize() async {
  const host = 'localhost';
  const port = 8000;

  final baseUri = Uri(
    scheme: 'http',
    host: host,
    port: port,
    path: '/api/v1',
  );

  final dio = Dio(BaseOptions(baseUrl: baseUri.toString()));
  final client = MessdienerplanApiClient(dio);

  KiwiContainer().registerSingleton((container) => client);
  KiwiContainer().registerSingleton((container) => LocationRepository());
}
