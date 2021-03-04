import '../model/models.dart';
import 'base_repository.dart';
import 'mass_repository.dart';

class PlanRepository extends BaseRepository<Plan, int> {
  Map<int, MassRepository> masses = {};

  @override
  Future<Plan> create(Plan data) async {
    var createdData = await client.postPlan(data);
    if (!masses.containsKey(createdData.id)) {
      masses[createdData.id] = MassRepository(createdData.id);
    }
    return createdData;
  }

  @override
  Future<void> delete(int id) async {
    await client.deletePlan(id);
    masses.remove(id);
  }

  @override
  Future<Plan> get(int id) async {
    var data = await client.getPlan(id);
    if (!masses.containsKey(data.id)) {
      masses[data.id] = MassRepository(data.id);
    }
    return data;
  }

  @override
  int getId(Plan data) {
    return data.id;
  }

  @override
  Future<List<Plan>> getList() async {
    var list = await client.getPlans();
    list.forEach(
      (element) {
        if (!masses.containsKey(element.id)) {
          masses[element.id] = MassRepository(element.id);
        }
      },
    );
    return list;
  }

  @override
  Future<Plan> update(Plan data) {
    return client.patchPlan(data.id, data);
  }
}
