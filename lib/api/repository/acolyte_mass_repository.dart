import '../model/models.dart';
import 'base_repository.dart';

class AcolyteMassRepository extends BaseRepository<AcolyteMass, int> {
  final int acolyteId;

  AcolyteMassRepository(this.acolyteId);

  @override
  Future<AcolyteMass> create(AcolyteMass data) {
    throw UnsupportedError('Cannot create AcolyteMass');
  }

  @override
  Future<void> delete(int id) {
    throw UnsupportedError('Cannot delete AcolyteMass');
  }

  @override
  Future<AcolyteMass> get(int id) {
    return client.getAcolyteMass(acolyteId, id);
  }

  @override
  int getId(AcolyteMass data) {
    return data.id;
  }

  @override
  Future<List<AcolyteMass>> getList() {
    return client.getAcolyteMasses(acolyteId);
  }

  @override
  Future<AcolyteMass> update(AcolyteMass data) {
    throw UnsupportedError('Cannot edit AcolyteMass');
  }
}
