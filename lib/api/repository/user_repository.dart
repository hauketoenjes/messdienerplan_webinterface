import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';

///
/// TODO Was passiert beim logout?
///
class UserRepository extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var dataLoaded = false.obs;

  Future<void> initializeData() async {
    var client = await Get.find<MessdienerApiClient>();
    var user = await client.getUser();

    username(user.username);
    email(user.email);
    firstName(user.first_name);
    lastName(user.last_name);
    dataLoaded(true);
  }
}
