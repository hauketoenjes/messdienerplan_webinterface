import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';

class UpdateCreateViewModel<T, U> with ChangeNotifier {
  final U? itemId;
  final T Function() createItem;
  final bool isUpdateRoute;
  final Create<T> createRepository;
  final Update<T> updateRepository;
  final Read<T, U> readRepository;

  UpdateCreateViewModel({
    required this.itemId,
    required this.createItem,
    required this.isUpdateRoute,
    required this.createRepository,
    required this.updateRepository,
    required this.readRepository,
  });

  Future<Result<T>> loadOrCreateItem() {
    if (isUpdateRoute) {
      if (itemId == null) {
        return Future(
            () => Result.error('Die angegebene URL ist nicht gültig.'));
      }
      return readRepository.read(itemId as U);
    } else {
      return Future(() => Result.value(createItem()));
    }
  }

  Future<Result<T>> updateOrCreate(T item) async {
    if (isUpdateRoute) {
      return updateRepository.update(item);
    } else {
      return createRepository.create(item);
    }
  }
}
