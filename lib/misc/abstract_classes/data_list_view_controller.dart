import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/repository_view_controller.dart';
import 'package:get/get.dart';

///
/// Controller zum anzeigen von einer Datenliste von [DataModel]'s.
///
/// Bietet die Möglichkeit Daten zu suchen, filtern und durch z.B. QuickActions
/// zu bearbeiten.
///
class DataListViewController<DataModel>
    extends RepositoryViewController<DataModel> {
  ///
  /// Die Liste der Daten
  ///
  var dataModelList = <DataModel>[].obs;

  ///
  /// Die originale Liste von Daten (wenn sortiert wird etc.)
  ///
  var backupDataModelList = <DataModel>[].obs;

  ///
  /// Der aktuelle Search query, um die Liste zu filtern, wenn sie aktualisert wird.
  ///
  String currentQuery = '';

  ///
  /// Checkt, ob das DataModel bei einem bestimmten search query angezeigt
  /// werden soll.
  ///
  /// [query] Der Suchquery wird an Leerzeichen gesplittet und diese Funktion wird
  /// für jeden Teil aufgerufen.
  ///
  final bool Function(DataModel dataModel, String query) matchesSearchQuery;

  DataListViewController(
    Future<BaseRepository<DataModel, int>> Function(
            Map<String, String> routeParameters)
        getBaseRepository, {
    Future<void> Function(RepositoryViewController<DataModel> controller)
        loadAdditionalData,
    this.matchesSearchQuery,
  }) : super(getBaseRepository, loadAdditionalData);

  ///
  /// Sortiert die Liste nach dem aktuellen Search query
  ///
  void onSearch(String query) {
    currentQuery = query;
    dataModelList.assignAll(
      backupDataModelList.where(
        (d) => query
            .split(' ')
            .where(
              (queryPart) => matchesSearchQuery(
                d,
                queryPart.toLowerCase(),
              ),
            )
            .isNotEmpty,
      ),
    );
  }

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
      backupDataModelList.assignAll(
          await baseRepository.getDataList(forceUpdate: forceUpdate));
      if (currentQuery.isNotEmpty) {
        onSearch(currentQuery);
      } else {
        dataModelList.assignAll(backupDataModelList);
      }

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
      await baseRepository.updateData(dataModel);
      await refreshDataList();
      error('');
    } catch (e) {
      error(e.toString());
    }

    loading(false);
  }
}
