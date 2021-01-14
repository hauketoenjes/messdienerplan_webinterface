import '../model/models.dart';
import 'base_repository.dart';
import 'mass_repository.dart';

class PlanRepository extends BaseRepository<Plan> {
  Map<int, MassRepository> masses = {};

  @override
  Future<Plan> alterData(Plan data) async {
    return await client.patchPlan(data.id, data);
  }

  @override
  Future<void> deleteData(Plan data) async {
    return await client.deletePlan(data.id);
  }

  @override
  Future<List<Plan>> getModelList() async {
    var plans = await client.getPlans();

    for (var p in plans) {
      masses[p.id] = MassRepository(p.id);
    }

    return plans;
  }

  @override
  Future<Plan> insertData(Plan data) async {
    return await client.postPlan(data);
  }

  @override
  int getDataId(Plan data) {
    return data.id;
  }
}
