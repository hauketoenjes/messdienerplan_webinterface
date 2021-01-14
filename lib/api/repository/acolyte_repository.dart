import '../model/models.dart';
import 'acolyte_mass_repository.dart';
import 'base_repository.dart';

class AcolyteRepository extends BaseRepository<Acolyte> {
  Map<int, AcolyteMassRepository> acolyteMasses = {};

  @override
  Future<Acolyte> alterData(Acolyte data) async {
    return await client.patchAcolyte(data.id, data);
  }

  @override
  Future<void> deleteData(Acolyte data) async {
    return await client.deleteAcolyte(data.id);
  }

  @override
  Future<List<Acolyte>> getModelList() async {
    var acolytes = await client.getAcolytes();

    for (var a in acolytes) {
      acolyteMasses[a.id] = AcolyteMassRepository(a.id);
    }

    return acolytes;
  }

  @override
  Future<Acolyte> insertData(Acolyte data) async {
    return await client.postAcolyte(data);
  }

  @override
  int getDataId(Acolyte data) {
    return data.id;
  }
}
