import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/update_create_view/update_create_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/list_form_field.dart';

class GroupUpdateCreateView extends StatelessWidget {
  final groupRepository = KiwiContainer().resolve<GroupRepository>();

  @override
  Widget build(BuildContext context) {
    return UpdateCreateView<Group, int>(
      title: 'Gruppe',
      description: 'Eine Gruppe hinzufügen',
      createItem: () => Group(groupName: '', classifications: []),
      createRepository: groupRepository,
      updateRepository: groupRepository,
      readRepository: groupRepository,
      pathParameterName: 'groupId',
      castString: (v) => int.tryParse(v),
      formFields: (item, _) => [
        BaseFormField(
          title: 'Name',
          isRequired: true,
          child: FormBuilderTextField(
            name: 'name',
            onChanged: (value) => item.groupName = value ?? '',
            initialValue: item.groupName,
            validator: FormBuilderValidators.required(context),
          ),
        ),
        BaseFormField(
          title: 'Einteilungen',
          description:
              'Trage hier die Einteilungen in die verschiedenen Altersgruppen ein.',
          child: ListFormField<Classification>(
            initialList: item.classifications,
            onChanged: (classifications) {
              item.classifications = classifications;
            },
            itemCountText: (count) => count == 0
                ? 'Keine Einteilungen'
                : count == 1
                    ? '1 Einteilung'
                    : '$count Einteilungen',
            buildAddWidget: (add) {
              return _ClassificationForm(add: add);
            },
            buildItem: (classification, delete) {
              return ListTile(
                dense: true,
                title: Text(
                  '${classification.ageFrom} - ${classification.ageTo}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: delete,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ClassificationForm extends StatefulWidget {
  final void Function(Classification toAdd) add;

  const _ClassificationForm({
    Key? key,
    required this.add,
  }) : super(key: key);

  @override
  __ClassificationFormState createState() => __ClassificationFormState();
}

class __ClassificationFormState extends State<_ClassificationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? ageFrom;
  int? ageTo;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(isDense: true, hintText: 'von'),
            onChanged: (value) {
              ageFrom = int.tryParse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }

              final age = int.parse(value);

              if (age < 0) {
                return 'Das Alter darf nicht kleiner als 0 sein';
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.arrow_downward_rounded),
          ),
          TextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(isDense: true, hintText: 'bis'),
            onChanged: (value) {
              ageTo = int.tryParse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Es muss ein Alter eingegeben werden';
              }

              final age = int.parse(value);

              if (age < 0) {
                return 'Das Alter darf nicht kleiner als 0 sein';
              }

              if (ageTo != null && ageFrom != null) {
                if (ageFrom! > ageTo!) {
                  return '"von" muss kleiner als "bis" sein';
                }
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: const Icon(Icons.add_rounded),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.add(
                      Classification(ageFrom: ageFrom!, ageTo: ageTo!),
                    );
                  }
                },
                label: const Text('Einfügen'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
