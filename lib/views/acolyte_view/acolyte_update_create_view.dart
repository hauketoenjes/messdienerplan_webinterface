import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/acolyte_repository.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/misc/extensions/date_format_extensions.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/update_create_view/update_create_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';

class AcolyteUpdateCreateView extends StatelessWidget {
  final acolyteRepository = KiwiContainer().resolve<AcolyteRepository>();
  final groupRepository = KiwiContainer().resolve<GroupRepository>();

  @override
  Widget build(BuildContext context) {
    return UpdateCreateView<Acolyte, int>(
      title: 'Messdiener:in',
      description: 'Messdiener:in bearbeiten oder erstellen',
      createItem: () => Acolyte(
        firstName: '',
        lastName: '',
        birthday: DateTime.now(),
      ),
      createRepository: acolyteRepository,
      updateRepository: acolyteRepository,
      readRepository: acolyteRepository,
      optionalReadAllRepositories: (register) {
        register<Group>(groupRepository);
      },
      pathParameterName: 'acolyteId',
      castString: (v) => int.tryParse(v),
      formFields: (item, resolve) => [
        BaseFormField(
          title: 'Vorname',
          isRequired: true,
          child: FormBuilderTextField(
            name: 'firstName',
            initialValue: item.firstName,
            onChanged: (value) => item.firstName = value ?? '',
            validator: FormBuilderValidators.required(context),
          ),
        ),
        BaseFormField(
          title: 'Nachname',
          isRequired: true,
          child: FormBuilderTextField(
            name: 'lastName',
            initialValue: item.lastName,
            onChanged: (value) => item.lastName = value ?? '',
            validator: FormBuilderValidators.required(context),
          ),
        ),
        BaseFormField(
          title: 'Extrainformation',
          description:
              'Extrainformationen können hilfreich sein, wenn zwei Messdiener:innen den gleichen Namen haben.',
          child: FormBuilderTextField(
            name: 'extra',
            initialValue: item.extra,
            onChanged: (value) => item.extra = value ?? '',
          ),
        ),
        BaseFormField(
          title: 'Geburtstag',
          isRequired: true,
          child: FormBuilderDateTimePicker(
            name: 'birthday',
            inputType: InputType.date,
            format: DateFormats.yyyyMMdd(),
            initialValue: item.birthday,
            onChanged: (value) {
              if (value != null) {
                item.birthday = value;
              }
            },
            validator: FormBuilderValidators.required(context),
          ),
        ),
        BaseFormField(
          title: 'Status',
          description:
              'Messdiener:innen, die nicht aktiv sind, werden in keinen neuen Plänen eingeteilt.',
          isRequired: true,
          child: FormBuilderSwitch(
            name: 'status',
            initialValue: !item.inactive,
            onChanged: (value) {
              if (value != null) {
                item.inactive = !value;
              }
            },
            title: const Text('Aktiv'),
          ),
        ),
        BaseFormField(
          title: 'Gruppe',
          child: FormBuilderDropdown<int>(
            name: 'group',
            allowClear: true,
            initialValue: item.group,
            onChanged: (value) => item.group = value,
            items: [
              const DropdownMenuItem<int>(
                child: Text('Keine Gruppe'),
              ),
              ...resolve<Group>()
                  .map(
                    (e) => DropdownMenuItem<int>(
                      value: e.id,
                      child: Text(e.groupName),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
