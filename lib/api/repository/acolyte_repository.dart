import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';

class AcolyteRepository
    with ApiClient, ReadAll<Acolyte>, Create<Acolyte>, Delete<Acolyte> {
  @override
  Future<Acolyte> createCall(Acolyte data) {
    return apiClient.postAcolyte(data);
  }

  @override
  Future<void> deleteCall(Acolyte data) {
    return apiClient.deleteAcolyte(data.id!);
  }

  @override
  Future<List<Acolyte>> readAllCall() {
    return apiClient.getAcolytes();
  }
}
