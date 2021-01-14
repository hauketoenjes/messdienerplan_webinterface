import '../model/models.dart';
import 'base_repository.dart';

class AcolyteMassRepository extends BaseRepository<AcolyteMass> {
  final int acolyteId;

  AcolyteMassRepository(this.acolyteId);

  @override
  Future<AcolyteMass> alterData(AcolyteMass data) async {
    return null;
  }

  @override
  Future<void> deleteData(AcolyteMass data) {
    return null;
  }

  @override
  Future<List<AcolyteMass>> getModelList() async {
    return await client.getAcolyteMasses(acolyteId);
  }

  @override
  Future<AcolyteMass> insertData(AcolyteMass data) {
    return null;
  }

  @override
  int getDataId(AcolyteMass data) {
    return data.id;
  }
}
