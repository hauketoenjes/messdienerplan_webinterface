import '../model/models.dart';
import 'base_repository.dart';

class RoleRepository extends BaseRepository<Role, int> {
  @override
  Future<Role> create(Role data) {
    return client.postRole(data);
  }

  @override
  Future<void> delete(int id) {
    return client.deleteRole(id);
  }

  @override
  Future<Role> get(int id) {
    return client.getRole(id);
  }

  @override
  int getId(Role data) {
    return data.id;
  }

  @override
  Future<List<Role>> getList() {
    return client.getRoles();
  }

  @override
  Future<Role> update(Role data) {
    return client.patchRole(data.id, data);
  }
}
