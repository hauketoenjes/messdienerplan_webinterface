import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MPlanError {
  final String title;
  final String description;
  final int code;
  final Color color;

  MPlanError({
    @required this.title,
    @required this.description,
    this.code,
  }) : color = getColorFromCode(code);

  static Color getColorFromCode(int code) {
    if (code == null) return Colors.red;

    switch (getMostSignificantDigit(code)) {
      case 4:
        return Colors.orange;
      case 5:
      default:
        return Colors.red;
    }
  }

  static int getMostSignificantDigit(int x) {
    while (x >= 10) {
      x = x ~/ 10;
    }
    return x;
  }

  factory MPlanError.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return MPlanError(
            title: 'Verbindungstimeout',
            description: 'Die Verbindung wurde unerwartet unterbrochen.');
        break;
      case DioErrorType.SEND_TIMEOUT:
        return MPlanError(
            title: 'Verbindungstimeout',
            description:
                'Die Verbindung wurde unerwartet beim Senden unterbrochen.');
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return MPlanError(
            title: 'Verbindungstimeout',
            description:
                'Die Verbindung wurde unerwartet beim Empfangen unterbrochen.');
        break;
      case DioErrorType.RESPONSE:
        if (dioError.response == null) {
          return MPlanError(
              title: 'Server nicht erreichbar',
              description: 'Der Server ist nicht erreichbar. Bist du online?');
        }
        switch (dioError.response.statusCode) {
          case 400:
            return MPlanError(
                title: 'Ungültige Anfrage',
                description:
                    'Die Anfrage an der Server war ungültig, überprüfe noch einmal die Eingaben.',
                code: dioError.response.statusCode);
            break;
          case 401:
          case 403:
            return MPlanError(
                title: 'Unautorisiert',
                description:
                    'Die Anfrage an den Server konnte nicht autorisiert werden oder ist verboten.',
                code: dioError.response.statusCode);
            break;
          case 404:
            return MPlanError(
                title: 'Nicht gefunden',
                description:
                    'Die angeforderte Ressource kann auf dem Server nicht gefunden werden.',
                code: dioError.response.statusCode);
            break;
          case 405:
            return MPlanError(
                title: 'Methode nicht erlaubt',
                description: 'Die angeforderte Methode ist nicht erlaubt.',
                code: dioError.response.statusCode);
            break;
          case 409:
            return MPlanError(
                title: 'Konflikt',
                description:
                    'Es ist ein Konflikt aufgreteten. Existiert schon eine Ressource mit den Angaben?',
                code: dioError.response.statusCode);
            break;
          case 500:
            return MPlanError(
                title: 'Internet Server Fehler',
                description:
                    'Es ist ein interner Server Fehler aufgetreten. Wende dich an einen Administrator.',
                code: dioError.response.statusCode);
            break;
          case 501:
            return MPlanError(
                title: 'Nicht implementiert',
                description:
                    'Die angeforderte Methode ist nicht implementiert.',
                code: dioError.response.statusCode);
            break;
          case 502:
            return MPlanError(
                title: 'Schlechtes Portal',
                description:
                    'Der Server kann die Anfrage nicht ausführen, da der Server nicht erreichbar ist.',
                code: dioError.response.statusCode);
            break;
          default:
            return MPlanError(
                title: 'Unbekannter Fehlercode',
                description: 'Es wurde ein unbekannter Fehlercode empfangen.',
                code: dioError.response.statusCode);
            break;
        }
        break;
      case DioErrorType.CANCEL:
        return MPlanError(
            title: 'Verbindungsabbruch',
            description: 'Die Verbindung wurde abgebrochen.');
        break;
      case DioErrorType.DEFAULT:
      default:
        var description;
        if (dioError.error != null) {
          description = dioError.error.toString();
        } else {
          description = 'Es ist ein unbekannter Fehler aufgetreten.';
        }

        return MPlanError(
            title: 'Unbekannter Fehler', description: description);
        break;
    }
  }
}
