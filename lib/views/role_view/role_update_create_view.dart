import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/role_repository.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/update_create_view/update_create_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';

class RoleUpdateCreateView extends StatelessWidget {
  final roleRepository = KiwiContainer().resolve<RoleRepository>();

  @override
  Widget build(BuildContext context) {
    return UpdateCreateView<Role, int>(
      title: 'Rolle',
      description: 'Eine Rolle einfügen',
      createItem: () => Role(roleName: ''),
      createRepository: roleRepository,
      updateRepository: roleRepository,
      readRepository: roleRepository,
      pathParameterName: 'roleId',
      castString: (v) => int.tryParse(v),
      formFields: (item) => [
        BaseFormField(
          title: 'Name',
          isRequired: true,
          child: TextFormField(
            initialValue: item.roleName,
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
