import '../model/models.dart';
import 'base_repository.dart';

class ClassificationRepository extends BaseRepository<Classification, int> {
  final int groupId;

  ClassificationRepository(this.groupId);

  @override
  Future<Classification> create(Classification data) {
    return client.postClassification(groupId, data);
  }

  @override
  Future<void> delete(int id) {
    return client.deleteClassification(groupId, id);
  }

  @override
  Future<Classification> get(int id) {
    return client.getClassification(groupId, id);
  }

  @override
  int getId(Classification data) {
    return data.id;
  }

  @override
  Future<List<Classification>> getList() {
    return client.getClassifications(groupId);
  }

  @override
  Future<Classification> update(Classification data) {
    return client.patchClassification(groupId, data.id, data);
  }
}
