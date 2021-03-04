import '../model/models.dart';
import 'base_repository.dart';

class RequirementRepository extends BaseRepository<Requirement, int> {
  final int typeId;

  RequirementRepository(this.typeId);

  @override
  Future<Requirement> create(Requirement data) {
    return client.postRequirement(typeId, data);
  }

  @override
  Future<void> delete(int id) {
    return client.deleteRequirement(typeId, id);
  }

  @override
  Future<Requirement> get(int id) {
    return client.getRequirement(typeId, id);
  }

  @override
  int getId(Requirement data) {
    return data.id;
  }

  @override
  Future<List<Requirement>> getList() {
    return client.getRequirements(typeId);
  }

  @override
  Future<Requirement> update(Requirement data) {
    return client.patchRequirement(typeId, data.id, data);
  }
}
