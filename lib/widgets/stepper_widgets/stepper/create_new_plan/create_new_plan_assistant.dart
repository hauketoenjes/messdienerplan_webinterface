import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../custom_step.dart';
import '../../select_date_step.dart';
import 'create_new_plan_assistant_controller.dart';

class CreateNewPlanAssistant extends StatelessWidget {
  final dateFormat = DateFormat('dd.MM.yyyy');

  @override
  Widget build(BuildContext context) {
    return GetX<CreateNewPlanAssistantController>(
      init: CreateNewPlanAssistantController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async =>
              controller.currentStep() == 0 ||
              controller.currentStep() == 3 ||
              (controller.currentStep() == 1 &&
                  controller.importError().isNotEmpty) ||
              (controller.currentStep() == 2 &&
                  controller.assignError().isNotEmpty),
          child: AlertDialog(
            title: Text('Plan Assistent'),
            actions: [
              TextButton(
                onPressed: () => controller.currentStep() == 0 ||
                        controller.currentStep() == 3 ||
                        (controller.currentStep() == 1 &&
                            controller.importError().isNotEmpty) ||
                        (controller.currentStep() == 2 &&
                            controller.assignError().isNotEmpty)
                    ? Navigator.of(context).pop()
                    : null,
                child: Text('Schließen'),
              )
            ],
            scrollable: false,
            content: Container(
              width: min(MediaQuery.of(context).size.width, 500),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Dieser Assistent hilft dabei einen neuen Plan mit Messen zu erstellen und importieren.',
                    ),
                  ),
                  Stepper(
                    controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) {
                      return Row(
                        children: <Widget>[
                          if (controller.currentStep() != 3)
                            ElevatedButton(
                              onPressed: onStepContinue,
                              child: Text('Weiter'),
                            ),
                        ],
                      );
                    },
                    currentStep: controller.currentStep(),
                    onStepContinue: controller.currentStep() == 0 &&
                            controller.dateTimeRange() != null
                        ? controller.onStepContinue
                        : null,
                    steps: [
                      CustomStep(
                        id: 0,
                        currentId: controller.currentStep(),
                        title: 'Daten des neuen Plans',
                        subtitle: 'Datumsbereich für den neuen Plan auswählen',
                        completedSubtitle: controller.dateTimeRange() != null
                            ? '${dateFormat.format(controller.dateTimeRange().start)} - ${dateFormat.format(controller.dateTimeRange().end)}'
                            : '',
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectDateStep(
                            onChanged: (value) =>
                                controller.dateTimeRange(value),
                          ),
                        ),
                      ).getStep(),
                      CustomStep(
                        id: 1,
                        currentId: controller.currentStep(),
                        title: 'Messen importieren',
                        subtitle:
                            'Die Messen werden von KaPlan heruntergeladen und importiert',
                        completedSubtitle:
                            'Messen wurden heruntergeladen und importiert',
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                        errorContent: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.importError(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => controller.importNewPlan(),
                              child: Text('Neu versuchen'),
                            )
                          ],
                        ),
                        error: controller.importError().isNotEmpty,
                      ).getStep(),
                      CustomStep(
                        id: 2,
                        currentId: controller.currentStep(),
                        title: 'Messetypen automatisch zuordnen',
                        subtitle:
                            'Die Messetypen werden anhand der Regeln automatisch zugeordnet.',
                        completedSubtitle: 'Messetypen wurden zugeordnet',
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                        errorContent: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.assignError(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => controller.autoAssignMassTypes(),
                              child: Text('Neu versuchen'),
                            )
                          ],
                        ),
                        error: controller.assignError().isNotEmpty,
                      ).getStep(),
                      CustomStep(
                        id: 3,
                        currentId: controller.currentStep(),
                        title: 'Fertig',
                        subtitle:
                            'Es wurde ein neuer Plan erstellt und die Messetypen wurden zugeordnet',
                        content: Container(),
                      ).getStep(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
