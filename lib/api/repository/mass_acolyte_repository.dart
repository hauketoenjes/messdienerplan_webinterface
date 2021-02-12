import '../model/models.dart';
import 'base_repository.dart';

class MassAcolyteRepository extends BaseRepository<MassAcolyte, int> {
  final int planId;
  final int massId;

  MassAcolyteRepository(this.planId, this.massId);

  @override
  Future<MassAcolyte> create(MassAcolyte data) {
    return client.postMassAcolyte(planId, massId, data);
  }

  @override
  Future<void> delete(int id) {
    return client.deleteMassAcolyte(planId, massId, id);
  }

  @override
  Future<MassAcolyte> get(int id) {
    return client.getMassAcolyte(planId, massId, id);
  }

  @override
  int getId(MassAcolyte data) {
    return data.id;
  }

  @override
  Future<List<MassAcolyte>> getList() {
    return client.getMassAcolytes(planId, massId);
  }

  @override
  Future<MassAcolyte> update(MassAcolyte data) {
    return client.patchMassAcolyte(planId, massId, data.id, data);
  }
}
