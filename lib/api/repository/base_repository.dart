import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../messdiener_api.dart';

abstract class BaseRepository<Data> {
  MessdienerApiClient client = Get.find<MessdienerApiClient>();
  List<Data> _data = [];

  List<Data> toDelete = [];
  List<Data> toInsert = [];
  List<Data> toAlter = [];

  Future<List<Data>> getDataList({bool forceUpdate = false}) async {
    if (_data.isEmpty || forceUpdate) {
      _data = await getModelList();
    }
    return _data;
  }

  Future<Data> getData(int id, {bool forceUpdate = false}) async {
    await getDataList(forceUpdate: forceUpdate);
    return _data.singleWhere((data) => getDataId(data) == id);
  }

  Future<List<Data>> update() async {
    var actions = <Future>[];

    toDelete.forEach((d) {
      actions.add(deleteData(d));
    });
    toDelete.clear();

    toInsert.forEach((d) {
      actions.add(insertData(d));
    });
    toInsert.clear();

    toAlter.forEach((d) {
      actions.add(alterData(d));
    });
    toAlter.clear();

    await Future.wait(actions);
    return await getDataList(forceUpdate: true);
  }

  void insert(Data data) {
    toInsert.add(data);
  }

  void alter(Data data) {
    toAlter.add(data);
  }

  void delete(Data data) {
    toDelete.add(data);
  }

  @protected
  Future<List<Data>> getModelList();

  @protected
  int getDataId(Data data);

  @protected
  Future<void> deleteData(Data data);

  @protected
  Future<Data> insertData(Data data);

  @protected
  Future<Data> alterData(Data data);
}
