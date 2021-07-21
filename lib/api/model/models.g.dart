// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    id: json['id'] as int?,
    locationName: json['locationName'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'locationName': instance.locationName,
    };

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    id: json['id'] as int?,
    roleName: json['roleName'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'roleName': instance.roleName,
    };

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['id'] as int?,
    groupName: json['groupName'] as String,
    classifications: (json['classifications'] as List<dynamic>)
        .map((e) => Classification.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'classifications': instance.classifications,
    };

Classification _$ClassificationFromJson(Map<String, dynamic> json) {
  return Classification(
    id: json['id'] as int?,
    ageFrom: json['ageFrom'] as int,
    ageTo: json['ageTo'] as int,
  );
}

Map<String, dynamic> _$ClassificationToJson(Classification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
    };

Type _$TypeFromJson(Map<String, dynamic> json) {
  return Type(
    id: json['id'] as int?,
    typeName: json['typeName'] as String,
    requirements: (json['requirements'] as List<dynamic>)
        .map((e) => Requirement.fromJson(e as Map<String, dynamic>))
        .toList(),
    rules: (json['rules'] as List<dynamic>)
        .map((e) => Rule.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'typeName': instance.typeName,
      'requirements': instance.requirements,
      'rules': instance.rules,
    };

Requirement _$RequirementFromJson(Map<String, dynamic> json) {
  return Requirement(
    id: json['id'] as int?,
    quantity: json['quantity'] as int,
    role: json['role'] as int,
    classifications: (json['classifications'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
  );
}

Map<String, dynamic> _$RequirementToJson(Requirement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'role': instance.role,
      'classifications': instance.classifications,
    };

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    id: json['id'] as int?,
    location: json['location'] as int,
    time: Rule._fromJson(json['time'] as String),
    dayOfWeek: _$enumDecode(_$DayOfWeekEnumMap, json['dayOfWeek']),
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'time': Rule._toJson(instance.time),
      'dayOfWeek': _$DayOfWeekEnumMap[instance.dayOfWeek],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$DayOfWeekEnumMap = {
  DayOfWeek.mon: 'mon',
  DayOfWeek.tue: 'tue',
  DayOfWeek.wed: 'wed',
  DayOfWeek.thu: 'thu',
  DayOfWeek.fri: 'fri',
  DayOfWeek.sat: 'sat',
  DayOfWeek.sun: 'sun',
};

Acolyte _$AcolyteFromJson(Map<String, dynamic> json) {
  return Acolyte(
    id: json['id'] as int?,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    extra: json['extra'] as String,
    birthday: Acolyte._fromJson(json['birthday'] as String),
    group: json['group'] as int?,
    inactive: json['inactive'] as bool,
  );
}

Map<String, dynamic> _$AcolyteToJson(Acolyte instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'extra': instance.extra,
      'inactive': instance.inactive,
      'group': instance.group,
      'birthday': Acolyte._toJson(instance.birthday),
    };

Mass _$MassFromJson(Map<String, dynamic> json) {
  return Mass(
    id: json['id'] as int?,
    time: DateTime.parse(json['time'] as String),
    extra: json['extra'] as String,
    location: json['location'] as int?,
    type: json['type'] as int?,
    canceled: json['canceled'] as bool,
  );
}

Map<String, dynamic> _$MassToJson(Mass instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'extra': instance.extra,
      'location': instance.location,
      'type': instance.type,
      'canceled': instance.canceled,
    };

MassAcolyte _$MassAcolyteFromJson(Map<String, dynamic> json) {
  return MassAcolyte(
    id: json['id'] as int?,
    acolyte: json['acolyte'] as int,
    role: json['role'] as int?,
  );
}

Map<String, dynamic> _$MassAcolyteToJson(MassAcolyte instance) =>
    <String, dynamic>{
      'id': instance.id,
      'acolyte': instance.acolyte,
      'role': instance.role,
    };

AcolyteMass _$AcolyteMassFromJson(Map<String, dynamic> json) {
  return AcolyteMass(
    id: json['id'] as int?,
    mass: json['mass'] as int,
    role: json['role'] as int?,
  );
}

Map<String, dynamic> _$AcolyteMassToJson(AcolyteMass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mass': instance.mass,
      'role': instance.role,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    username: json['username'] as String,
    email: json['email'] as String?,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };

PasswordChangeModel _$PasswordChangeModelFromJson(Map<String, dynamic> json) {
  return PasswordChangeModel(
    old_password: json['old_password'] as String,
    new_password1: json['new_password1'] as String,
    new_password2: json['new_password2'] as String,
  );
}

Map<String, dynamic> _$PasswordChangeModelToJson(
        PasswordChangeModel instance) =>
    <String, dynamic>{
      'old_password': instance.old_password,
      'new_password1': instance.new_password1,
      'new_password2': instance.new_password2,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    pk: json['pk'] as int?,
    username: json['username'] as String,
    email: json['email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'pk': instance.pk,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    key: json['key'] as String,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'key': instance.key,
    };

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return Plan(
    id: json['id'] as int?,
    dateFrom: Plan._fromJson(json['dateFrom'] as String),
    dateTo: Plan._fromJson(json['dateTo'] as String),
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'dateFrom': Plan._toJson(instance.dateFrom),
      'dateTo': Plan._toJson(instance.dateTo),
      'public': instance.public,
    };
