import '../model/models.dart';
import 'base_repository.dart';

class RuleRepository extends BaseRepository<Rule, int> {
  final int typeId;

  RuleRepository(this.typeId);

  @override
  Future<Rule> create(Rule data) {
    return client.postRule(typeId, data);
  }

  @override
  Future<void> delete(int id) {
    return client.deleteRule(typeId, id);
  }

  @override
  Future<Rule> get(int id) {
    return client.getRule(typeId);
  }

  @override
  int getId(Rule data) {
    return data.id;
  }

  @override
  Future<List<Rule>> getList() {
    return client.getRules(typeId);
  }

  @override
  Future<Rule> update(Rule data) {
    return client.patchRule(typeId, data.id, data);
  }
}
