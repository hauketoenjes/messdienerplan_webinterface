import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';

class ChangePasswordDialogController extends GetxController {
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var newPasswordConfirm = ''.obs;

  var error = ''.obs;
  var loading = false.obs;

  Future<void> changePassword() async {
    loading(true);
    error('');
    var client = Get.find<MessdienerApiClient>();

    try {
      await client.changePassword(
        PasswordChangeModel(
          old_password: oldPassword(),
          new_password1: newPassword(),
          new_password2: newPasswordConfirm(),
        ),
      );
      Get.back();
    } catch (e) {
      error(
          'Fehler beim setzen des Passworts. Überprüfe nochmal die Eingaben, ist das alte Passwort korrekt?');
    }
    loading(false);
  }
}
