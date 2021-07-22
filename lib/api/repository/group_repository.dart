import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';

class GroupRepository
    with ApiClient, ReadAll<Group>, Create<Group>, Delete<Group> {
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
}
