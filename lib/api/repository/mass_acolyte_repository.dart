import '../model/models.dart';
import 'base_repository.dart';

class MassAcolyteRepository extends BaseRepository<MassAcolyte> {
  final int planId;
  final int massId;

  MassAcolyteRepository(this.planId, this.massId);

  @override
  Future<MassAcolyte> alterData(MassAcolyte data) async {
    return await client.patchMassAcolyte(planId, massId, data.id, data);
  }

  @override
  Future<void> deleteData(MassAcolyte data) async {
    return await client.deleteMassAcolyte(planId, massId, data.id);
  }

  @override
  Future<List<MassAcolyte>> getModelList() async {
    return await client.getMassAcolytes(planId, massId);
  }

  @override
  Future<MassAcolyte> insertData(MassAcolyte data) async {
    return await client.postMassAcolyte(planId, massId, data);
  }

  @override
  int getDataId(MassAcolyte data) {
    return data.id;
  }
}
