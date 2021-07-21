import 'package:async/async.dart';
import 'package:meta/meta.dart';

mixin ReadAll<T> {
  /// Ephemeral cache, damit concurrent Anfragen gecached werden
  final AsyncCache<List<T>> _cache = AsyncCache.ephemeral();

  @visibleForOverriding
  Future<List<T>> readAllCall();

  Future<Result<List<T>>> readAll() async {
    return Result.capture<List<T>>(_cache.fetch(readAllCall));
  }
}
