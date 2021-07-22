import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/location_repository.dart';
import 'package:messdienerplan_webinterface/widgets/abstract_views/add_view/add_view.dart';
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';

class LocationAddView extends StatelessWidget {
  final locationRepository = KiwiContainer().resolve<LocationRepository>();

  @override
  Widget build(BuildContext context) {
    return AddView<Location>(
      title: 'Ort',
      description: 'Einen Ort hinzufügen',
      item: Location(locationName: ''),
      createRepository: locationRepository,
      formFields: (item) => [
        BaseFormField(
          title: 'Name',
          isRequired: true,
          child: TextFormField(
            onChanged: (value) => item.locationName = value,
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
