import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/messdienerplan_api.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/misc/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messdienerplan_webinterface/misc/navigation/app_routes.dart';
import 'package:vrouter/vrouter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'de';

  await initialize();

  runApp(
    VRouter(
      title: 'Messdienerplan',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        FormBuilderLocalizations.delegate,
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
  KiwiContainer().registerSingleton((container) => AcolyteRepository());
  KiwiContainer().registerSingleton((container) => GroupRepository());
  KiwiContainer().registerSingleton((container) => RoleRepository());
}
