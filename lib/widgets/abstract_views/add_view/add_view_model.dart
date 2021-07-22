import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';

class AddViewModel<T> with ChangeNotifier {
  T item;
  Create<T> createRepository;

  AddViewModel({
    required this.item,
    required this.createRepository,
  });

  Future<Result<T>> add() async {
    return createRepository.create(item);
  }
}
