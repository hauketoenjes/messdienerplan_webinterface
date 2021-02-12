import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../messdiener_api.dart';

abstract class BaseRepository<Model, IdentifierType> {
  ///
  /// API Client
  ///
  @protected
  MessdienerApiClient client = Get.find<MessdienerApiClient>();

  ///
  /// Cache of [Model]
  ///
  final _cache = <Model>[].obs;

  ///
  /// Retuns [Model] from cache if available, otherwise calls [getDataList] with
  /// [forceUpdate] true and returns [Model].
  ///
  Future<Model> getData(IdentifierType id, {bool forceUpdate = false}) async {
    var data =
        _cache.singleWhere((data) => getId(data) == id, orElse: () => null);

    if (data != null && !forceUpdate) {
      return data;
    }

    await getDataList(forceUpdate: true);
    return _cache.singleWhere((data) => getId(data) == id);
  }

  ///
  /// Returns a list of [Model] from cache.
  ///
  /// Gets a fresh list from server when [forceUpdate] is true or the cache is
  /// empty.
  ///
  Future<RxList<Model>> getDataList({bool forceUpdate = false}) async {
    if (_cache.isEmpty | forceUpdate) {
      _cache.assignAll(await getList());
    }
    return _cache;
  }

  ///
  /// Creates a new [data] object and adds it to cache
  ///
  Future<Model> createData(Model data) async {
    // Create data and receive created data
    var createdData = await create(data);

    // Add Data to cache, save to do, cause it has to have a unique id
    _cache.add(createdData);

    return createdData;
  }

  ///
  /// Updates the [data] object and the cache
  ///
  Future<Model> updateData(Model data) async {
    // Update data and receive updated data
    var updatedData = await update(data);

    // Remove the old version of the data and add the updated
    _cache.removeWhere((element) => getId(element) == getId(data));
    _cache.add(updatedData);

    return updatedData;
  }

  ///
  /// Deletes the item with [id] and removes it from cache
  ///
  Future<void> deleteData(IdentifierType id) async {
    // Delete the data and remove it from cache
    await delete(id);
    _cache.removeWhere((element) => getId(element) == id);
  }

  @protected
  Future<Model> get(IdentifierType id);

  @protected
  Future<List<Model>> getList();

  @protected
  Future<Model> create(Model data);

  @protected
  Future<Model> update(Model data);

  @protected
  Future<void> delete(IdentifierType id);

  IdentifierType getId(Model data);
}
