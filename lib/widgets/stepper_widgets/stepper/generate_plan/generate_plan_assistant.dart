import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/widgets/stepper_widgets/custom_step.dart';
import 'package:messdienerplan_webinterface/widgets/stepper_widgets/stepper/generate_plan/generate_plan_assistant_controller.dart';

class GeneratePlanAssistant extends StatelessWidget {
  final int planId;

  const GeneratePlanAssistant({
    Key key,
    @required this.planId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<GeneratePlanAssistantController>(
      init: GeneratePlanAssistantController(planId),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async => !(controller.currentStep() == 2),
          child: AlertDialog(
            title: Text('Plan Assistent'),
            actions: [
              TextButton(
                onPressed: () => !(controller.currentStep() == 2)
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
                    currentStep: controller.currentStep(),
                    onStepContinue: controller.currentStep() == 2
                        ? null
                        : () => controller.nextStep(),
                    onStepCancel: controller.currentStep() == 2 ||
                            controller.currentStep() == 0
                        ? null
                        : () => controller.currentStep--,
                    steps: [
                      CustomStep(
                        id: 0,
                        title: 'Bestehender Plan wird gelöscht',
                        content: Text(
                          'Alle bestehenden Einteilungen im Messedienerplan werden gelöscht und können nicht wiederhergestellt werden.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        currentId: controller.currentStep(),
                      ).getStep(),
                      CustomStep(
                        id: 1,
                        title: 'Messen ohne Typ löschen?',
                        subtitle: 'Sollen die Messen ohne Typ gelöscht werden?',
                        content: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onChanged: (bool value) =>
                              controller.deleteMassesWithoutType(value),
                          value: controller.deleteMassesWithoutType(),
                          title: Text('Messen ohne Typ löschen'),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        currentId: controller.currentStep(),
                      ).getStep(),
                      CustomStep(
                        id: 2,
                        title: 'Plan wird generiert',
                        subtitle:
                            'Die Messdiener:innen werden zufällig den Messen zugeordnet.',
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                        errorContent: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.generateError(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => controller.generatePlan(),
                              child: Text('Neu versuchen'),
                            )
                          ],
                        ),
                        error: controller.generateError().isNotEmpty,
                        currentId: controller.currentStep(),
                      ).getStep(),
                      CustomStep(
                        id: 3,
                        currentId: controller.currentStep(),
                        title: 'Fertig',
                        subtitle: 'Der Messdienerplan wurde generiert.',
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
