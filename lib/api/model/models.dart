import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

enum DayOfWeek { mon, tue, wed, thu, fri, sat, sun }

@JsonSerializable()
class Location {
  int id;
  String locationName;

  Location({
    this.id,
    this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Role {
  int id;
  String roleName;

  Role({this.id, this.roleName});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Group {
  int id;
  String groupName;
  List<Classification> classifications;

  Group({this.id, this.groupName, this.classifications});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable()
class Classification {
  int id;
  int ageFrom;
  int ageTo;

  Classification({this.id, this.ageFrom, this.ageTo});

  factory Classification.fromJson(Map<String, dynamic> json) =>
      _$ClassificationFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationToJson(this);
}

@JsonSerializable()
class Type {
  int id;
  String typeName;

  List<Requirement> requirements;
  List<Rule> rules;

  Type({this.id, this.typeName});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Requirement {
  int id;
  int quantity;
  int role;
  List<int> classifications;

  Requirement({this.id, this.quantity, this.role, this.classifications});

  factory Requirement.fromJson(Map<String, dynamic> json) =>
      _$RequirementFromJson(json);

  Map<String, dynamic> toJson() => _$RequirementToJson(this);
}

@JsonSerializable()
class Rule {
  int id;
  int location;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime time;

  DayOfWeek dayOfWeek;

  Rule({this.id, this.location, this.time, this.dayOfWeek});

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);

  static final _dateFormatter = DateFormat('HH:mm:ss');

  static DateTime _fromJson(String date) => _dateFormatter.parse(date);

  static String _toJson(DateTime date) => _dateFormatter.format(date);
}

@JsonSerializable()
class Acolyte {
  int id;
  String firstName;
  String lastName;
  String extra;
  bool inactive;
  int group;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime birthday;

  Acolyte(
      {this.id,
      this.firstName,
      this.lastName,
      this.extra,
      this.birthday,
      this.group,
      this.inactive});

  factory Acolyte.fromJson(Map<String, dynamic> json) =>
      _$AcolyteFromJson(json);

  Map<String, dynamic> toJson() => _$AcolyteToJson(this);

  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  static DateTime _fromJson(String date) => _dateFormatter.parse(date);

  static String _toJson(DateTime date) => _dateFormatter.format(date);
}

@JsonSerializable()
class Mass {
  int id;
  DateTime time;
  String extra;
  int location;
  int type;

  Mass({this.id, this.time, this.extra, this.location, this.type});

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);

  Map<String, dynamic> toJson() => _$MassToJson(this);
}

@JsonSerializable()
class MassAcolyte {
  int id;
  int acolyte;
  int role;

  MassAcolyte({this.id, this.acolyte, this.role});

  factory MassAcolyte.fromJson(Map<String, dynamic> json) =>
      _$MassAcolyteFromJson(json);

  Map<String, dynamic> toJson() => _$MassAcolyteToJson(this);
}

@JsonSerializable()
class AcolyteMass {
  int id;
  int mass;
  int role;

  AcolyteMass({this.mass, this.id, this.role});

  factory AcolyteMass.fromJson(Map<String, dynamic> json) =>
      _$AcolyteMassFromJson(json);

  Map<String, dynamic> toJson() => _$AcolyteMassToJson(this);
}

@JsonSerializable()
class LoginModel {
  String username;
  String email;
  String password;

  LoginModel({this.username, this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class PasswordChangeModel {
  String old_password;
  String new_password1;
  String new_password2;

  PasswordChangeModel(
      {this.old_password, this.new_password1, this.new_password2});

  factory PasswordChangeModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordChangeModelToJson(this);
}

@JsonSerializable()
class User {
  int pk;
  String username;
  String email;
  String first_name;
  String last_name;

  User({this.pk, this.username, this.email, this.first_name, this.last_name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Token {
  String key;

  Token({this.key});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class Plan {
  int id;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateFrom;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateTo;
  bool public;

  Plan({this.id, this.dateFrom, this.dateTo, this.public});

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  static DateTime _fromJson(String date) => _dateFormatter.parse(date);

  static String _toJson(DateTime date) => _dateFormatter.format(date);
}
