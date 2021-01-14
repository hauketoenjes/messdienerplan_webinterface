import 'package:get/get.dart';

///
/// PageSkeletonViewController um Fehler und Ladebalken anzuzeigen
///
abstract class PageSkeletonViewController extends GetxController {
  ///
  /// Boolean, ob aktuell geladen wird
  ///
  var loading = true.obs;

  ///
  /// Error Message, falls ein Error vorliegt
  ///
  var error = ''.obs;

  ///
  /// Error Message, falls ein nicht so relevanter Fehler vorliegt
  /// (z.B. ein Fehler beim abschicken einer Form)
  ///
  var formError = ''.obs;
}
