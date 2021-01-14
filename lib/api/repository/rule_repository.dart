import '../model/models.dart';
import 'base_repository.dart';

class RuleRepository extends BaseRepository<Rule> {
  final int typeId;

  RuleRepository(this.typeId);

  @override
  Future<Rule> alterData(Rule data) async {
    return await client.patchRule(typeId, data.id, data);
  }

  @override
  Future<void> deleteData(Rule data) async {
    return await client.deleteRule(typeId, data.id);
  }

  @override
  Future<List<Rule>> getModelList() async {
    return await client.getRules(typeId);
  }

  @override
  Future<Rule> insertData(Rule data) async {
    return await client.postRule(typeId, data);
  }

  @override
  int getDataId(Rule data) {
    return data.id;
  }
}
