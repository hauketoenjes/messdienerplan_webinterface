import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

enum DayOfWeek { mon, tue, wed, thu, fri, sat, sun }

@JsonSerializable()
class Location {
  int? id;
  String locationName;

  Location({
    this.id,
    required this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Role {
  int? id;
  String roleName;

  Role({
    this.id,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Group {
  int? id;
  String groupName;
  List<Classification> classifications;

  Group({
    this.id,
    required this.groupName,
    required this.classifications,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable()
class Classification {
  int? id;
  int ageFrom;
  int ageTo;

  Classification({
    this.id,
    required this.ageFrom,
    required this.ageTo,
  });

  factory Classification.fromJson(Map<String, dynamic> json) =>
      _$ClassificationFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationToJson(this);
}

@JsonSerializable()
class Type {
  int? id;
  String typeName;

  List<Requirement> requirements;
  List<Rule> rules;

  Type({
    this.id,
    required this.typeName,
    this.requirements = const [],
    this.rules = const [],
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Requirement {
  int? id;
  int quantity;
  int role;
  List<int> classifications;

  Requirement({
    this.id,
    required this.quantity,
    required this.role,
    this.classifications = const [],
  });

  factory Requirement.fromJson(Map<String, dynamic> json) =>
      _$RequirementFromJson(json);

  Map<String, dynamic> toJson() => _$RequirementToJson(this);
}

@JsonSerializable()
class Rule {
  int? id;
  int location;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime time;

  DayOfWeek dayOfWeek;

  Rule({
    this.id,
    required this.location,
    required this.time,
    required this.dayOfWeek,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);

  static final _dateFormatter = DateFormat('HH:mm:ss');

  static DateTime _fromJson(String date) => _dateFormatter.parse(date);

  static String _toJson(DateTime date) => _dateFormatter.format(date);
}

@JsonSerializable()
class Acolyte {
  int? id;
  String firstName;
  String lastName;
  String extra;
  bool inactive;
  int? group;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime birthday;

  Acolyte({
    this.id,
    required this.firstName,
    required this.lastName,
    this.extra = '',
    required this.birthday,
    this.group,
    this.inactive = false,
  });

  factory Acolyte.fromJson(Map<String, dynamic> json) =>
      _$AcolyteFromJson(json);

  Map<String, dynamic> toJson() => _$AcolyteToJson(this);

  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  static DateTime _fromJson(String date) => _dateFormatter.parse(date);

  static String _toJson(DateTime date) => _dateFormatter.format(date);
}

@JsonSerializable()
class Mass {
  int? id;
  DateTime time;
  String extra;
  int? location;
  int? type;
  bool canceled;

  Mass({
    this.id,
    required this.time,
    this.extra = '',
    this.location,
    this.type,
    this.canceled = false,
  });

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);

  Map<String, dynamic> toJson() => _$MassToJson(this);
}

@JsonSerializable()
class MassAcolyte {
  int? id;
  int acolyte;
  int? role;

  MassAcolyte({
    this.id,
    required this.acolyte,
    this.role,
  });

  factory MassAcolyte.fromJson(Map<String, dynamic> json) =>
      _$MassAcolyteFromJson(json);

  Map<String, dynamic> toJson() => _$MassAcolyteToJson(this);
}

@JsonSerializable()
class AcolyteMass {
  int? id;
  int mass;
  int? role;

  AcolyteMass({
    this.id,
    required this.mass,
    this.role,
  });

  factory AcolyteMass.fromJson(Map<String, dynamic> json) =>
      _$AcolyteMassFromJson(json);

  Map<String, dynamic> toJson() => _$AcolyteMassToJson(this);
}

@JsonSerializable()
class LoginModel {
  String username;
  String? email;
  String password;

  LoginModel({
    required this.username,
    this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class PasswordChangeModel {
  // ignore: non_constant_identifier_names
  String old_password;
  // ignore: non_constant_identifier_names
  String new_password1;
  // ignore: non_constant_identifier_names
  String new_password2;

  PasswordChangeModel(
      // ignore: non_constant_identifier_names
      {required this.old_password,
      // ignore: non_constant_identifier_names
      required this.new_password1,
      // ignore: non_constant_identifier_names
      required this.new_password2});

  factory PasswordChangeModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordChangeModelToJson(this);
}

@JsonSerializable()
class User {
  int? pk;
  String username;
  String? email;
  // ignore: non_constant_identifier_names
  String? first_name;
  // ignore: non_constant_identifier_names
  String? last_name;

  User({
    this.pk,
    required this.username,
    this.email,
    // ignore: non_constant_identifier_names
    this.first_name,
    // ignore: non_constant_identifier_names
    this.last_name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Token {
  String key;

  Token({
    required this.key,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class Plan {
  int? id;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateFrom;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateTo;
  bool public;

  Plan({
    this.id,
    required this.dateFrom,
    required this.dateTo,
    this.public = false,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  static DateTime _fromJson(String date) => _dateFormatter.parse(date);

  static String _toJson(DateTime date) => _dateFormatter.format(date);
}
