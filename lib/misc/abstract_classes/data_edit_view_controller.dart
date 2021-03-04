import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/repository_view_controller.dart';

///
/// Controller für eine Seite zum Bearbeiten eines [DataModel].
///
/// Bietet die Möglichkeit Daten zu bearbeiten, zu löschen oder neu zu erstellen.
///
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
      BaseRepository<DataModel, int> baseRepository) getDataModel;

  DataEditViewController(
    Future<BaseRepository<DataModel, int>> Function(
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

  ///
  /// Initilasisiert das [DataModel].
  ///
  Future<void> initializeDataModel() async {
    loading(true);
    try {
      dataModel(await getDataModel(Get.parameters, baseRepository));
    } catch (e) {
      error(e.toString());
    }
    loading(false);
  }

  ///
  /// Modifiziert das [DataModel].
  ///
  /// Gibt einen boolean zurück, ob die Operation fehlgeschlagen ist oder nicht.
  ///
  Future<bool> modifyData() async {
    loading(true);

    try {
      await baseRepository.updateData(dataModel());
      formError('');
      loading(false);
      return true;
    } catch (e) {
      formError(e.toString());
      loading(false);
      return false;
    }
  }

  ///
  /// Löscht das [DataModel].
  ///
  /// Gibt einen boolean zurück, ob die Operation fehlgeschlagen ist oder nicht.
  ///
  Future<bool> deleteData() async {
    loading(true);

    try {
      await baseRepository.deleteData(baseRepository.getId(dataModel()));
      formError('');
      loading(false);
      return true;
    } catch (e) {
      formError(e.toString());
      loading(false);
      return false;
    }
  }

  ///
  /// Erstellt ein neues [DataModel].
  ///
  /// Gibt einen boolean zurück, ob die Operation fehlgeschlagen ist oder nicht.
  ///
  Future<bool> createData() async {
    loading(true);

    try {
      await baseRepository.createData(dataModel());
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
