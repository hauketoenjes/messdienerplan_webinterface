import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart'
    as c;
import 'package:messdienerplan_webinterface/widgets/form_fields/base_form_field.dart';
import 'package:messdienerplan_webinterface/widgets/panels/base_panel.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import 'add_view_model.dart';

class AddView<T> extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final String title;
  final String description;
  final T item;
  final c.Create<T> createRepository;
  final List<BaseFormField> Function(T item) formFields;

  AddView({
    Key? key,
    required this.title,
    required this.description,
    required this.item,
    required this.createRepository,
    required this.formFields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddViewModel<T>>(
      create: (context) => AddViewModel<T>(
        item: item,
        createRepository: createRepository,
      ),
      builder: (context, child) {
        return Consumer<AddViewModel<T>>(
          builder: (context, model, child) {
            return BasePanel(
              title: title,
              description: description,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: formFields(item),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await model.add();
                        context.vRouter.pop();
                      }
                    },
                    icon: const Icon(Icons.add_rounded),
                    label: const Text('Hinzufügen'))
              ],
            );
          },
        );
      },
    );
  }
}
