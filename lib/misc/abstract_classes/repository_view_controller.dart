import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/repository/base_repository.dart';
import 'package:messdienerplan_webinterface/misc/abstract_classes/page_skeleton_view_controller.dart';

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

  final Map<Type, dynamic> additionalData = {};

  void storeAdditionalData<AdditionalData>(AdditionalData data) {
    additionalData[AdditionalData] = data;
  }

  AdditionalData getAdditionalData<AdditionalData>() {
    return additionalData[AdditionalData] as AdditionalData;
  }

  RepositoryViewController(this.getBaseRepository, this.loadAdditionalData);

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
