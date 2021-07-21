import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/models.dart';

part 'messdienerplan_api.g.dart';

@RestApi()
abstract class MessdienerplanApiClient {
  factory MessdienerplanApiClient(Dio dio, {String baseUrl}) =
      _MessdienerplanApiClient;

  /// Acolyte Endpoint

  @GET('/acolytes/')
  Future<List<Acolyte>> getAcolytes();

  @GET('/acolytes/{id}/')
  Future<Acolyte> getAcolyte(@Path() int id);

  @POST('/acolytes/')
  Future<Acolyte> postAcolyte(@Body() Acolyte acolyte);

  @PATCH('/acolytes/{id}/')
  Future<Acolyte> patchAcolyte(@Path() int id, @Body() Acolyte acolyte);

  @PUT('/acolytes/{id}/')
  Future<Acolyte> putAcolyte(@Path() int id, @Body() Acolyte acolyte);

  @DELETE('/acolytes/{id}/')
  Future<void> deleteAcolyte(@Path() int id);

  /// Location Endpoint

  @GET('/locations/')
  Future<List<Location>> getLocations();

  @GET('/locations/{id}/')
  Future<Location> getLocation(@Path() int id);

  @POST('/locations/')
  Future<Location> postLocation(@Body() Location location);

  @PATCH('/locations/{id}/')
  Future<Location> patchLocation(@Path() int id, @Body() Location location);

  @PUT('/locations/{id}/')
  Future<Location> putLocation(@Path() int id, @Body() Location location);

  @DELETE('/locations/{id}/')
  Future<void> deleteLocation(@Path() int id);

  /// Role Endpoint

  @GET('/roles/')
  Future<List<Role>> getRoles();

  @GET('/roles/{id}/')
  Future<Role> getRole(@Path() int id);

  @POST('/roles/')
  Future<Role> postRole(@Body() Role role);

  @PATCH('/roles/{id}/')
  Future<Role> patchRole(@Path() int id, @Body() Role role);

  @PUT('/roles/{id}/')
  Future<Role> putRole(@Path() int id, @Body() Role role);

  @DELETE('/roles/{id}/')
  Future<void> deleteRole(@Path() int id);

  /// Group Endpoint

  @GET('/groups/')
  Future<List<Group>> getGroups();

  @GET('/groups/{id}/')
  Future<Group> getGroup(@Path() int id);

  @POST('/groups/')
  Future<Group> postGroup(@Body() Group group);

  @PATCH('/groups/{id}/')
  Future<Group> patchGroup(@Path() int id, @Body() Group group);

  @PUT('/groups/{id}/')
  Future<Group> putGroup(@Path() int id, @Body() Group group);

  @DELETE('/groups/{id}/')
  Future<void> deleteGroup(@Path() int id);

  /// Group - Classification Endpoint

  @GET('/groups/{groupId}/classifications/')
  Future<List<Classification>> getClassifications(@Path() int groupId);

  @GET('/groups/{groupId}/classifications/{id}/')
  Future<Classification> getClassification(@Path() int groupId, @Path() int id);

  @POST('/groups/{groupId}/classifications/')
  Future<Classification> postClassification(
      @Path() int groupId, @Body() Classification classification);

  @PATCH('/groups/{groupId}/classifications/{id}/')
  Future<Classification> patchClassification(@Path() int groupId,
      @Path() int id, @Body() Classification classification);

  @PUT('/groups/{groupId}/classifications/{id}/')
  Future<Classification> putClassification(@Path() int groupId, @Path() int id,
      @Body() Classification classification);

  @DELETE('/groups/{groupId}/classifications/{id}/')
  Future<void> deleteClassification(@Path() int groupId, @Path() int id);

  /// Plan Endpoint

  @GET('/plans/')
  Future<List<Plan>> getPlans();

  @GET('/plans/{id}/')
  Future<Plan> getPlan(@Path() int id);

  @POST('/plans/')
  Future<Plan> postPlan(@Body() Plan plan);

  @PATCH('/plans/{id}/')
  Future<Plan> patchPlan(@Path() int id, @Body() Plan plan);

  @PUT('/plans/{id}/')
  Future<Plan> putPlan(@Path() int id, @Body() Plan plan);

  @DELETE('/plans/{id}/')
  Future<void> deletePlan(@Path() int id);

  @POST('/plans/{id}/generate/')
  Future<void> generatePlan(@Path() int id);

  @POST('/plans/create_import_plan/')
  Future<Plan> createImportPlan(@Body() Plan plan);

  @POST('/plans/{id}/assign_types/')
  Future<void> assignMassTypes(@Path() int id);

  @POST('/plans/{id}/delete_masses_without_type/')
  Future<void> deleteMassesWithoutType(@Path() int id);

  @GET('/plans/{id}/generate_odf_document/')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> downloadOdfDocument(@Path() int id);

  /// Mass Endpoint

  @GET('/plans/{planId}/masses/')
  Future<List<Mass>> getMasses(@Path() int planId);

  @GET('/plans/{planId}/masses/{id}/')
  Future<Mass> getMass(@Path() int planId, @Path() int id);

