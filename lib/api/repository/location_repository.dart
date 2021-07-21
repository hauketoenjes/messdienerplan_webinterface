import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/create.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/delete.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/read_all.dart';
import 'package:messdienerplan_webinterface/api/repository/mixins/repository.dart';

class LocationRepository
    with ApiClient, ReadAll<Location>, Create<Location>, Delete<Location> {
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
}
