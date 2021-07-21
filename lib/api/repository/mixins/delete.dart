import 'package:async/async.dart';
import 'package:meta/meta.dart';

mixin Delete<T> {
  @visibleForOverriding
  Future<void> deleteCall(T data);

  Future<Result<void>> delete(T data) async {
    return Result.capture<void>(deleteCall(data));
  }
}
