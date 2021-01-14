import '../model/models.dart';
import 'base_repository.dart';

class LocationRepository extends BaseRepository<Location> {
  @override
  Future<Location> alterData(Location data) async {
    return await client.patchLocation(data.id, data);
  }

  @override
  Future<void> deleteData(Location data) async {
    return await client.deleteLocation(data.id);
  }

  @override
  Future<List<Location>> getModelList() async {
    return await client.getLocations();
  }

  @override
  Future<Location> insertData(Location data) async {
    return await client.postLocation(data);
  }

  @override
  int getDataId(Location data) {
    return data.id;
  }
}
