import '../model/models.dart';
import 'base_repository.dart';

class LocationRepository extends BaseRepository<Location, int> {
  @override
  Future<Location> create(Location data) {
    return client.postLocation(data);
  }

  @override
  Future<void> delete(int id) {
    return client.deleteLocation(id);
  }

  @override
  Future<Location> get(int id) {
    return client.getLocation(id);
  }

  @override
  int getId(Location data) {
    return data.id;
  }

  @override
  Future<List<Location>> getList() {
    return client.getLocations();
  }

  @override
  Future<Location> update(Location data) {
    return client.patchLocation(data.id, data);
  }
}
