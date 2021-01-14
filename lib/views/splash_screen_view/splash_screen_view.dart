import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  _SplashScreenViewState() {
    isLoggedIn();
  }

  Future<void> isLoggedIn() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('token') &&
        sharedPreferences.getString('token') != null) {
      await Navigator.of(context).pushReplacementNamed(AppRoutes.LOCATIONS);
    } else {
      await Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
