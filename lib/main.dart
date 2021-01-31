import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';
import 'package:messdienerplan_webinterface/misc/app_theme.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/repository/acolyte_repository.dart';
import 'api/repository/user_repository.dart';

Future<void> setupLocator() async {
  var dioClient = dio.Dio();

  dioClient.interceptors.add(
    dio.InterceptorsWrapper(
      onRequest: (dio.RequestOptions options) async {
        if (options.headers.containsKey('authorization')) return options;
        if (options.path.contains('login')) return options;

        var sharedPreferences = await SharedPreferences.getInstance();
        if (sharedPreferences.containsKey('token') &&
            sharedPreferences.getString('token') != null) {
          dioClient.options.headers['Authorization'] =
              'Token ' + sharedPreferences.getString('token');
          options.headers['Authorization'] =
              'Token ' + sharedPreferences.getString('token');
        }

        return options;
      },
      onResponse: (dio.Response response) async {
        return response;
      },
      onError: (dio.DioError dioError) async {
        /*if (e.type == DioErrorType.RESPONSE &&
            e.toString().contains('XMLHttpRequest')) {
          dio.options.headers.clear();
          Get.find<NavigationService>().navigateToReplacement(loginRoute);
        }*/

        // Navigate to splash screen if the user is not authenticated or the method is forbidden
        if (dioError.response != null &&
            !dioError.request.path.contains('login') &&
            (dioError.response.statusCode == 401 ||
                dioError.response.statusCode == 403)) {
          dioClient.options.headers.clear();

          await (await SharedPreferences.getInstance()).clear();

          await Get.offAllNamed(AppRoutes.SPLASH_SCREEN);
        }
        return dioError;
      },
    ),
  );

  // Die Config vom Webserver laden. Die Config wird beim starten des Webservers per
  // bash Skript angelegt um per Environment Variable die Backend URL setzen zu
  // können.
  var result = await http.get('/config.json');
  var config = await jsonDecode(result.body);

  var baseUrl = config['baseUrl'];

  dioClient.options.baseUrl = baseUrl;

  Get.put<dio.Dio>(dioClient, permanent: true);
  Get.put<MessdienerApiClient>(MessdienerApiClient(dioClient), permanent: true);

  Get.put<AcolyteRepository>(AcolyteRepository(), permanent: true);
  Get.put<GroupRepository>(GroupRepository(), permanent: true);
  Get.put<RoleRepository>(RoleRepository(), permanent: true);
  Get.put<TypeRepository>(TypeRepository(), permanent: true);
  Get.put<LocationRepository>(LocationRepository(), permanent: true);
  Get.put<PlanRepository>(PlanRepository(), permanent: true);

  Get.put<UserRepository>(UserRepository(), permanent: true);
}

Future<void> main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'de_DE';

    return GetMaterialApp(
      title: 'Messdienerplan',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      themeMode: kDebugMode ? ThemeMode.dark : ThemeMode.system,
      darkTheme: AppTheme.getTheme(Brightness.dark),
      theme: AppTheme.getTheme(Brightness.light),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('de')],
      locale: const Locale('de'),
      debugShowCheckedModeBanner: false,
    );
  }
}
