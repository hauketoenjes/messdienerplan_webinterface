import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/page_skeleton_view_controller.dart';

///
/// Controller, welcher eine [BaseRepository] und zusätzliche Daten speichern kann.
///
abstract class RepositoryViewController<DataModel>
    extends PageSkeletonViewController {
  ///
  /// Die BaseRepository, um die Daten zu laden, ändern und löschen.
  ///
  BaseRepository<DataModel> baseRepository;

  final Future<BaseRepository<DataModel>> Function(
      Map<String, String> routeParameters) getBaseRepository;

  ///
  /// Die Methode ist dafür da, Daten zu laden, die zusätzlich zur Repository
  /// benötigt werden.
  ///
  final Future<void> Function(RepositoryViewController<DataModel> controller)
      loadAdditionalData;

  ///
  /// Die zusätzlichen Daten, die vielleicht benötigt werden, um das Modell der
  /// [BaseRepository] zu visualisieren.
  ///
  /// Gespeichert werden die Daten nach dem Typ und nach der ID
  ///
  final Map<Type, Map<int, dynamic>> _additionalData = {};

  ///
  /// Konstruktor
  ///
  RepositoryViewController(this.getBaseRepository, this.loadAdditionalData);

  ///
  /// Funktion zum abrufen der zusätzlichen Daten
  ///
  /// [Data] muss angegeben werden, um zu wissen, welche Daten abgerufen werden sollen
  ///
  /// [id] ist die ID des Datenmodells
  ///
  Data getAdditionalDataById<Data>(int id) {
    return _additionalData[Data][id];
  }

  ///
  /// Funktion zum abrufen der zusätzlichen Daten
  ///
  /// [Data] muss angegeben werden, um zu wissen, welche Daten abgerufen werden sollen
  ///
  List<Data> getAdditionalDataList<Data>() {
    return _additionalData[Data].values.cast<Data>().toList();
  }

  ///
  /// Funktion zum speichern der zusätzlichen Daten. Die Methode sollte in
  /// [loadAdditionalData] benutzt werden.
  ///
  /// [Data] ist der Typ der Daten, der gespeichert werden soll
  ///
  /// [repository] ist die Repository vom Tpy [Data], wovon die Daten abgerufen werden
  /// können
  ///
  Future<void> storeAdditionalData<Data>(
      BaseRepository<Data> repository) async {
    var dataList = await repository.getDataList();

    if (_additionalData[Data] == null) {
      _additionalData[Data] = <int, dynamic>{};
    }

    _additionalData[Data].addAll(
      Map.fromEntries(
        dataList.map(
          (e) => MapEntry(repository.getDataId(e), e),
        ),
      ),
    );
  }

  ///
  /// Beim initialisieren (vor dem Rendern vom ersten Frame) die Repository
  /// initialisieren um sicherzugehen, dass nie auf null zugegriffen wird.
  ///
  @override
  Future<void> onInit() async {
    try {
      baseRepository = await getBaseRepository(Get.parameters);
      if (loadAdditionalData != null) await loadAdditionalData(this);
    } catch (e) {
      error(e.toString());
    }
    super.onInit();
  }
}
