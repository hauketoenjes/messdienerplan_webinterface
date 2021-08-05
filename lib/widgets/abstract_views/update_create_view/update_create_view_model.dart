import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';

class UpdateCreateViewModel<T, U> with ChangeNotifier {
  final U? itemId;
  final T Function() createItem;
  final bool isUpdateRoute;
  final Create<T> createRepository;
  final Update<T> updateRepository;
  final Read<T, U> readRepository;
  final void Function(void Function<U>(ReadAll<U> readAll) register)?
      optionalReadAllRepositories;

  Map<Type, ReadAll<dynamic>> optionalReadAlls = {};
  Map<Type, List<dynamic>> optionalReadAllItems = {};

  UpdateCreateViewModel({
    required this.itemId,
    required this.createItem,
    required this.isUpdateRoute,
    required this.createRepository,
    required this.updateRepository,
    required this.readRepository,
    this.optionalReadAllRepositories,
  }) {
    if (optionalReadAllRepositories != null) {
      optionalReadAllRepositories!(registerOptionalReadAllRepository);
    }
  }

  void registerOptionalReadAllRepository<V>(ReadAll<V> readAll) {
    optionalReadAlls[V] = readAll;
  }

  List<V> resolveOptionalItems<V>() {
    return (optionalReadAllItems[V] ?? <V>[]) as List<V>;
  }

  Future<Result<T>> loadOrCreateItem() async {
    if (optionalReadAlls.isNotEmpty) {
      for (final type in optionalReadAlls.keys) {
        final readAll = optionalReadAlls[type];
        final result = await readAll!.readAll();

        if (result.isValue) {
          optionalReadAllItems[type] = result.asValue!.value;
        } else {
          return result.asError!;
        }
      }
    }

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
