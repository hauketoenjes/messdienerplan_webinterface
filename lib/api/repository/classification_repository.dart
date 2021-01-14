import '../model/models.dart';
import 'base_repository.dart';

class ClassificationRepository extends BaseRepository<Classification> {
  final int groupId;

  ClassificationRepository(this.groupId);

  @override
  Future<Classification> alterData(Classification data) async {
    return await client.patchClassification(groupId, data.id, data);
  }

  @override
  Future<void> deleteData(Classification data) async {
    return await client.deleteClassification(groupId, data.id);
  }

  @override
  Future<List<Classification>> getModelList() async {
    return await client.getClassifications(groupId);
  }

  @override
  Future<Classification> insertData(Classification data) async {
    return await client.postClassification(groupId, data);
  }

  @override
  int getDataId(Classification data) {
    return data.id;
  }
}
