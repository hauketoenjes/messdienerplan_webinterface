import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/plan_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/type_repository.dart';

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

  ///
  /// TODO Das sollte im Server passieren und nicht auf dem Client
  ///
  Future<void> autoAssignMassTypes() async {
    assignError('');

    try {
      var planRepository = Get.find<PlanRepository>();
      await planRepository.getDataList(forceUpdate: true);

      var massRepository = planRepository.masses[planId];

      var typeRepository = Get.find<TypeRepository>();

      List<Type> types;
      List<Mass> masses;

      types = await typeRepository.getDataList(forceUpdate: true);
      masses = await massRepository.getDataList(forceUpdate: true);

      massLoop:
      for (var m in masses) {
        for (var t in types) {
          for (var r in t.rules) {
            if (m.time.toLocal().hour == r.time.hour &&
                m.time.toLocal().minute == r.time.minute &&
                m.time.toLocal().weekday == dayOfWeekToInt(r.dayOfWeek) &&
                m.location == r.location) {
              m.type = t.id;
              massRepository.alter(m);
              continue massLoop;
            }
          }
        }
        if (m.type != null) {
          m.type = null;
          massRepository.alter(m);
        }
      }

      await massRepository.update();
    } catch (e) {
      assignError('Die Messetypen konnten nicht automatisch zugeordnet werden');
      return;
    }

    currentStep++;
  }

  int dayOfWeekToInt(DayOfWeek dayOfWeek) {
    switch (dayOfWeek) {
      case DayOfWeek.mon:
        return 1;
        break;
      case DayOfWeek.tue:
        return 2;
        break;
      case DayOfWeek.wed:
        return 3;
        break;
      case DayOfWeek.thu:
        return 4;
        break;
      case DayOfWeek.fri:
        return 5;
        break;
      case DayOfWeek.sat:
        return 6;
        break;
      case DayOfWeek.sun:
        return 7;
        break;
    }

    return 0;
  }
}
