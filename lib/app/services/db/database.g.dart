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
  static const VerificationMeta _nipMeta = const VerificationMeta('nip');
  @override
  late final GeneratedColumn<String> nip = GeneratedColumn<String>(
    'nip',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _hireDateMeta = const VerificationMeta(
    'hireDate',
  );
  @override
  late final GeneratedColumn<DateTime> hireDate = GeneratedColumn<DateTime>(
    'hire_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employeeTypeMeta = const VerificationMeta(
    'employeeType',
  );
  @override
  late final GeneratedColumn<String> employeeType = GeneratedColumn<String>(
    'employee_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workStatusMeta = const VerificationMeta(
    'workStatus',
  );
  @override
  late final GeneratedColumn<String> workStatus = GeneratedColumn<String>(
    'work_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employeeEndStatusMeta = const VerificationMeta(
    'employeeEndStatus',
  );
  @override
  late final GeneratedColumn<String> employeeEndStatus =
      GeneratedColumn<String>(
        'employee_end_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _hireEndMeta = const VerificationMeta(
    'hireEnd',
  );
  @override
  late final GeneratedColumn<DateTime> hireEnd = GeneratedColumn<DateTime>(
    'hire_end',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
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
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
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
  static const VerificationMeta _fileUrlMeta = const VerificationMeta(
    'fileUrl',
  );
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
    'file_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
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
    nip,
    hireDate,
    employeeType,
    workStatus,
    employeeEndStatus,
    hireEnd,
    phone,
    userId,
    fullName,
    email,
    gender,
    role,
    imageUrl,
    fileUrl,
    address,
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
    if (data.containsKey('nip')) {
      context.handle(
        _nipMeta,
        nip.isAcceptableOrUnknown(data['nip']!, _nipMeta),
      );
    }
    if (data.containsKey('hire_date')) {
      context.handle(
        _hireDateMeta,
        hireDate.isAcceptableOrUnknown(data['hire_date']!, _hireDateMeta),
      );
    } else if (isInserting) {
      context.missing(_hireDateMeta);
    }
    if (data.containsKey('employee_type')) {
      context.handle(
        _employeeTypeMeta,
        employeeType.isAcceptableOrUnknown(
          data['employee_type']!,
          _employeeTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeeTypeMeta);
    }
    if (data.containsKey('work_status')) {
      context.handle(
        _workStatusMeta,
        workStatus.isAcceptableOrUnknown(data['work_status']!, _workStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_workStatusMeta);
    }
    if (data.containsKey('employee_end_status')) {
      context.handle(
        _employeeEndStatusMeta,
        employeeEndStatus.isAcceptableOrUnknown(
          data['employee_end_status']!,
          _employeeEndStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeeEndStatusMeta);
    }
    if (data.containsKey('hire_end')) {
      context.handle(
        _hireEndMeta,
        hireEnd.isAcceptableOrUnknown(data['hire_end']!, _hireEndMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
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
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('file_url')) {
      context.handle(
        _fileUrlMeta,
        fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
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
      nip: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nip'],
      ),
      hireDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hire_date'],
      )!,
      employeeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}employee_type'],
      )!,
      workStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_status'],
      )!,
      employeeEndStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}employee_end_status'],
      )!,
      hireEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hire_end'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
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
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      fileUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_url'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
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
  final String? nip;
  final DateTime hireDate;
  final String employeeType;
  final String workStatus;
  final String employeeEndStatus;
  final DateTime? hireEnd;
  final String phone;
  final String userId;
  final String fullName;
  final String email;
  final String gender;
  final String role;
  final String imageUrl;
  final String fileUrl;
  final String address;
  final String schoolLevelAccess;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SchoolAdmin({
    required this.id,
    required this.schoolId,
    required this.dob,
    required this.birthPlace,
    required this.nik,
    this.nip,
    required this.hireDate,
    required this.employeeType,
    required this.workStatus,
    required this.employeeEndStatus,
    this.hireEnd,
    required this.phone,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.role,
    required this.imageUrl,
    required this.fileUrl,
    required this.address,
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
    if (!nullToAbsent || nip != null) {
      map['nip'] = Variable<String>(nip);
    }
    map['hire_date'] = Variable<DateTime>(hireDate);
    map['employee_type'] = Variable<String>(employeeType);
    map['work_status'] = Variable<String>(workStatus);
    map['employee_end_status'] = Variable<String>(employeeEndStatus);
    if (!nullToAbsent || hireEnd != null) {
      map['hire_end'] = Variable<DateTime>(hireEnd);
    }
    map['phone'] = Variable<String>(phone);
    map['user_id'] = Variable<String>(userId);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    map['role'] = Variable<String>(role);
    map['image_url'] = Variable<String>(imageUrl);
    map['file_url'] = Variable<String>(fileUrl);
    map['address'] = Variable<String>(address);
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
      nip: nip == null && nullToAbsent ? const Value.absent() : Value(nip),
      hireDate: Value(hireDate),
      employeeType: Value(employeeType),
      workStatus: Value(workStatus),
      employeeEndStatus: Value(employeeEndStatus),
      hireEnd: hireEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(hireEnd),
      phone: Value(phone),
      userId: Value(userId),
      fullName: Value(fullName),
      email: Value(email),
      gender: Value(gender),
      role: Value(role),
      imageUrl: Value(imageUrl),
      fileUrl: Value(fileUrl),
      address: Value(address),
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
      nip: serializer.fromJson<String?>(json['nip']),
      hireDate: serializer.fromJson<DateTime>(json['hireDate']),
      employeeType: serializer.fromJson<String>(json['employeeType']),
      workStatus: serializer.fromJson<String>(json['workStatus']),
      employeeEndStatus: serializer.fromJson<String>(json['employeeEndStatus']),
      hireEnd: serializer.fromJson<DateTime?>(json['hireEnd']),
      phone: serializer.fromJson<String>(json['phone']),
      userId: serializer.fromJson<String>(json['userId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
      role: serializer.fromJson<String>(json['role']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      address: serializer.fromJson<String>(json['address']),
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
      'nip': serializer.toJson<String?>(nip),
      'hireDate': serializer.toJson<DateTime>(hireDate),
      'employeeType': serializer.toJson<String>(employeeType),
      'workStatus': serializer.toJson<String>(workStatus),
      'employeeEndStatus': serializer.toJson<String>(employeeEndStatus),
      'hireEnd': serializer.toJson<DateTime?>(hireEnd),
      'phone': serializer.toJson<String>(phone),
      'userId': serializer.toJson<String>(userId),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
      'role': serializer.toJson<String>(role),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'address': serializer.toJson<String>(address),
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
    Value<String?> nip = const Value.absent(),
    DateTime? hireDate,
    String? employeeType,
    String? workStatus,
    String? employeeEndStatus,
    Value<DateTime?> hireEnd = const Value.absent(),
    String? phone,
    String? userId,
    String? fullName,
    String? email,
    String? gender,
    String? role,
    String? imageUrl,
    String? fileUrl,
    String? address,
    String? schoolLevelAccess,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SchoolAdmin(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    dob: dob ?? this.dob,
    birthPlace: birthPlace ?? this.birthPlace,
    nik: nik ?? this.nik,
    nip: nip.present ? nip.value : this.nip,
    hireDate: hireDate ?? this.hireDate,
    employeeType: employeeType ?? this.employeeType,
    workStatus: workStatus ?? this.workStatus,
    employeeEndStatus: employeeEndStatus ?? this.employeeEndStatus,
    hireEnd: hireEnd.present ? hireEnd.value : this.hireEnd,
    phone: phone ?? this.phone,
    userId: userId ?? this.userId,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    gender: gender ?? this.gender,
    role: role ?? this.role,
    imageUrl: imageUrl ?? this.imageUrl,
    fileUrl: fileUrl ?? this.fileUrl,
    address: address ?? this.address,
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
      nip: data.nip.present ? data.nip.value : this.nip,
      hireDate: data.hireDate.present ? data.hireDate.value : this.hireDate,
      employeeType: data.employeeType.present
          ? data.employeeType.value
          : this.employeeType,
      workStatus: data.workStatus.present
          ? data.workStatus.value
          : this.workStatus,
      employeeEndStatus: data.employeeEndStatus.present
          ? data.employeeEndStatus.value
          : this.employeeEndStatus,
      hireEnd: data.hireEnd.present ? data.hireEnd.value : this.hireEnd,
      phone: data.phone.present ? data.phone.value : this.phone,
      userId: data.userId.present ? data.userId.value : this.userId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
      role: data.role.present ? data.role.value : this.role,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      address: data.address.present ? data.address.value : this.address,
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
          ..write('nip: $nip, ')
          ..write('hireDate: $hireDate, ')
          ..write('employeeType: $employeeType, ')
          ..write('workStatus: $workStatus, ')
          ..write('employeeEndStatus: $employeeEndStatus, ')
          ..write('hireEnd: $hireEnd, ')
          ..write('phone: $phone, ')
          ..write('userId: $userId, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('role: $role, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('address: $address, ')
          ..write('schoolLevelAccess: $schoolLevelAccess, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    schoolId,
    dob,
    birthPlace,
    nik,
    nip,
    hireDate,
    employeeType,
    workStatus,
    employeeEndStatus,
    hireEnd,
    phone,
    userId,
    fullName,
    email,
    gender,
    role,
    imageUrl,
    fileUrl,
    address,
    schoolLevelAccess,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolAdmin &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.dob == this.dob &&
          other.birthPlace == this.birthPlace &&
          other.nik == this.nik &&
          other.nip == this.nip &&
          other.hireDate == this.hireDate &&
          other.employeeType == this.employeeType &&
          other.workStatus == this.workStatus &&
          other.employeeEndStatus == this.employeeEndStatus &&
          other.hireEnd == this.hireEnd &&
          other.phone == this.phone &&
          other.userId == this.userId &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.role == this.role &&
          other.imageUrl == this.imageUrl &&
          other.fileUrl == this.fileUrl &&
          other.address == this.address &&
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
  final Value<String?> nip;
  final Value<DateTime> hireDate;
  final Value<String> employeeType;
  final Value<String> workStatus;
  final Value<String> employeeEndStatus;
  final Value<DateTime?> hireEnd;
  final Value<String> phone;
  final Value<String> userId;
  final Value<String> fullName;
  final Value<String> email;
  final Value<String> gender;
  final Value<String> role;
  final Value<String> imageUrl;
  final Value<String> fileUrl;
  final Value<String> address;
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
    this.nip = const Value.absent(),
    this.hireDate = const Value.absent(),
    this.employeeType = const Value.absent(),
    this.workStatus = const Value.absent(),
    this.employeeEndStatus = const Value.absent(),
    this.hireEnd = const Value.absent(),
    this.phone = const Value.absent(),
    this.userId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.role = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.address = const Value.absent(),
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
    this.nip = const Value.absent(),
    required DateTime hireDate,
    required String employeeType,
    required String workStatus,
    required String employeeEndStatus,
    this.hireEnd = const Value.absent(),
    required String phone,
    required String userId,
    required String fullName,
    required String email,
    required String gender,
    required String role,
    required String imageUrl,
    required String fileUrl,
    required String address,
    required String schoolLevelAccess,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       schoolId = Value(schoolId),
       dob = Value(dob),
       birthPlace = Value(birthPlace),
       nik = Value(nik),
       hireDate = Value(hireDate),
       employeeType = Value(employeeType),
       workStatus = Value(workStatus),
       employeeEndStatus = Value(employeeEndStatus),
       phone = Value(phone),
       userId = Value(userId),
       fullName = Value(fullName),
       email = Value(email),
       gender = Value(gender),
       role = Value(role),
       imageUrl = Value(imageUrl),
       fileUrl = Value(fileUrl),
       address = Value(address),
       schoolLevelAccess = Value(schoolLevelAccess),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SchoolAdmin> custom({
    Expression<String>? id,
    Expression<String>? schoolId,
    Expression<DateTime>? dob,
    Expression<String>? birthPlace,
    Expression<String>? nik,
    Expression<String>? nip,
    Expression<DateTime>? hireDate,
    Expression<String>? employeeType,
    Expression<String>? workStatus,
    Expression<String>? employeeEndStatus,
    Expression<DateTime>? hireEnd,
    Expression<String>? phone,
    Expression<String>? userId,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<String>? role,
    Expression<String>? imageUrl,
    Expression<String>? fileUrl,
    Expression<String>? address,
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
      if (nip != null) 'nip': nip,
      if (hireDate != null) 'hire_date': hireDate,
      if (employeeType != null) 'employee_type': employeeType,
      if (workStatus != null) 'work_status': workStatus,
      if (employeeEndStatus != null) 'employee_end_status': employeeEndStatus,
      if (hireEnd != null) 'hire_end': hireEnd,
      if (phone != null) 'phone': phone,
      if (userId != null) 'user_id': userId,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (role != null) 'role': role,
      if (imageUrl != null) 'image_url': imageUrl,
      if (fileUrl != null) 'file_url': fileUrl,
      if (address != null) 'address': address,
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
    Value<String?>? nip,
    Value<DateTime>? hireDate,
    Value<String>? employeeType,
    Value<String>? workStatus,
    Value<String>? employeeEndStatus,
    Value<DateTime?>? hireEnd,
    Value<String>? phone,
    Value<String>? userId,
    Value<String>? fullName,
    Value<String>? email,
    Value<String>? gender,
    Value<String>? role,
    Value<String>? imageUrl,
    Value<String>? fileUrl,
    Value<String>? address,
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
      nip: nip ?? this.nip,
      hireDate: hireDate ?? this.hireDate,
      employeeType: employeeType ?? this.employeeType,
      workStatus: workStatus ?? this.workStatus,
      employeeEndStatus: employeeEndStatus ?? this.employeeEndStatus,
      hireEnd: hireEnd ?? this.hireEnd,
      phone: phone ?? this.phone,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      imageUrl: imageUrl ?? this.imageUrl,
      fileUrl: fileUrl ?? this.fileUrl,
      address: address ?? this.address,
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
    if (nip.present) {
      map['nip'] = Variable<String>(nip.value);
    }
    if (hireDate.present) {
      map['hire_date'] = Variable<DateTime>(hireDate.value);
    }
    if (employeeType.present) {
      map['employee_type'] = Variable<String>(employeeType.value);
    }
    if (workStatus.present) {
      map['work_status'] = Variable<String>(workStatus.value);
    }
    if (employeeEndStatus.present) {
      map['employee_end_status'] = Variable<String>(employeeEndStatus.value);
    }
    if (hireEnd.present) {
      map['hire_end'] = Variable<DateTime>(hireEnd.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
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
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
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
          ..write('nip: $nip, ')
          ..write('hireDate: $hireDate, ')
          ..write('employeeType: $employeeType, ')
          ..write('workStatus: $workStatus, ')
          ..write('employeeEndStatus: $employeeEndStatus, ')
          ..write('hireEnd: $hireEnd, ')
          ..write('phone: $phone, ')
          ..write('userId: $userId, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('role: $role, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('address: $address, ')
          ..write('schoolLevelAccess: $schoolLevelAccess, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SchoolLevelsTable extends SchoolLevels
    with TableInfo<$SchoolLevelsTable, SchoolLevel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolLevelsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isMajorMeta = const VerificationMeta(
    'isMajor',
  );
  @override
  late final GeneratedColumn<bool> isMajor = GeneratedColumn<bool>(
    'is_major',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_major" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isEnrollmentNumberMeta =
      const VerificationMeta('isEnrollmentNumber');
  @override
  late final GeneratedColumn<bool> isEnrollmentNumber = GeneratedColumn<bool>(
    'is_enrollment_number',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enrollment_number" IN (0, 1))',
    ),
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
    name,
    isActive,
    isMajor,
    isEnrollmentNumber,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_levels';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchoolLevel> instance, {
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('is_major')) {
      context.handle(
        _isMajorMeta,
        isMajor.isAcceptableOrUnknown(data['is_major']!, _isMajorMeta),
      );
    } else if (isInserting) {
      context.missing(_isMajorMeta);
    }
    if (data.containsKey('is_enrollment_number')) {
      context.handle(
        _isEnrollmentNumberMeta,
        isEnrollmentNumber.isAcceptableOrUnknown(
          data['is_enrollment_number']!,
          _isEnrollmentNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isEnrollmentNumberMeta);
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
  SchoolLevel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolLevel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isMajor: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_major'],
      )!,
      isEnrollmentNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enrollment_number'],
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
  $SchoolLevelsTable createAlias(String alias) {
    return $SchoolLevelsTable(attachedDatabase, alias);
  }
}

class SchoolLevel extends DataClass implements Insertable<SchoolLevel> {
  final String id;
  final String schoolId;
  final String name;
  final bool isActive;
  final bool isMajor;
  final bool isEnrollmentNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SchoolLevel({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.isMajor,
    required this.isEnrollmentNumber,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['school_id'] = Variable<String>(schoolId);
    map['name'] = Variable<String>(name);
    map['is_active'] = Variable<bool>(isActive);
    map['is_major'] = Variable<bool>(isMajor);
    map['is_enrollment_number'] = Variable<bool>(isEnrollmentNumber);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SchoolLevelsCompanion toCompanion(bool nullToAbsent) {
    return SchoolLevelsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      name: Value(name),
      isActive: Value(isActive),
      isMajor: Value(isMajor),
      isEnrollmentNumber: Value(isEnrollmentNumber),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SchoolLevel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolLevel(
      id: serializer.fromJson<String>(json['id']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
      name: serializer.fromJson<String>(json['name']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isMajor: serializer.fromJson<bool>(json['isMajor']),
      isEnrollmentNumber: serializer.fromJson<bool>(json['isEnrollmentNumber']),
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
      'name': serializer.toJson<String>(name),
      'isActive': serializer.toJson<bool>(isActive),
      'isMajor': serializer.toJson<bool>(isMajor),
      'isEnrollmentNumber': serializer.toJson<bool>(isEnrollmentNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SchoolLevel copyWith({
    String? id,
    String? schoolId,
    String? name,
    bool? isActive,
    bool? isMajor,
    bool? isEnrollmentNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SchoolLevel(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    name: name ?? this.name,
    isActive: isActive ?? this.isActive,
    isMajor: isMajor ?? this.isMajor,
    isEnrollmentNumber: isEnrollmentNumber ?? this.isEnrollmentNumber,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SchoolLevel copyWithCompanion(SchoolLevelsCompanion data) {
    return SchoolLevel(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      name: data.name.present ? data.name.value : this.name,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isMajor: data.isMajor.present ? data.isMajor.value : this.isMajor,
      isEnrollmentNumber: data.isEnrollmentNumber.present
          ? data.isEnrollmentNumber.value
          : this.isEnrollmentNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchoolLevel(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('isMajor: $isMajor, ')
          ..write('isEnrollmentNumber: $isEnrollmentNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    schoolId,
    name,
    isActive,
    isMajor,
    isEnrollmentNumber,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolLevel &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.isMajor == this.isMajor &&
          other.isEnrollmentNumber == this.isEnrollmentNumber &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SchoolLevelsCompanion extends UpdateCompanion<SchoolLevel> {
  final Value<String> id;
  final Value<String> schoolId;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<bool> isMajor;
  final Value<bool> isEnrollmentNumber;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SchoolLevelsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isMajor = const Value.absent(),
    this.isEnrollmentNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchoolLevelsCompanion.insert({
    required String id,
    required String schoolId,
    required String name,
    required bool isActive,
    required bool isMajor,
    required bool isEnrollmentNumber,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       schoolId = Value(schoolId),
       name = Value(name),
       isActive = Value(isActive),
       isMajor = Value(isMajor),
       isEnrollmentNumber = Value(isEnrollmentNumber),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SchoolLevel> custom({
    Expression<String>? id,
    Expression<String>? schoolId,
    Expression<String>? name,
    Expression<bool>? isActive,
    Expression<bool>? isMajor,
    Expression<bool>? isEnrollmentNumber,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (isMajor != null) 'is_major': isMajor,
      if (isEnrollmentNumber != null)
        'is_enrollment_number': isEnrollmentNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchoolLevelsCompanion copyWith({
    Value<String>? id,
    Value<String>? schoolId,
    Value<String>? name,
    Value<bool>? isActive,
    Value<bool>? isMajor,
    Value<bool>? isEnrollmentNumber,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SchoolLevelsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      isMajor: isMajor ?? this.isMajor,
      isEnrollmentNumber: isEnrollmentNumber ?? this.isEnrollmentNumber,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isMajor.present) {
      map['is_major'] = Variable<bool>(isMajor.value);
    }
    if (isEnrollmentNumber.present) {
      map['is_enrollment_number'] = Variable<bool>(isEnrollmentNumber.value);
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
    return (StringBuffer('SchoolLevelsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('isMajor: $isMajor, ')
          ..write('isEnrollmentNumber: $isEnrollmentNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CurriculumsTable extends Curriculums
    with TableInfo<$CurriculumsTable, Curriculum> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurriculumsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
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
    name,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'curriculums';
  @override
  VerificationContext validateIntegrity(
    Insertable<Curriculum> instance, {
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
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
  Curriculum map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Curriculum(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
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
  $CurriculumsTable createAlias(String alias) {
    return $CurriculumsTable(attachedDatabase, alias);
  }
}

class Curriculum extends DataClass implements Insertable<Curriculum> {
  final String id;
  final String schoolId;
  final String name;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Curriculum({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['school_id'] = Variable<String>(schoolId);
    map['name'] = Variable<String>(name);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CurriculumsCompanion toCompanion(bool nullToAbsent) {
    return CurriculumsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      name: Value(name),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Curriculum.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Curriculum(
      id: serializer.fromJson<String>(json['id']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
      name: serializer.fromJson<String>(json['name']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'name': serializer.toJson<String>(name),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Curriculum copyWith({
    String? id,
    String? schoolId,
    String? name,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Curriculum(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    name: name ?? this.name,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Curriculum copyWithCompanion(CurriculumsCompanion data) {
    return Curriculum(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      name: data.name.present ? data.name.value : this.name,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Curriculum(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, schoolId, name, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Curriculum &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CurriculumsCompanion extends UpdateCompanion<Curriculum> {
  final Value<String> id;
  final Value<String> schoolId;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CurriculumsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurriculumsCompanion.insert({
    required String id,
    required String schoolId,
    required String name,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       schoolId = Value(schoolId),
       name = Value(name),
       isActive = Value(isActive),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Curriculum> custom({
    Expression<String>? id,
    Expression<String>? schoolId,
    Expression<String>? name,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurriculumsCompanion copyWith({
    Value<String>? id,
    Value<String>? schoolId,
    Value<String>? name,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CurriculumsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return (StringBuffer('CurriculumsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
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
  late final $SchoolLevelsTable schoolLevels = $SchoolLevelsTable(this);
  late final $CurriculumsTable curriculums = $CurriculumsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    schoolAdmins,
    schoolLevels,
    curriculums,
  ];
}

typedef $$SchoolAdminsTableCreateCompanionBuilder =
    SchoolAdminsCompanion Function({
      required String id,
      required String schoolId,
      required DateTime dob,
      required String birthPlace,
      required String nik,
      Value<String?> nip,
      required DateTime hireDate,
      required String employeeType,
      required String workStatus,
      required String employeeEndStatus,
      Value<DateTime?> hireEnd,
      required String phone,
      required String userId,
      required String fullName,
      required String email,
      required String gender,
      required String role,
      required String imageUrl,
      required String fileUrl,
      required String address,
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
      Value<String?> nip,
      Value<DateTime> hireDate,
      Value<String> employeeType,
      Value<String> workStatus,
      Value<String> employeeEndStatus,
      Value<DateTime?> hireEnd,
      Value<String> phone,
      Value<String> userId,
      Value<String> fullName,
      Value<String> email,
      Value<String> gender,
      Value<String> role,
      Value<String> imageUrl,
      Value<String> fileUrl,
      Value<String> address,
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

  ColumnFilters<String> get nip => $composableBuilder(
    column: $table.nip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hireDate => $composableBuilder(
    column: $table.hireDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get employeeType => $composableBuilder(
    column: $table.employeeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workStatus => $composableBuilder(
    column: $table.workStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get employeeEndStatus => $composableBuilder(
    column: $table.employeeEndStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hireEnd => $composableBuilder(
    column: $table.hireEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
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

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
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

  ColumnOrderings<String> get nip => $composableBuilder(
    column: $table.nip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hireDate => $composableBuilder(
    column: $table.hireDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get employeeType => $composableBuilder(
    column: $table.employeeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workStatus => $composableBuilder(
    column: $table.workStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get employeeEndStatus => $composableBuilder(
    column: $table.employeeEndStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hireEnd => $composableBuilder(
    column: $table.hireEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
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

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
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

  GeneratedColumn<String> get nip =>
      $composableBuilder(column: $table.nip, builder: (column) => column);

  GeneratedColumn<DateTime> get hireDate =>
      $composableBuilder(column: $table.hireDate, builder: (column) => column);

  GeneratedColumn<String> get employeeType => $composableBuilder(
    column: $table.employeeType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workStatus => $composableBuilder(
    column: $table.workStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get employeeEndStatus => $composableBuilder(
    column: $table.employeeEndStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hireEnd =>
      $composableBuilder(column: $table.hireEnd, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

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
                Value<String?> nip = const Value.absent(),
                Value<DateTime> hireDate = const Value.absent(),
                Value<String> employeeType = const Value.absent(),
                Value<String> workStatus = const Value.absent(),
                Value<String> employeeEndStatus = const Value.absent(),
                Value<DateTime?> hireEnd = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> fileUrl = const Value.absent(),
                Value<String> address = const Value.absent(),
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
                nip: nip,
                hireDate: hireDate,
                employeeType: employeeType,
                workStatus: workStatus,
                employeeEndStatus: employeeEndStatus,
                hireEnd: hireEnd,
                phone: phone,
                userId: userId,
                fullName: fullName,
                email: email,
                gender: gender,
                role: role,
                imageUrl: imageUrl,
                fileUrl: fileUrl,
                address: address,
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
                Value<String?> nip = const Value.absent(),
                required DateTime hireDate,
                required String employeeType,
                required String workStatus,
                required String employeeEndStatus,
                Value<DateTime?> hireEnd = const Value.absent(),
                required String phone,
                required String userId,
                required String fullName,
                required String email,
                required String gender,
                required String role,
                required String imageUrl,
                required String fileUrl,
                required String address,
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
                nip: nip,
                hireDate: hireDate,
                employeeType: employeeType,
                workStatus: workStatus,
                employeeEndStatus: employeeEndStatus,
                hireEnd: hireEnd,
                phone: phone,
                userId: userId,
                fullName: fullName,
                email: email,
                gender: gender,
                role: role,
                imageUrl: imageUrl,
                fileUrl: fileUrl,
                address: address,
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
typedef $$SchoolLevelsTableCreateCompanionBuilder =
    SchoolLevelsCompanion Function({
      required String id,
      required String schoolId,
      required String name,
      required bool isActive,
      required bool isMajor,
      required bool isEnrollmentNumber,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SchoolLevelsTableUpdateCompanionBuilder =
    SchoolLevelsCompanion Function({
      Value<String> id,
      Value<String> schoolId,
      Value<String> name,
      Value<bool> isActive,
      Value<bool> isMajor,
      Value<bool> isEnrollmentNumber,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SchoolLevelsTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolLevelsTable> {
  $$SchoolLevelsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMajor => $composableBuilder(
    column: $table.isMajor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnrollmentNumber => $composableBuilder(
    column: $table.isEnrollmentNumber,
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

class $$SchoolLevelsTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolLevelsTable> {
  $$SchoolLevelsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMajor => $composableBuilder(
    column: $table.isMajor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnrollmentNumber => $composableBuilder(
    column: $table.isEnrollmentNumber,
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

class $$SchoolLevelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolLevelsTable> {
  $$SchoolLevelsTableAnnotationComposer({
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isMajor =>
      $composableBuilder(column: $table.isMajor, builder: (column) => column);

  GeneratedColumn<bool> get isEnrollmentNumber => $composableBuilder(
    column: $table.isEnrollmentNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SchoolLevelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchoolLevelsTable,
          SchoolLevel,
          $$SchoolLevelsTableFilterComposer,
          $$SchoolLevelsTableOrderingComposer,
          $$SchoolLevelsTableAnnotationComposer,
          $$SchoolLevelsTableCreateCompanionBuilder,
          $$SchoolLevelsTableUpdateCompanionBuilder,
          (
            SchoolLevel,
            BaseReferences<_$AppDatabase, $SchoolLevelsTable, SchoolLevel>,
          ),
          SchoolLevel,
          PrefetchHooks Function()
        > {
  $$SchoolLevelsTableTableManager(_$AppDatabase db, $SchoolLevelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolLevelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolLevelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolLevelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isMajor = const Value.absent(),
                Value<bool> isEnrollmentNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SchoolLevelsCompanion(
                id: id,
                schoolId: schoolId,
                name: name,
                isActive: isActive,
                isMajor: isMajor,
                isEnrollmentNumber: isEnrollmentNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String schoolId,
                required String name,
                required bool isActive,
                required bool isMajor,
                required bool isEnrollmentNumber,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SchoolLevelsCompanion.insert(
                id: id,
                schoolId: schoolId,
                name: name,
                isActive: isActive,
                isMajor: isMajor,
                isEnrollmentNumber: isEnrollmentNumber,
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

typedef $$SchoolLevelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchoolLevelsTable,
      SchoolLevel,
      $$SchoolLevelsTableFilterComposer,
      $$SchoolLevelsTableOrderingComposer,
      $$SchoolLevelsTableAnnotationComposer,
      $$SchoolLevelsTableCreateCompanionBuilder,
      $$SchoolLevelsTableUpdateCompanionBuilder,
      (
        SchoolLevel,
        BaseReferences<_$AppDatabase, $SchoolLevelsTable, SchoolLevel>,
      ),
      SchoolLevel,
      PrefetchHooks Function()
    >;
typedef $$CurriculumsTableCreateCompanionBuilder =
    CurriculumsCompanion Function({
      required String id,
      required String schoolId,
      required String name,
      required bool isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CurriculumsTableUpdateCompanionBuilder =
    CurriculumsCompanion Function({
      Value<String> id,
      Value<String> schoolId,
      Value<String> name,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CurriculumsTableFilterComposer
    extends Composer<_$AppDatabase, $CurriculumsTable> {
  $$CurriculumsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

class $$CurriculumsTableOrderingComposer
    extends Composer<_$AppDatabase, $CurriculumsTable> {
  $$CurriculumsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

class $$CurriculumsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurriculumsTable> {
  $$CurriculumsTableAnnotationComposer({
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CurriculumsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurriculumsTable,
          Curriculum,
          $$CurriculumsTableFilterComposer,
          $$CurriculumsTableOrderingComposer,
          $$CurriculumsTableAnnotationComposer,
          $$CurriculumsTableCreateCompanionBuilder,
          $$CurriculumsTableUpdateCompanionBuilder,
          (
            Curriculum,
            BaseReferences<_$AppDatabase, $CurriculumsTable, Curriculum>,
          ),
          Curriculum,
          PrefetchHooks Function()
        > {
  $$CurriculumsTableTableManager(_$AppDatabase db, $CurriculumsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurriculumsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurriculumsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurriculumsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurriculumsCompanion(
                id: id,
                schoolId: schoolId,
                name: name,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String schoolId,
                required String name,
                required bool isActive,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CurriculumsCompanion.insert(
                id: id,
                schoolId: schoolId,
                name: name,
                isActive: isActive,
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

typedef $$CurriculumsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurriculumsTable,
      Curriculum,
      $$CurriculumsTableFilterComposer,
      $$CurriculumsTableOrderingComposer,
      $$CurriculumsTableAnnotationComposer,
      $$CurriculumsTableCreateCompanionBuilder,
      $$CurriculumsTableUpdateCompanionBuilder,
      (
        Curriculum,
        BaseReferences<_$AppDatabase, $CurriculumsTable, Curriculum>,
      ),
      Curriculum,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SchoolAdminsTableTableManager get schoolAdmins =>
      $$SchoolAdminsTableTableManager(_db, _db.schoolAdmins);
  $$SchoolLevelsTableTableManager get schoolLevels =>
      $$SchoolLevelsTableTableManager(_db, _db.schoolLevels);
  $$CurriculumsTableTableManager get curriculums =>
      $$CurriculumsTableTableManager(_db, _db.curriculums);
}
