import '../model/models.dart';
import 'base_repository.dart';

class RequirementRepository extends BaseRepository<Requirement> {
  final int typeId;

  RequirementRepository(this.typeId);

  @override
  Future<Requirement> alterData(Requirement data) async {
    return await client.patchRequirement(typeId, data.id, data);
  }

  @override
  Future<void> deleteData(Requirement data) async {
    return await client.deleteRequirement(typeId, data.id);
  }

  @override
  Future<List<Requirement>> getModelList() async {
    return await client.getRequirements(typeId);
  }

  @override
  Future<Requirement> insertData(Requirement data) async {
    return await client.postRequirement(typeId, data);
  }

  @override
  int getDataId(Requirement data) {
    return data.id;
  }
}
