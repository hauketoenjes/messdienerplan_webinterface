import '../model/models.dart';
import 'base_repository.dart';
import 'requirement_repository.dart';
import 'rule_repository.dart';

class TypeRepository extends BaseRepository<Type> {
  Map<int, RuleRepository> rules = {};
  Map<int, RequirementRepository> requirements = {};

  @override
  Future<Type> alterData(Type data) async {
    return await client.patchType(data.id, data);
  }

  @override
  Future<void> deleteData(Type data) async {
    return await client.deleteType(data.id);
  }

  @override
  Future<List<Type>> getModelList() async {
    var types = await client.getTypes();

    for (var t in types) {
      rules[t.id] = RuleRepository(t.id);
      requirements[t.id] = RequirementRepository(t.id);
    }

    return types;
  }

  @override
  Future<Type> insertData(Type data) async {
    return await client.postType(data);
  }

  @override
  int getDataId(Type data) {
    return data.id;
  }
}
