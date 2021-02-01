import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';

class CreateNewPlanAssistantController extends GetxController {
  var currentStep = 0.obs;
  var dateTimeRange = Rx<DateTimeRange>();
  var importError = ''.obs;
  var assignError = ''.obs;

  int planId;

  Future<void> onStepContinue() async {
    switch (currentStep()) {
      case 0:
        if (dateTimeRange() != null) {
          currentStep++;
          await importNewPlan();
        }
        break;
      default:
        break;
    }
  }

  Future<void> importNewPlan() async {
    importError('');
    var client = Get.find<MessdienerApiClient>();

    try {
      var plan = await client.createImportPlan(
        Plan(
          dateFrom: dateTimeRange().start,
          dateTo: dateTimeRange().end,
        ),
      );
      planId = plan.id;
    } catch (e) {
      importError('Es ist ein Fehler beim Importieren der Messen aufgetreten');
      return;
    }

    currentStep++;
    await autoAssignMassTypes();
  }

  Future<void> autoAssignMassTypes() async {
    assignError('');
    var client = Get.find<MessdienerApiClient>();

    try {
      await client.assignMassTypes(planId);
    } catch (e) {
      assignError('Die Messetypen konnten nicht automatisch zugeordnet werden');
      return;
    }

    currentStep++;
  }
}
