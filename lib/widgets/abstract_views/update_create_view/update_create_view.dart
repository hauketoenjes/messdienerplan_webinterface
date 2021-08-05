import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart'
    as c;
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';
import 'package:messdienerplan_webinterface/widgets/control/future_result_builder.dart';
import 'package:messdienerplan_webinterface/widgets/panels/base_panel.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import 'package:messdienerplan_webinterface/misc/extensions/list_extensions.dart';

import 'update_create_view_model.dart';

class UpdateCreateView<T, U> extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String title;
  final String description;
  final T Function() createItem;
  final U? Function(String value) castString;
  final String pathParameterName;
  final c.Create<T> createRepository;
  final Update<T> updateRepository;
  final Read<T, U> readRepository;
  final List<Widget> Function(
      T item, List<V> Function<V>() resolveOptionalItems) formFields;
  final void Function(void Function<U>(ReadAll<U> readAll) register)?
      optionalReadAllRepositories;

  UpdateCreateView({
    Key? key,
    required this.title,
    required this.description,
    required this.createItem,
    required this.createRepository,
    required this.updateRepository,
    required this.readRepository,
    required this.pathParameterName,
    required this.castString,
    this.optionalReadAllRepositories,
    required this.formFields,
  }) : super(key: key);

  U? getId(Map<String, String> pathParameters, String pathParameterName) {
    if (pathParameters.containsKey(pathParameterName)) {
      return castString(pathParameters[pathParameterName]!);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = getId(context.vRouter.pathParameters, pathParameterName);
    final bool isUpdateRoute = id != null;

    return ChangeNotifierProvider<UpdateCreateViewModel<T, U>>(
      create: (context) => UpdateCreateViewModel<T, U>(
        isUpdateRoute: isUpdateRoute,
        itemId: id,
        createItem: createItem,
        createRepository: createRepository,
        updateRepository: updateRepository,
        readRepository: readRepository,
        optionalReadAllRepositories: optionalReadAllRepositories,
      ),
      builder: (context, child) {
        return Consumer<UpdateCreateViewModel<T, U>>(
          builder: (context, model, child) {
            return BasePanel(
              title: title,
              description: description,
              children: [
                FutureResultBuilder<T>(
                  future: model.loadOrCreateItem(),
                  buildValueChild: (context, item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormBuilder(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: formFields(
                              item,
                              model.resolveOptionalItems,
                            ).genericJoin(
                              const SizedBox(height: 24),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await model.updateOrCreate(item);
                              context.vRouter.pop();
                            }
                          },
                          icon: const Icon(Icons.add_rounded),
                          label:
                              Text(isUpdateRoute ? 'Speichern' : 'Hinzufügen'),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
