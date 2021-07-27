import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';

class GroupRepository
    with
        ApiClient,
        ReadAll<Group>,
        Read<Group, int>,
        Create<Group>,
        Delete<Group>,
        Update<Group> {
  @override
  Future<Group> createCall(Group data) {
    return apiClient.postGroup(data);
  }

  @override
  Future<void> deleteCall(Group data) {
    return apiClient.deleteGroup(data.id!);
  }

  @override
  Future<List<Group>> readAllCall() {
    return apiClient.getGroups();
  }

  @override
  Future<Group> updateCall(Group data) {
    return apiClient.patchGroup(data.id!, data);
  }

  @override
  Future<Group> readCall(int id) {
    return apiClient.getGroup(id);
  }
}
