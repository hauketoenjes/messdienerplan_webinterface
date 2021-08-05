import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/update_create_view/update_create_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';

class LocationUpdateCreateView extends StatelessWidget {
  final locationRepository = KiwiContainer().resolve<LocationRepository>();

  @override
  Widget build(BuildContext context) {
    return UpdateCreateView<Location, int>(
      title: 'Ort',
      description: 'Einen Ort hinzufügen',
      createItem: () => Location(locationName: ''),
      createRepository: locationRepository,
      updateRepository: locationRepository,
      readRepository: locationRepository,
      pathParameterName: 'locationId',
      castString: (v) => int.tryParse(v),
      formFields: (item, _) => [
        BaseFormField(
          title: 'Name',
          isRequired: true,
          child: FormBuilderTextField(
            name: 'name',
            onChanged: (value) => item.locationName = value ?? '',
            initialValue: item.locationName,
            validator: FormBuilderValidators.required(context),
          ),
        ),
      ],
    );
  }
}