  @POST('/plans/{planId}/masses/')
  Future<Mass> postMass(@Path() int planId, @Body() Mass mass);

  @PATCH('/plans/{planId}/masses/{id}/')
  Future<Mass> patchMass(@Path() int planId, @Path() int id, @Body() Mass mass);

  @PUT('/plans/{planId}/masses/{id}/')
  Future<Mass> putMass(@Path() int planId, @Path() int id, @Body() Mass mass);

  @DELETE('/plans/{planId}/masses/{id}/')
  Future<void> deleteMass(@Path() int planId, @Path() int id);

  /// Type Endpoint
  @GET('/types/')
  Future<List<Type>> getTypes();

  @GET('/types/{id}/')
  Future<Type> getType(@Path() int id);

  @POST('/types/')
  Future<Type> postType(@Body() Type type);

  @PATCH('/types/{id}/')
  Future<Type> patchType(@Path() int id, @Body() Type type);

  @PUT('/types/{id}/')
  Future<Type> putType(@Path() int id, @Body() Type type);

  @DELETE('/types/{id}/')
  Future<void> deleteType(@Path() int id);

  /// Type - Rule Endpoint

  @GET('/types/{typeId}/rules/')
  Future<List<Rule>> getRules(@Path() int typeId);

  @GET('/types/{typeId}/rules/{id}/')
  Future<Rule> getRule(@Path() int typeId);

  @POST('/types/{typeId}/rules/')
  Future<Rule> postRule(@Path() int typeId, @Body() Rule rule);

  @PATCH('/types/{typeId}/rules/{id}/')
  Future<Rule> patchRule(@Path() int typeId, @Path() int id, @Body() Rule rule);

  @PUT('/types/{typeId}/rules/{id}/')
  Future<Rule> putRule(@Path() int typeId, @Path() int id, @Body() Rule rule);

  @DELETE('/types/{typeId}/rules/{id}/')
  Future<void> deleteRule(@Path() int typeId, @Path() int id);

  /// Type - Requirement Endpoint

  @GET('/types/{typeId}/requirements/')
  Future<List<Requirement>> getRequirements(@Path() int typeId);

  @GET('/types/{typeId}/requirements/{id}/')
  Future<Requirement> getRequirement(@Path() int typeId, @Path() int id);

  @POST('/types/{typeId}/requirements/')
  Future<Requirement> postRequirement(
      @Path() int typeId, @Body() Requirement requirement);

  @PATCH('/types/{typeId}/requirements/{id}/')
  Future<Requirement> patchRequirement(
      @Path() int typeId, @Path() int id, @Body() Requirement requirement);

  @PUT('/types/{typeId}/requirements/{id}/')
  Future<Requirement> putRequirement(
      @Path() int typeId, @Path() int id, @Body() Requirement requirement);

  @DELETE('/types/{typeId}/requirements/{id}/')
  Future<void> deleteRequirement(@Path() int typeId, @Path() int id);

  /// Mass - Acolyte Endpoint

  @GET('/plans/{planId}/masses/{massId}/acolytes/')
  Future<List<MassAcolyte>> getMassAcolytes(
      @Path() int planId, @Path() int massId);

  @GET('/plans/{planId}/masses/{massId}/acolytes/{id}/')
  Future<MassAcolyte> getMassAcolyte(
      @Path() int planId, @Path() int massId, @Path() int id);

  @POST('/plans/{planId}/masses/{massId}/acolytes/')
  Future<MassAcolyte> postMassAcolyte(
      @Path() int planId, @Path() int massId, @Body() MassAcolyte massAcolyte);

  @PATCH('/plans/{planId}/masses/{massId}/acolytes/{id}/')
  Future<MassAcolyte> patchMassAcolyte(@Path() int planId, @Path() int massId,
      @Path() int id, @Body() MassAcolyte massAcolyte);

  @PUT('/plans/{planId}/masses/{massId}/acolytes/{id}/')
  Future<MassAcolyte> putMassAcolyte(@Path() int planId, @Path() int massId,
      @Path() int id, @Body() MassAcolyte massAcolyte);

  @DELETE('/plans/{planId}/masses/{massId}/acolytes/{id}/')
  Future<void> deleteMassAcolyte(
      @Path() int planId, @Path() int massId, @Path() int id);

  /// Acolyte - Mass Endpoint

  @GET('/acolytes/{acolyteId}/masses/')
  Future<List<AcolyteMass>> getAcolyteMasses(@Path() int acolyteId);

  @GET('/acolytes/{acolyteId}/masses/{id}/')
  Future<AcolyteMass> getAcolyteMass(@Path() int acolyteId, @Path() int id);

  /// Auth - Endpoint

  @POST('/auth/login/')
  Future<Token> loginUser(@Body() LoginModel model);

  @POST('/auth/logout/')
  Future<void> logoutUser();

  @POST('/auth/password/change/')
  Future<void> changePassword(@Body() PasswordChangeModel model);

  @GET('/auth/user/')
  Future<User> getUser();
}
