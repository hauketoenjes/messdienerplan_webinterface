import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';

class RoleRepository with ApiClient, ReadAll<Role>, Create<Role>, Delete<Role> {
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
}
