import '../model/models.dart';
import 'base_repository.dart';
import 'mass_acolyte_repository.dart';

class MassRepository extends BaseRepository<Mass, int> {
  final int planId;

  Map<int, MassAcolyteRepository> massAcolytes = {};

  MassRepository(this.planId);

  @override
  Future<Mass> create(Mass data) async {
    var createdData = await client.postMass(planId, data);
    if (!massAcolytes.containsKey(createdData.id)) {
      massAcolytes[createdData.id] = MassAcolyteRepository(planId, data.id);
    }
    return createdData;
  }

  @override
  Future<void> delete(int id) async {
    await client.deleteMass(planId, id);
    massAcolytes.remove(id);
  }

  @override
  Future<Mass> get(int id) async {
    var data = await client.getMass(planId, id);
    if (!massAcolytes.containsKey(data.id)) {
      massAcolytes[data.id] = MassAcolyteRepository(planId, data.id);
    }
    return data;
  }

  @override
  int getId(Mass data) {
    return data.id;
  }

  @override
  Future<List<Mass>> getList() async {
    var list = await client.getMasses(planId);
    list.forEach(
      (element) {
        if (!massAcolytes.containsKey(element.id)) {
          massAcolytes[element.id] = MassAcolyteRepository(planId, element.id);
        }
      },
    );
    return list;
  }

  @override
  Future<Mass> update(Mass data) {
    return client.patchMass(planId, data.id, data);
  }
}
