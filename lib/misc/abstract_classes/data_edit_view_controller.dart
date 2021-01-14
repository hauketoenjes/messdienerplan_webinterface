import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/repository_view_controller.dart';

class DataEditViewController<DataModel>
    extends RepositoryViewController<DataModel> {
  ///
  /// Das Datenmodell, welches erstellt werden soll
  ///
  Rx<DataModel> dataModel = Rx();

  ///
  /// Merhode, welches das zu bearbeitende DatenModell aus der Repository lädt
  /// und wenn ein neues Objekt erstellt werden soll, wird ein neues DatenModell
  /// erstellt.
  ///
  final Future<DataModel> Function(Map<String, String> routeParameters,
      BaseRepository<DataModel> baseRepository) getDataModel;

  DataEditViewController(
    Future<BaseRepository<DataModel>> Function(
            Map<String, String> routeParameters)
        getBaseRepository, {
    this.getDataModel,
    Future<void> Function(RepositoryViewController<DataModel> controller)
        loadAdditionalData,
  }) : super(getBaseRepository, loadAdditionalData);

  @override
  void onReady() async {
    await initializeDataModel();
    super.onReady();
  }

  Future<void> initializeDataModel() async {
    loading(true);
    try {
      dataModel(await getDataModel(Get.parameters, baseRepository));
    } catch (e) {
      error(e.toString());
    }
    loading(false);
  }

  Future<bool> modifyData() async {
    loading(true);

    try {
      baseRepository.alter(dataModel());
      await baseRepository.update();
      formError('');
      loading(false);
      return true;
    } catch (e) {
      formError(e.toString());
      loading(false);
      return false;
    }
  }

  Future<bool> deleteData() async {
    loading(true);

    try {
      baseRepository.delete(dataModel());
      await baseRepository.update();
      formError('');
      loading(false);
      return true;
    } catch (e) {
      formError(e.toString());
      loading(false);
      return false;
    }
  }

  Future<bool> createData() async {
    loading(true);

    try {
      baseRepository.insert(dataModel());
      await baseRepository.update();
      formError('');
      loading(false);
      return true;
    } catch (e) {
      formError(e.toString());
      loading(false);
      return false;
    }
  }
}
