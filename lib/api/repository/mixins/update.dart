import 'package:async/async.dart';
import 'package:meta/meta.dart';

mixin Update<T> {
  @visibleForOverriding
  Future<T> updateCall(T data);

  Future<Result<T>> update(T data) async {
    return Result.capture<T>(updateCall(data));
  }
}
