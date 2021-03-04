import '../model/models.dart';
import 'base_repository.dart';
import 'requirement_repository.dart';
import 'rule_repository.dart';

class TypeRepository extends BaseRepository<Type, int> {
  Map<int, RuleRepository> rules = {};
  Map<int, RequirementRepository> requirements = {};

  @override
  Future<Type> create(Type data) async {
    var createdData = await client.postType(data);
    if (!rules.containsKey(createdData.id)) {
      rules[createdData.id] = RuleRepository(createdData.id);
    }
    if (!requirements.containsKey(createdData.id)) {
      requirements[createdData.id] = RequirementRepository(createdData.id);
    }
    return createdData;
  }

  @override
  Future<void> delete(int id) async {
    await client.deleteType(id);
    rules.remove(id);
    requirements.remove(id);
  }

  @override
  Future<Type> get(int id) async {
    var data = await client.getType(id);
    if (!rules.containsKey(data.id)) {
      rules[data.id] = RuleRepository(data.id);
    }
    if (!requirements.containsKey(data.id)) {
      requirements[data.id] = RequirementRepository(data.id);
    }
    return data;
  }

  @override
  int getId(Type data) {
    return data.id;
  }

  @override
  Future<List<Type>> getList() async {
    var list = await client.getTypes();
    list.forEach(
      (element) {
        if (!rules.containsKey(element.id)) {
          rules[element.id] = RuleRepository(element.id);
        }
        if (!requirements.containsKey(element.id)) {
          requirements[element.id] = RequirementRepository(element.id);
        }
      },
    );
    return list;
  }

  @override
  Future<Type> update(Type data) {
    return client.patchType(data.id, data);
  }
}
