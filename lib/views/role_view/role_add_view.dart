import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/add_view/add_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';

class RoleAddView extends StatelessWidget {
  final roleRepository = KiwiContainer().resolve<RoleRepository>();

  @override
  Widget build(BuildContext context) {
    return AddView<Role>(
      title: 'Rolle',
      description: 'Eine Rolle einfügen',
      item: Role(roleName: ''),
      createRepository: roleRepository,
      formFields: (item) => [
        BaseFormField(
          title: 'Name',
          isRequired: true,
          child: TextFormField(
            onChanged: (value) => item.roleName = value,
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
