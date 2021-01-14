import '../model/models.dart';
import 'base_repository.dart';

class RoleRepository extends BaseRepository<Role> {
  @override
  Future<Role> alterData(Role data) async {
    return await client.patchRole(data.id, data);
  }

  @override
  Future<void> deleteData(Role data) async {
    return await client.deleteRole(data.id);
  }

  @override
  Future<List<Role>> getModelList() async {
    return await client.getRoles();
  }

  @override
  Future<Role> insertData(Role data) async {
    return await client.postRole(data);
  }

  @override
  int getDataId(Role data) {
    return data.id;
  }
}
