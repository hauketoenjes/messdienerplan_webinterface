import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/group_repository.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/add_view/add_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';

class GroupAddView extends StatelessWidget {
  final groupRepository = KiwiContainer().resolve<GroupRepository>();

  @override
  Widget build(BuildContext context) {
    return AddView<Group>(
      title: 'Gruppe',
      description: 'Eine Gruppe hinzufügen',
      item: Group(groupName: '', classifications: []),
      createRepository: groupRepository,
      formFields: (item) => [
        BaseFormField(
          title: 'Name',
          isRequired: true,
          child: TextFormField(
            onChanged: (value) => item.groupName = value,
            decoration: const InputDecoration(isDense: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Es muss ein Name eingegeben werden';
              }
            },
          ),
        ),
      ],
    );
  }
}
