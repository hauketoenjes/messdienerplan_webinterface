import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/custom_text_form_field.dart';

import 'change_password_dialog_controller.dart';

class ChangePasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ChangePasswordDialogController>(
      init: ChangePasswordDialogController(),
      builder: (controller) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Abbrechen'),
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.changePassword();
              },
              child: Text('Ändern'),
            ),
          ],
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Illustration und Titel anzeigen
              Container(
                constraints: BoxConstraints(maxHeight: 200, maxWidth: 400),
                child: SvgPicture.network('assets/undraw_authentication.svg'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Passwort ändern',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
            ],
          ),
          scrollable: true,
          content: Container(
            width: min(MediaQuery.of(context).size.width, 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hier kann das Passwort geändert werden.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                CustomTextFormField(
                  title: 'Altes Passwort',
                  initialValue: controller.oldPassword(),
                  onChanged: (value) => controller.oldPassword(value),
                  obscureText: true,
                ),
                CustomTextFormField(
                  title: 'Neues Passwort',
                  initialValue: controller.newPassword(),
                  onChanged: (value) => controller.newPassword(value),
                  obscureText: true,
                ),
                CustomTextFormField(
                  title: 'Neues Passwort bestätigen',
                  initialValue: controller.newPasswordConfirm(),
                  onChanged: (value) => controller.newPasswordConfirm(value),
                  obscureText: true,
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: controller.loading() ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: controller.error.isNotEmpty ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.error(),
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
