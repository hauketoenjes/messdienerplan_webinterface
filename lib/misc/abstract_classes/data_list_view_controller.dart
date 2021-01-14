import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/repository_view_controller.dart';
import 'package:get/get.dart';

class DataListViewController<DataModel>
    extends RepositoryViewController<DataModel> {
  ///
  /// Die Liste der Daten
  ///
  var dataModelList = <DataModel>[].obs;

  DataListViewController(
      Future<BaseRepository<DataModel>> Function(
              Map<String, String> routeParameters)
          getBaseRepository,
      {Future<void> Function(RepositoryViewController<DataModel> controller)
          loadAdditionalData})
      : super(getBaseRepository, loadAdditionalData);

  ///
  /// Wenn der erste Frame gerendert wird, dann das Laden der Daten starten
  ///
  @override
  Future<void> onReady() async {
    await refreshDataList();
    super.onReady();
  }

  ///
  /// Aktualisiert die Daten in der Liste
  ///
  /// Mit [forceUpdate] kann eingestellt werden, ob die Daten neu vom Server
  /// geladen werden sollen oder aus dem Cache genommen werden (wenn sie im
  /// Cache liegen).
  ///
  Future<void> refreshDataList({bool forceUpdate = false}) async {
    loading(true);

    try {
      dataModelList(await baseRepository.getDataList(forceUpdate: forceUpdate));
      error('');
    } catch (e) {
      error(e.toString());
    }

    loading(false);
  }

  ///
  /// Aktualisiert ein Datenmodell, wenn z.B. durch eine Quick-Action etwas
  /// geändert werden soll.
  ///
  Future<void> changeData(DataModel dataModel) async {
    loading(true);

    try {
      baseRepository.alter(dataModel);
      await baseRepository.update();
      await refreshDataList();
      error('');
    } catch (e) {
      error(e.toString());
    }

    loading(false);
  }
}
