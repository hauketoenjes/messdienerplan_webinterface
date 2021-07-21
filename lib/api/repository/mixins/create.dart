import 'package:async/async.dart';
import 'package:meta/meta.dart';

mixin Create<T> {
  @visibleForOverriding
  Future<T> createCall(T data);

  Future<Result<T>> create(T data) async {
    return Result.capture<T>(createCall(data));
  }
}
