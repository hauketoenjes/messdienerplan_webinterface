import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/misc/enums/hero_tags.dart';
import 'package:messdienerplan_webinterface/routes/app_pages.dart';
import 'package:messdienerplan_webinterface/views/login_view/login_view_model.dart';

class LoginView extends StatelessWidget {
  final model = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: min(350, MediaQuery.of(context).size.width) - 32,
            child: AutofillGroup(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: HeroTags.PROJECT_TITLE,
                      child: Text(
                        'Messdienerplan',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 40),
                      ),
                    ),
                    if (model.loginFailed()) ...[
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor.withOpacity(0.2),
                          border:
                              Border.all(color: Theme.of(context).errorColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Benutzername oder Passwort falsch',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofocus: true,
                      autofillHints: [
                        AutofillHints.username,
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Benutzername',
                      ),
                      onChanged: (username) => model.username(username),
                      onFieldSubmitted: (value) async {
                        if (await model.loginUser()) {
                          await Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.PLANS);
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofillHints: [
                        AutofillHints.password,
                      ],
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'Passwort',
                      ),
                      onChanged: (password) => model.password(password),
                      onFieldSubmitted: (value) async {
                        if (await model.loginUser()) {
                          await Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.PLANS);
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        if (await model.loginUser()) {
                          await Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.LOCATIONS);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
