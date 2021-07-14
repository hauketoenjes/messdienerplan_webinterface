import '../model/models.dart';
import 'acolyte_mass_repository.dart';
import 'base_repository.dart';

class AcolyteRepository extends BaseRepository<Acolyte, int> {
  Map<int, AcolyteMassRepository> acolyteMasses = {};

  @override
  Future<Acolyte> create(Acolyte data) async {
    var createdData = await client.postAcolyte(data);
    if (!acolyteMasses.containsKey(createdData.id)) {
      acolyteMasses[createdData.id] = AcolyteMassRepository(createdData.id);
    }
    return createdData;
  }

  @override
  Future<void> delete(int id) async {
    await client.deleteAcolyte(id);
    acolyteMasses.remove(id);
  }

  @override
  Future<Acolyte> get(int id) async {
    var data = await client.getAcolyte(id);
    if (!acolyteMasses.containsKey(data.id)) {
      acolyteMasses[data.id] = AcolyteMassRepository(data.id);
    }
    return data;
  }

  @override
  int getId(Acolyte data) {
    return data.id;
  }

  @override
  Future<List<Acolyte>> getList() async {
    var list = await client.getAcolytes();
    list.forEach(
      (element) {
        if (!acolyteMasses.containsKey(element.id)) {
          acolyteMasses[element.id] = AcolyteMassRepository(element.id);
        }
      },
    );
    list.sort((a1, a2) => '${a1.firstName} ${a1.lastName}'
        .compareTo('${a2.firstName} ${a2.lastName}'));
    return list;
  }

  @override
  Future<Acolyte> update(Acolyte data) {
    return client.patchAcolyte(data.id, data);
  }
}
