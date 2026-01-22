// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SchoolAdminsTable extends SchoolAdmins
    with TableInfo<$SchoolAdminsTable, SchoolAdmin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolAdminsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<String> schoolId = GeneratedColumn<String>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
    'dob',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthPlaceMeta = const VerificationMeta(
    'birthPlace',
  );
  @override
  late final GeneratedColumn<String> birthPlace = GeneratedColumn<String>(
    'birth_place',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nikMeta = const VerificationMeta('nik');
  @override
  late final GeneratedColumn<String> nik = GeneratedColumn<String>(
    'nik',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolLevelAccessMeta = const VerificationMeta(
    'schoolLevelAccess',
  );
  @override
  late final GeneratedColumn<String> schoolLevelAccess =
      GeneratedColumn<String>(
        'school_level_access',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    schoolId,
    dob,
    birthPlace,
    nik,
    status,
    userId,
    fullName,
    email,
    gender,
    imageUrl,
    schoolLevelAccess,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_admins';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchoolAdmin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
        _dobMeta,
        dob.isAcceptableOrUnknown(data['dob']!, _dobMeta),
      );
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    if (data.containsKey('birth_place')) {
      context.handle(
        _birthPlaceMeta,
        birthPlace.isAcceptableOrUnknown(data['birth_place']!, _birthPlaceMeta),
      );
    } else if (isInserting) {
      context.missing(_birthPlaceMeta);
    }
    if (data.containsKey('nik')) {
      context.handle(
        _nikMeta,
        nik.isAcceptableOrUnknown(data['nik']!, _nikMeta),
      );
    } else if (isInserting) {
      context.missing(_nikMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('school_level_access')) {
      context.handle(
        _schoolLevelAccessMeta,
        schoolLevelAccess.isAcceptableOrUnknown(
          data['school_level_access']!,
          _schoolLevelAccessMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schoolLevelAccessMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchoolAdmin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolAdmin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
      )!,
      dob: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}dob'],
      )!,
      birthPlace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_place'],
      )!,
      nik: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nik'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      schoolLevelAccess: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_level_access'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SchoolAdminsTable createAlias(String alias) {
    return $SchoolAdminsTable(attachedDatabase, alias);
  }
}

class SchoolAdmin extends DataClass implements Insertable<SchoolAdmin> {
  final String id;
  final String schoolId;
  final DateTime dob;
  final String birthPlace;
  final String nik;
  final String status;
  final String userId;
  final String fullName;
  final String email;
  final String gender;
  final String imageUrl;
  final String schoolLevelAccess;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SchoolAdmin({
    required this.id,
    required this.schoolId,
    required this.dob,
    required this.birthPlace,
    required this.nik,
    required this.status,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.imageUrl,
    required this.schoolLevelAccess,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['school_id'] = Variable<String>(schoolId);
    map['dob'] = Variable<DateTime>(dob);
    map['birth_place'] = Variable<String>(birthPlace);
    map['nik'] = Variable<String>(nik);
    map['status'] = Variable<String>(status);
    map['user_id'] = Variable<String>(userId);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    map['image_url'] = Variable<String>(imageUrl);
    map['school_level_access'] = Variable<String>(schoolLevelAccess);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SchoolAdminsCompanion toCompanion(bool nullToAbsent) {
    return SchoolAdminsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      dob: Value(dob),
      birthPlace: Value(birthPlace),
      nik: Value(nik),
      status: Value(status),
      userId: Value(userId),
      fullName: Value(fullName),
      email: Value(email),
      gender: Value(gender),
      imageUrl: Value(imageUrl),
      schoolLevelAccess: Value(schoolLevelAccess),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SchoolAdmin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolAdmin(
      id: serializer.fromJson<String>(json['id']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
      dob: serializer.fromJson<DateTime>(json['dob']),
      birthPlace: serializer.fromJson<String>(json['birthPlace']),
      nik: serializer.fromJson<String>(json['nik']),
      status: serializer.fromJson<String>(json['status']),
      userId: serializer.fromJson<String>(json['userId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      schoolLevelAccess: serializer.fromJson<String>(json['schoolLevelAccess']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'schoolId': serializer.toJson<String>(schoolId),
      'dob': serializer.toJson<DateTime>(dob),
      'birthPlace': serializer.toJson<String>(birthPlace),
      'nik': serializer.toJson<String>(nik),
      'status': serializer.toJson<String>(status),
      'userId': serializer.toJson<String>(userId),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'schoolLevelAccess': serializer.toJson<String>(schoolLevelAccess),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SchoolAdmin copyWith({
    String? id,
    String? schoolId,
    DateTime? dob,
    String? birthPlace,
    String? nik,
    String? status,
    String? userId,
    String? fullName,
    String? email,
    String? gender,
    String? imageUrl,
    String? schoolLevelAccess,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SchoolAdmin(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    dob: dob ?? this.dob,
    birthPlace: birthPlace ?? this.birthPlace,
    nik: nik ?? this.nik,
    status: status ?? this.status,
    userId: userId ?? this.userId,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    gender: gender ?? this.gender,
    imageUrl: imageUrl ?? this.imageUrl,
    schoolLevelAccess: schoolLevelAccess ?? this.schoolLevelAccess,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SchoolAdmin copyWithCompanion(SchoolAdminsCompanion data) {
    return SchoolAdmin(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      dob: data.dob.present ? data.dob.value : this.dob,
      birthPlace: data.birthPlace.present
          ? data.birthPlace.value
          : this.birthPlace,
      nik: data.nik.present ? data.nik.value : this.nik,
      status: data.status.present ? data.status.value : this.status,
      userId: data.userId.present ? data.userId.value : this.userId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      schoolLevelAccess: data.schoolLevelAccess.present
          ? data.schoolLevelAccess.value
          : this.schoolLevelAccess,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchoolAdmin(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('dob: $dob, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('nik: $nik, ')
          ..write('status: $status, ')
          ..write('userId: $userId, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('schoolLevelAccess: $schoolLevelAccess, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    schoolId,
    dob,
    birthPlace,
    nik,
    status,
    userId,
    fullName,
    email,
    gender,
    imageUrl,
    schoolLevelAccess,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolAdmin &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.dob == this.dob &&
          other.birthPlace == this.birthPlace &&
          other.nik == this.nik &&
          other.status == this.status &&
          other.userId == this.userId &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.imageUrl == this.imageUrl &&
          other.schoolLevelAccess == this.schoolLevelAccess &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SchoolAdminsCompanion extends UpdateCompanion<SchoolAdmin> {
  final Value<String> id;
  final Value<String> schoolId;
  final Value<DateTime> dob;
  final Value<String> birthPlace;
  final Value<String> nik;
  final Value<String> status;
  final Value<String> userId;
  final Value<String> fullName;
  final Value<String> email;
  final Value<String> gender;
  final Value<String> imageUrl;
  final Value<String> schoolLevelAccess;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SchoolAdminsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.dob = const Value.absent(),
    this.birthPlace = const Value.absent(),
    this.nik = const Value.absent(),
    this.status = const Value.absent(),
    this.userId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.schoolLevelAccess = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchoolAdminsCompanion.insert({
    required String id,
    required String schoolId,
    required DateTime dob,
    required String birthPlace,
    required String nik,
    required String status,
    required String userId,
    required String fullName,
    required String email,
    required String gender,
    required String imageUrl,
    required String schoolLevelAccess,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       schoolId = Value(schoolId),
       dob = Value(dob),
       birthPlace = Value(birthPlace),
       nik = Value(nik),
       status = Value(status),
       userId = Value(userId),
       fullName = Value(fullName),
       email = Value(email),
       gender = Value(gender),
       imageUrl = Value(imageUrl),
       schoolLevelAccess = Value(schoolLevelAccess),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SchoolAdmin> custom({
    Expression<String>? id,
    Expression<String>? schoolId,
    Expression<DateTime>? dob,
    Expression<String>? birthPlace,
    Expression<String>? nik,
    Expression<String>? status,
    Expression<String>? userId,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<String>? imageUrl,
    Expression<String>? schoolLevelAccess,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (dob != null) 'dob': dob,
      if (birthPlace != null) 'birth_place': birthPlace,
      if (nik != null) 'nik': nik,
      if (status != null) 'status': status,
      if (userId != null) 'user_id': userId,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (imageUrl != null) 'image_url': imageUrl,
      if (schoolLevelAccess != null) 'school_level_access': schoolLevelAccess,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchoolAdminsCompanion copyWith({
    Value<String>? id,
    Value<String>? schoolId,
    Value<DateTime>? dob,
    Value<String>? birthPlace,
    Value<String>? nik,
    Value<String>? status,
    Value<String>? userId,
    Value<String>? fullName,
    Value<String>? email,
    Value<String>? gender,
    Value<String>? imageUrl,
    Value<String>? schoolLevelAccess,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SchoolAdminsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      dob: dob ?? this.dob,
      birthPlace: birthPlace ?? this.birthPlace,
      nik: nik ?? this.nik,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      schoolLevelAccess: schoolLevelAccess ?? this.schoolLevelAccess,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<String>(schoolId.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (birthPlace.present) {
      map['birth_place'] = Variable<String>(birthPlace.value);
    }
    if (nik.present) {
      map['nik'] = Variable<String>(nik.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (schoolLevelAccess.present) {
      map['school_level_access'] = Variable<String>(schoolLevelAccess.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolAdminsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('dob: $dob, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('nik: $nik, ')
          ..write('status: $status, ')
          ..write('userId: $userId, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('schoolLevelAccess: $schoolLevelAccess, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SchoolAdminsTable schoolAdmins = $SchoolAdminsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schoolAdmins];
}

typedef $$SchoolAdminsTableCreateCompanionBuilder =
    SchoolAdminsCompanion Function({
      required String id,
      required String schoolId,
      required DateTime dob,
      required String birthPlace,
      required String nik,
      required String status,
      required String userId,
      required String fullName,
      required String email,
      required String gender,
      required String imageUrl,
      required String schoolLevelAccess,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SchoolAdminsTableUpdateCompanionBuilder =
    SchoolAdminsCompanion Function({
      Value<String> id,
      Value<String> schoolId,
      Value<DateTime> dob,
      Value<String> birthPlace,
      Value<String> nik,
      Value<String> status,
      Value<String> userId,
      Value<String> fullName,
      Value<String> email,
      Value<String> gender,
      Value<String> imageUrl,
      Value<String> schoolLevelAccess,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SchoolAdminsTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolAdminsTable> {
  $$SchoolAdminsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthPlace => $composableBuilder(
    column: $table.birthPlace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nik => $composableBuilder(
    column: $table.nik,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolLevelAccess => $composableBuilder(
    column: $table.schoolLevelAccess,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchoolAdminsTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolAdminsTable> {
  $$SchoolAdminsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthPlace => $composableBuilder(
    column: $table.birthPlace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nik => $composableBuilder(
    column: $table.nik,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolLevelAccess => $composableBuilder(
    column: $table.schoolLevelAccess,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchoolAdminsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolAdminsTable> {
  $$SchoolAdminsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get birthPlace => $composableBuilder(
    column: $table.birthPlace,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nik =>
      $composableBuilder(column: $table.nik, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get schoolLevelAccess => $composableBuilder(
    column: $table.schoolLevelAccess,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SchoolAdminsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchoolAdminsTable,
          SchoolAdmin,
          $$SchoolAdminsTableFilterComposer,
          $$SchoolAdminsTableOrderingComposer,
          $$SchoolAdminsTableAnnotationComposer,
          $$SchoolAdminsTableCreateCompanionBuilder,
          $$SchoolAdminsTableUpdateCompanionBuilder,
          (
            SchoolAdmin,
            BaseReferences<_$AppDatabase, $SchoolAdminsTable, SchoolAdmin>,
          ),
          SchoolAdmin,
          PrefetchHooks Function()
        > {
  $$SchoolAdminsTableTableManager(_$AppDatabase db, $SchoolAdminsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolAdminsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolAdminsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolAdminsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<DateTime> dob = const Value.absent(),
                Value<String> birthPlace = const Value.absent(),
                Value<String> nik = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> schoolLevelAccess = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SchoolAdminsCompanion(
                id: id,
                schoolId: schoolId,
                dob: dob,
                birthPlace: birthPlace,
                nik: nik,
                status: status,
                userId: userId,
                fullName: fullName,
                email: email,
                gender: gender,
                imageUrl: imageUrl,
                schoolLevelAccess: schoolLevelAccess,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String schoolId,
                required DateTime dob,
                required String birthPlace,
                required String nik,
                required String status,
                required String userId,
                required String fullName,
                required String email,
                required String gender,
                required String imageUrl,
                required String schoolLevelAccess,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SchoolAdminsCompanion.insert(
                id: id,
                schoolId: schoolId,
                dob: dob,
                birthPlace: birthPlace,
                nik: nik,
                status: status,
                userId: userId,
                fullName: fullName,
                email: email,
                gender: gender,
                imageUrl: imageUrl,
                schoolLevelAccess: schoolLevelAccess,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchoolAdminsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchoolAdminsTable,
      SchoolAdmin,
      $$SchoolAdminsTableFilterComposer,
      $$SchoolAdminsTableOrderingComposer,
      $$SchoolAdminsTableAnnotationComposer,
      $$SchoolAdminsTableCreateCompanionBuilder,
      $$SchoolAdminsTableUpdateCompanionBuilder,
      (
        SchoolAdmin,
        BaseReferences<_$AppDatabase, $SchoolAdminsTable, SchoolAdmin>,
      ),
      SchoolAdmin,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SchoolAdminsTableTableManager get schoolAdmins =>
      $$SchoolAdminsTableTableManager(_db, _db.schoolAdmins);
}
