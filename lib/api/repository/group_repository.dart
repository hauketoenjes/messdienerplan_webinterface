import '../model/models.dart';
import 'base_repository.dart';
import 'classification_repository.dart';

class GroupRepository extends BaseRepository<Group, int> {
  Map<int, ClassificationRepository> classifications = {};

  @override
  Future<void> delete(int id) async {
    await client.deleteGroup(id);
    classifications.remove(id);
  }

  @override
  Future<Group> get(int id) async {
    var data = await client.getGroup(id);
    if (!classifications.containsKey(data.id)) {
      classifications[data.id] = ClassificationRepository(data.id);
    }
    return data;
  }

  @override
  int getId(Group data) {
    return data.id;
  }

  @override
  Future<List<Group>> getList() async {
    var list = await client.getGroups();
    list.forEach((element) {
      if (!classifications.containsKey(element.id)) {
        classifications[element.id] = ClassificationRepository(element.id);
      }
    });
    return list;
  }

  @override
  Future<Group> update(Group data) {
    return client.patchGroup(data.id, data);
  }

  @override
  Future<Group> create(Group data) async {
    var createdData = await client.postGroup(data);
    if (!classifications.containsKey(createdData.id)) {
      classifications[createdData.id] =
          ClassificationRepository(createdData.id);
    }
    return createdData;
  }
}
