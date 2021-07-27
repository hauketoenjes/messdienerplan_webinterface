import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';

class RoleRepository
    with
        ApiClient,
        ReadAll<Role>,
        Create<Role>,
        Delete<Role>,
        Update<Role>,
        Read<Role, int> {
  @override
  Future<Role> createCall(Role data) {
    return apiClient.postRole(data);
  }

  @override
  Future<void> deleteCall(Role data) {
    return apiClient.deleteRole(data.id!);
  }

  @override
  Future<List<Role>> readAllCall() {
    return apiClient.getRoles();
  }

  @override
  Future<Role> readCall(int id) {
    return apiClient.getRole(id);
  }

  @override
  Future<Role> updateCall(Role data) {
    return apiClient.patchRole(data.id!, data);
  }
}
