import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';

class GeneratePlanAssistantController extends GetxController {
  final int planId;

  ///
  /// Der aktuelle Schritt im Stepper
  ///
  var currentStep = 0.obs;

  ///
  /// Fehlermeldung, wenn beim Import ein Fehler auftritt
  ///
  var generateError = ''.obs;

  ///
  /// Boolean, ob Messen ohne Typ gelöscht werden sollen oder nicht.
  ///
  var deleteMassesWithoutType = false.obs;

  GeneratePlanAssistantController(this.planId);

  void nextStep() {
    if ((++currentStep)() == 2) generatePlan();
  }

  void previousStep() {
    currentStep--;
  }

  Future<void> generatePlan() async {
    generateError('');
    var client = Get.find<MessdienerApiClient>();

    try {
      if (deleteMassesWithoutType()) {
        await client.deleteMassesWithoutType(planId);
      }

      await client.generatePlan(planId);
    } catch (e) {
      generateError('Es ist ein Fehler beim Generieren des Plans aufgetreten');
      return;
    }

    currentStep++;
  }
}
