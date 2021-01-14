import '../model/models.dart';
import 'base_repository.dart';
import 'classification_repository.dart';

class GroupRepository extends BaseRepository<Group> {
  Map<int, ClassificationRepository> classifications = {};

  @override
  Future<Group> alterData(Group data) async {
    return await client.patchGroup(data.id, data);
  }

  @override
  Future<void> deleteData(Group data) async {
    return await client.deleteGroup(data.id);
  }

  @override
  Future<List<Group>> getModelList() async {
    var groups = await client.getGroups();

    for (var g in groups) {
      classifications[g.id] = ClassificationRepository(g.id);
    }

    return groups;
  }

  @override
  Future<Group> insertData(Group data) async {
    return await client.postGroup(data);
  }

  @override
  int getDataId(Group data) {
    return data.id;
  }
}
