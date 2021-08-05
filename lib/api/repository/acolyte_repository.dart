import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';

class AcolyteRepository
    with
        ApiClient,
        ReadAll<Acolyte>,
        Create<Acolyte>,
        Delete<Acolyte>,
        Update<Acolyte>,
        Read<Acolyte, int> {
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

  @override
  Future<Acolyte> readCall(int id) {
    return apiClient.getAcolyte(id);
  }

  @override
  Future<Acolyte> updateCall(Acolyte data) {
    return apiClient.patchAcolyte(data.id!, data);
  }
}
