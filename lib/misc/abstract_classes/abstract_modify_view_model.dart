import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';

abstract class AbstractModifyViewModel<DataModel> extends GetxController {
  Rx<DataModel> dataModel = Rx<DataModel>();
  int dataModelId;
  BaseRepository<DataModel> baseRepository;

  final DataModel Function() createNewModel;
  final Future<DataModel> Function(
      BaseRepository<DataModel> baseRepository, int id) getExistingModel;

  var loading = true.obs;

  AbstractModifyViewModel(
    this.dataModelId,
    this.baseRepository, {
    @required this.createNewModel,
    @required this.getExistingModel,
  }) {
    dataModel(createNewModel());
  }

  @override
  Future<void> onReady() async {
    if (dataModelId != null) {
      dataModel(await getExistingModel(baseRepository, dataModelId));
    }
    loading(false);
    super.onReady();
  }

  Future<bool> delete() async {
    try {
      await baseRepository.delete(dataModel());
      await baseRepository.update();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insert() async {
    try {
      await baseRepository.insert(dataModel());
      await baseRepository.update();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateData() async {
    try {
      await baseRepository.alter(dataModel());
      await baseRepository.update();
      return true;
    } catch (e) {
      return false;
    }
  }
}
