import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/update.dart';

class LocationRepository
    with
        ApiClient,
        ReadAll<Location>,
        Create<Location>,
        Delete<Location>,
        Update<Location>,
        Read<Location, int> {
  @override
  Future<List<Location>> readAllCall() {
    return apiClient.getLocations();
  }

  @override
  Future<Location> createCall(Location data) {
    return apiClient.postLocation(data);
  }

  @override
  Future<void> deleteCall(Location data) {
    return apiClient.deleteLocation(data.id!);
  }

  @override
  Future<Location> readCall(int id) {
    return apiClient.getLocation(id);
  }

  @override
  Future<Location> updateCall(Location data) {
    return apiClient.patchLocation(data.id!, data);
  }
}
