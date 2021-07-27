import 'package:async/async.dart';
import 'package:meta/meta.dart';

mixin Read<T, U> {
  @visibleForOverriding
  Future<T> readCall(U id);

  Future<Result<T>> read(U id) async {
    return Result.capture<T>(readCall(id));
  }
}
