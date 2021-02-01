// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messdiener_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MessdienerApiClient implements MessdienerApiClient {
  _MessdienerApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Acolyte>> getAcolytes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/acolytes/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Acolyte.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Acolyte> getAcolyte(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Acolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<Acolyte> postAcolyte(acolyte) async {
    ArgumentError.checkNotNull(acolyte, 'acolyte');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(acolyte?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/acolytes/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Acolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<Acolyte> patchAcolyte(id, acolyte) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(acolyte, 'acolyte');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(acolyte?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Acolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<Acolyte> putAcolyte(id, acolyte) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(acolyte, 'acolyte');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(acolyte?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Acolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteAcolyte(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Location>> getLocations() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/locations/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Location.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Location> getLocation(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/locations/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Location.fromJson(_result.data);
    return value;
  }

  @override
  Future<Location> postLocation(location) async {
    ArgumentError.checkNotNull(location, 'location');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(location?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/locations/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Location.fromJson(_result.data);
    return value;
  }

  @override
  Future<Location> patchLocation(id, location) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(location, 'location');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(location?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/locations/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Location.fromJson(_result.data);
    return value;
  }

  @override
  Future<Location> putLocation(id, location) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(location, 'location');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(location?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/locations/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Location.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteLocation(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/locations/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Role>> getRoles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/roles/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Role.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Role> getRole(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/roles/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Role.fromJson(_result.data);
    return value;
  }

  @override
  Future<Role> postRole(role) async {
    ArgumentError.checkNotNull(role, 'role');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(role?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/roles/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Role.fromJson(_result.data);
    return value;
  }

  @override
  Future<Role> patchRole(id, role) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(role, 'role');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(role?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/roles/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Role.fromJson(_result.data);
    return value;
  }

  @override
  Future<Role> putRole(id, role) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(role, 'role');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(role?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/roles/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Role.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteRole(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/roles/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Group>> getGroups() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/groups/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Group.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Group> getGroup(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/groups/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Group.fromJson(_result.data);
    return value;
  }

  @override
  Future<Group> postGroup(group) async {
    ArgumentError.checkNotNull(group, 'group');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(group?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/groups/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Group.fromJson(_result.data);
    return value;
  }

  @override
  Future<Group> patchGroup(id, group) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(group, 'group');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(group?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/groups/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Group.fromJson(_result.data);
    return value;
  }

  @override
  Future<Group> putGroup(id, group) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(group, 'group');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(group?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/groups/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Group.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteGroup(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/groups/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Classification>> getClassifications(groupId) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/groups/$groupId/classifications/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Classification.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Classification> getClassification(groupId, id) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/groups/$groupId/classifications/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Classification.fromJson(_result.data);
    return value;
  }

  @override
  Future<Classification> postClassification(groupId, classification) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(classification, 'classification');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(classification?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/groups/$groupId/classifications/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Classification.fromJson(_result.data);
    return value;
  }

  @override
  Future<Classification> patchClassification(
      groupId, id, classification) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(classification, 'classification');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(classification?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/groups/$groupId/classifications/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Classification.fromJson(_result.data);
    return value;
  }

  @override
  Future<Classification> putClassification(groupId, id, classification) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(classification, 'classification');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(classification?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/groups/$groupId/classifications/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Classification.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteClassification(groupId, id) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/groups/$groupId/classifications/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Plan>> getPlans() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/plans/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Plan.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Plan> getPlan(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/plans/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Plan.fromJson(_result.data);
    return value;
  }

  @override
  Future<Plan> postPlan(plan) async {
    ArgumentError.checkNotNull(plan, 'plan');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(plan?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/plans/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Plan.fromJson(_result.data);
    return value;
  }

  @override
  Future<Plan> patchPlan(id, plan) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(plan, 'plan');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(plan?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/plans/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Plan.fromJson(_result.data);
    return value;
  }

  @override
  Future<Plan> putPlan(id, plan) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(plan, 'plan');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(plan?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/plans/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Plan.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deletePlan(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/plans/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<void> generatePlan(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/plans/$id/generate/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<Plan> createImportPlan(plan) async {
    ArgumentError.checkNotNull(plan, 'plan');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(plan?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/create_import_plan/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Plan.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> assignMassTypes(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/plans/$id/assign_types/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<void> deleteMassesWithoutType(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/plans/$id/delete_masses_without_type/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Mass>> getMasses(planId) async {
    ArgumentError.checkNotNull(planId, 'planId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/plans/$planId/masses/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Mass.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Mass> getMass(planId, id) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Mass.fromJson(_result.data);
    return value;
  }

  @override
  Future<Mass> postMass(planId, mass) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(mass, 'mass');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(mass?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Mass.fromJson(_result.data);
    return value;
  }

  @override
  Future<Mass> patchMass(planId, id, mass) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(mass, 'mass');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(mass?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Mass.fromJson(_result.data);
    return value;
  }

  @override
  Future<Mass> putMass(planId, id, mass) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(mass, 'mass');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(mass?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Mass.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteMass(planId, id) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/plans/$planId/masses/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Type>> getTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/types/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Type.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Type> getType(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/types/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Type.fromJson(_result.data);
    return value;
  }

  @override
  Future<Type> postType(type) async {
    ArgumentError.checkNotNull(type, 'type');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(type?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/types/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Type.fromJson(_result.data);
    return value;
  }

  @override
  Future<Type> patchType(id, type) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(type, 'type');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(type?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/types/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Type.fromJson(_result.data);
    return value;
  }

  @override
  Future<Type> putType(id, type) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(type, 'type');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(type?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/types/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Type.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteType(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/types/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Rule>> getRules(typeId) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/types/$typeId/rules/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Rule.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Rule> getRule(typeId) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/rules/{id}/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Rule.fromJson(_result.data);
    return value;
  }

  @override
  Future<Rule> postRule(typeId, rule) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(rule, 'rule');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(rule?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/rules/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Rule.fromJson(_result.data);
    return value;
  }

  @override
  Future<Rule> patchRule(typeId, id, rule) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(rule, 'rule');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(rule?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/rules/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Rule.fromJson(_result.data);
    return value;
  }

  @override
  Future<Rule> putRule(typeId, id, rule) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(rule, 'rule');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(rule?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/rules/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Rule.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteRule(typeId, id) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/types/$typeId/rules/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<Requirement>> getRequirements(typeId) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/types/$typeId/requirements/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Requirement.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Requirement> getRequirement(typeId, id) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/requirements/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Requirement.fromJson(_result.data);
    return value;
  }

  @override
  Future<Requirement> postRequirement(typeId, requirement) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(requirement, 'requirement');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requirement?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/requirements/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Requirement.fromJson(_result.data);
    return value;
  }

  @override
  Future<Requirement> patchRequirement(typeId, id, requirement) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(requirement, 'requirement');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requirement?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/requirements/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Requirement.fromJson(_result.data);
    return value;
  }

  @override
  Future<Requirement> putRequirement(typeId, id, requirement) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(requirement, 'requirement');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requirement?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/types/$typeId/requirements/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Requirement.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteRequirement(typeId, id) async {
    ArgumentError.checkNotNull(typeId, 'typeId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/types/$typeId/requirements/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<MassAcolyte>> getMassAcolytes(planId, massId) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(massId, 'massId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/plans/$planId/masses/$massId/acolytes/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => MassAcolyte.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MassAcolyte> getMassAcolyte(planId, massId, id) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(massId, 'massId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$massId/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MassAcolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<MassAcolyte> postMassAcolyte(planId, massId, massAcolyte) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(massId, 'massId');
    ArgumentError.checkNotNull(massAcolyte, 'massAcolyte');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(massAcolyte?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$massId/acolytes/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MassAcolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<MassAcolyte> patchMassAcolyte(planId, massId, id, massAcolyte) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(massId, 'massId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(massAcolyte, 'massAcolyte');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(massAcolyte?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$massId/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MassAcolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<MassAcolyte> putMassAcolyte(planId, massId, id, massAcolyte) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(massId, 'massId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(massAcolyte, 'massAcolyte');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(massAcolyte?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/plans/$planId/masses/$massId/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MassAcolyte.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteMassAcolyte(planId, massId, id) async {
    ArgumentError.checkNotNull(planId, 'planId');
    ArgumentError.checkNotNull(massId, 'massId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/plans/$planId/masses/$massId/acolytes/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<List<AcolyteMass>> getAcolyteMasses(acolyteId) async {
    ArgumentError.checkNotNull(acolyteId, 'acolyteId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/acolytes/$acolyteId/masses/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => AcolyteMass.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<AcolyteMass> getAcolyteMass(acolyteId, id) async {
    ArgumentError.checkNotNull(acolyteId, 'acolyteId');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/acolytes/$acolyteId/masses/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AcolyteMass.fromJson(_result.data);
    return value;
  }

  @override
  Future<Token> loginUser(model) async {
    ArgumentError.checkNotNull(model, 'model');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(model?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/auth/login/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Token.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> logoutUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/auth/logout/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<void> changePassword(model) async {
    ArgumentError.checkNotNull(model, 'model');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(model?.toJson() ?? <String, dynamic>{});
    await _dio.request<void>('/auth/password/change/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<User> getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/auth/user/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }
}
