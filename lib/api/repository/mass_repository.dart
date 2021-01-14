import '../model/models.dart';
import 'base_repository.dart';
import 'mass_acolyte_repository.dart';

class MassRepository extends BaseRepository<Mass> {
  final int planId;

  Map<int, MassAcolyteRepository> massAcolytes = {};

  MassRepository(this.planId);

  @override
  Future<Mass> alterData(Mass data) async {
    return await client.patchMass(planId, data.id, data);
  }

  @override
  Future<void> deleteData(Mass data) async {
    return await client.deleteMass(planId, data.id);
  }

  @override
  Future<List<Mass>> getModelList() async {
    var masses = await client.getMasses(planId);

    for (var m in masses) {
      massAcolytes[m.id] = MassAcolyteRepository(planId, m.id);
    }

    return masses;
  }

  @override
  Future<Mass> insertData(Mass data) async {
    return await client.postMass(planId, data);
  }

  @override
  int getDataId(Mass data) {
    return data.id;
  }
}
