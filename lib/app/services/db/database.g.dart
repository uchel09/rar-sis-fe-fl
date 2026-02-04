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

class $TeachersTable extends Teachers with TableInfo<$TeachersTable, Teacher> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeachersTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'teachers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Teacher> instance, {
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
  Teacher map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Teacher(
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
  $TeachersTable createAlias(String alias) {
    return $TeachersTable(attachedDatabase, alias);
  }
}

class Teacher extends DataClass implements Insertable<Teacher> {
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
  const Teacher({
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

  TeachersCompanion toCompanion(bool nullToAbsent) {
    return TeachersCompanion(
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

  factory Teacher.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Teacher(
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

  Teacher copyWith({
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
  }) => Teacher(
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
  Teacher copyWithCompanion(TeachersCompanion data) {
    return Teacher(
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
    return (StringBuffer('Teacher(')
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
      (other is Teacher &&
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

class TeachersCompanion extends UpdateCompanion<Teacher> {
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
  const TeachersCompanion({
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
  TeachersCompanion.insert({
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
  static Insertable<Teacher> custom({
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

  TeachersCompanion copyWith({
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
    return TeachersCompanion(
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
    return (StringBuffer('TeachersCompanion(')
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

class $StaffsTable extends Staffs with TableInfo<$StaffsTable, Staff> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _staffPositionIdMeta = const VerificationMeta(
    'staffPositionId',
  );
  @override
  late final GeneratedColumn<String> staffPositionId = GeneratedColumn<String>(
    'staff_position_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _staffPositionNameMeta = const VerificationMeta(
    'staffPositionName',
  );
  @override
  late final GeneratedColumn<String> staffPositionName =
      GeneratedColumn<String>(
        'staff_position_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
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
    staffPositionId,
    staffPositionName,
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
  static const String $name = 'staffs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Staff> instance, {
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
    if (data.containsKey('staff_position_id')) {
      context.handle(
        _staffPositionIdMeta,
        staffPositionId.isAcceptableOrUnknown(
          data['staff_position_id']!,
          _staffPositionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_staffPositionIdMeta);
    }
    if (data.containsKey('staff_position_name')) {
      context.handle(
        _staffPositionNameMeta,
        staffPositionName.isAcceptableOrUnknown(
          data['staff_position_name']!,
          _staffPositionNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_staffPositionNameMeta);
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
  Staff map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Staff(
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
      staffPositionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}staff_position_id'],
      )!,
      staffPositionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}staff_position_name'],
      )!,
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
  $StaffsTable createAlias(String alias) {
    return $StaffsTable(attachedDatabase, alias);
  }
}

class Staff extends DataClass implements Insertable<Staff> {
  final String id;
  final String schoolId;
  final DateTime dob;
  final String birthPlace;
  final String nik;
  final String? nip;
  final String staffPositionId;
  final String staffPositionName;
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
  const Staff({
    required this.id,
    required this.schoolId,
    required this.dob,
    required this.birthPlace,
    required this.nik,
    this.nip,
    required this.staffPositionId,
    required this.staffPositionName,
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
    map['staff_position_id'] = Variable<String>(staffPositionId);
    map['staff_position_name'] = Variable<String>(staffPositionName);
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

  StaffsCompanion toCompanion(bool nullToAbsent) {
    return StaffsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      dob: Value(dob),
      birthPlace: Value(birthPlace),
      nik: Value(nik),
      nip: nip == null && nullToAbsent ? const Value.absent() : Value(nip),
      staffPositionId: Value(staffPositionId),
      staffPositionName: Value(staffPositionName),
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

  factory Staff.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Staff(
      id: serializer.fromJson<String>(json['id']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
      dob: serializer.fromJson<DateTime>(json['dob']),
      birthPlace: serializer.fromJson<String>(json['birthPlace']),
      nik: serializer.fromJson<String>(json['nik']),
      nip: serializer.fromJson<String?>(json['nip']),
      staffPositionId: serializer.fromJson<String>(json['staffPositionId']),
      staffPositionName: serializer.fromJson<String>(json['staffPositionName']),
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
      'staffPositionId': serializer.toJson<String>(staffPositionId),
      'staffPositionName': serializer.toJson<String>(staffPositionName),
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

  Staff copyWith({
    String? id,
    String? schoolId,
    DateTime? dob,
    String? birthPlace,
    String? nik,
    Value<String?> nip = const Value.absent(),
    String? staffPositionId,
    String? staffPositionName,
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
  }) => Staff(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    dob: dob ?? this.dob,
    birthPlace: birthPlace ?? this.birthPlace,
    nik: nik ?? this.nik,
    nip: nip.present ? nip.value : this.nip,
    staffPositionId: staffPositionId ?? this.staffPositionId,
    staffPositionName: staffPositionName ?? this.staffPositionName,
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
  Staff copyWithCompanion(StaffsCompanion data) {
    return Staff(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      dob: data.dob.present ? data.dob.value : this.dob,
      birthPlace: data.birthPlace.present
          ? data.birthPlace.value
          : this.birthPlace,
      nik: data.nik.present ? data.nik.value : this.nik,
      nip: data.nip.present ? data.nip.value : this.nip,
      staffPositionId: data.staffPositionId.present
          ? data.staffPositionId.value
          : this.staffPositionId,
      staffPositionName: data.staffPositionName.present
          ? data.staffPositionName.value
          : this.staffPositionName,
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
    return (StringBuffer('Staff(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('dob: $dob, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('nik: $nik, ')
          ..write('nip: $nip, ')
          ..write('staffPositionId: $staffPositionId, ')
          ..write('staffPositionName: $staffPositionName, ')
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
    staffPositionId,
    staffPositionName,
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
      (other is Staff &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.dob == this.dob &&
          other.birthPlace == this.birthPlace &&
          other.nik == this.nik &&
          other.nip == this.nip &&
          other.staffPositionId == this.staffPositionId &&
          other.staffPositionName == this.staffPositionName &&
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

class StaffsCompanion extends UpdateCompanion<Staff> {
  final Value<String> id;
  final Value<String> schoolId;
  final Value<DateTime> dob;
  final Value<String> birthPlace;
  final Value<String> nik;
  final Value<String?> nip;
  final Value<String> staffPositionId;
  final Value<String> staffPositionName;
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
  const StaffsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.dob = const Value.absent(),
    this.birthPlace = const Value.absent(),
    this.nik = const Value.absent(),
    this.nip = const Value.absent(),
    this.staffPositionId = const Value.absent(),
    this.staffPositionName = const Value.absent(),
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
  StaffsCompanion.insert({
    required String id,
    required String schoolId,
    required DateTime dob,
    required String birthPlace,
    required String nik,
    this.nip = const Value.absent(),
    required String staffPositionId,
    required String staffPositionName,
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
       staffPositionId = Value(staffPositionId),
       staffPositionName = Value(staffPositionName),
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
  static Insertable<Staff> custom({
    Expression<String>? id,
    Expression<String>? schoolId,
    Expression<DateTime>? dob,
    Expression<String>? birthPlace,
    Expression<String>? nik,
    Expression<String>? nip,
    Expression<String>? staffPositionId,
    Expression<String>? staffPositionName,
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
      if (staffPositionId != null) 'staff_position_id': staffPositionId,
      if (staffPositionName != null) 'staff_position_name': staffPositionName,
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

  StaffsCompanion copyWith({
    Value<String>? id,
    Value<String>? schoolId,
    Value<DateTime>? dob,
    Value<String>? birthPlace,
    Value<String>? nik,
    Value<String?>? nip,
    Value<String>? staffPositionId,
    Value<String>? staffPositionName,
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
    return StaffsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      dob: dob ?? this.dob,
      birthPlace: birthPlace ?? this.birthPlace,
      nik: nik ?? this.nik,
      nip: nip ?? this.nip,
      staffPositionId: staffPositionId ?? this.staffPositionId,
      staffPositionName: staffPositionName ?? this.staffPositionName,
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
    if (staffPositionId.present) {
      map['staff_position_id'] = Variable<String>(staffPositionId.value);
    }
    if (staffPositionName.present) {
      map['staff_position_name'] = Variable<String>(staffPositionName.value);
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
    return (StringBuffer('StaffsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('dob: $dob, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('nik: $nik, ')
          ..write('nip: $nip, ')
          ..write('staffPositionId: $staffPositionId, ')
          ..write('staffPositionName: $staffPositionName, ')
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

class $StaffPositionsTable extends StaffPositions
    with TableInfo<$StaffPositionsTable, StaffPosition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffPositionsTable(this.attachedDatabase, [this._alias]);
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
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
    description,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff_positions';
  @override
  VerificationContext validateIntegrity(
    Insertable<StaffPosition> instance, {
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
  StaffPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffPosition(
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
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
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
  $StaffPositionsTable createAlias(String alias) {
    return $StaffPositionsTable(attachedDatabase, alias);
  }
}

class StaffPosition extends DataClass implements Insertable<StaffPosition> {
  final String id;
  final String schoolId;
  final String name;
  final String description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const StaffPosition({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.description,
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
    map['description'] = Variable<String>(description);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StaffPositionsCompanion toCompanion(bool nullToAbsent) {
    return StaffPositionsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      name: Value(name),
      description: Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory StaffPosition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffPosition(
      id: serializer.fromJson<String>(json['id']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
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
      'description': serializer.toJson<String>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StaffPosition copyWith({
    String? id,
    String? schoolId,
    String? name,
    String? description,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => StaffPosition(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    name: name ?? this.name,
    description: description ?? this.description,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StaffPosition copyWithCompanion(StaffPositionsCompanion data) {
    return StaffPosition(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffPosition(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
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
    description,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffPosition &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.name == this.name &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StaffPositionsCompanion extends UpdateCompanion<StaffPosition> {
  final Value<String> id;
  final Value<String> schoolId;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const StaffPositionsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StaffPositionsCompanion.insert({
    required String id,
    required String schoolId,
    required String name,
    required String description,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       schoolId = Value(schoolId),
       name = Value(name),
       description = Value(description),
       isActive = Value(isActive),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StaffPosition> custom({
    Expression<String>? id,
    Expression<String>? schoolId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StaffPositionsCompanion copyWith({
    Value<String>? id,
    Value<String>? schoolId,
    Value<String>? name,
    Value<String>? description,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return StaffPositionsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      name: name ?? this.name,
      description: description ?? this.description,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
    return (StringBuffer('StaffPositionsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
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

class $SubCurriculumsTable extends SubCurriculums
    with TableInfo<$SubCurriculumsTable, SubCurriculum> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubCurriculumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _curriculumIdMeta = const VerificationMeta(
    'curriculumId',
  );
  @override
  late final GeneratedColumn<String> curriculumId = GeneratedColumn<String>(
    'curriculum_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolLevelIdMeta = const VerificationMeta(
    'schoolLevelId',
  );
  @override
  late final GeneratedColumn<String> schoolLevelId = GeneratedColumn<String>(
    'school_level_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolLevelNameMeta = const VerificationMeta(
    'schoolLevelName',
  );
  @override
  late final GeneratedColumn<String> schoolLevelName = GeneratedColumn<String>(
    'school_level_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectsMeta = const VerificationMeta(
    'subjects',
  );
  @override
  late final GeneratedColumn<String> subjects = GeneratedColumn<String>(
    'subjects',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesPerJpMeta = const VerificationMeta(
    'minutesPerJp',
  );
  @override
  late final GeneratedColumn<int> minutesPerJp = GeneratedColumn<int>(
    'minutes_per_jp',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    curriculumId,
    schoolLevelId,
    schoolLevelName,
    subjects,
    minutesPerJp,
    name,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_curriculums';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubCurriculum> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('curriculum_id')) {
      context.handle(
        _curriculumIdMeta,
        curriculumId.isAcceptableOrUnknown(
          data['curriculum_id']!,
          _curriculumIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_curriculumIdMeta);
    }
    if (data.containsKey('school_level_id')) {
      context.handle(
        _schoolLevelIdMeta,
        schoolLevelId.isAcceptableOrUnknown(
          data['school_level_id']!,
          _schoolLevelIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schoolLevelIdMeta);
    }
    if (data.containsKey('school_level_name')) {
      context.handle(
        _schoolLevelNameMeta,
        schoolLevelName.isAcceptableOrUnknown(
          data['school_level_name']!,
          _schoolLevelNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schoolLevelNameMeta);
    }
    if (data.containsKey('subjects')) {
      context.handle(
        _subjectsMeta,
        subjects.isAcceptableOrUnknown(data['subjects']!, _subjectsMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectsMeta);
    }
    if (data.containsKey('minutes_per_jp')) {
      context.handle(
        _minutesPerJpMeta,
        minutesPerJp.isAcceptableOrUnknown(
          data['minutes_per_jp']!,
          _minutesPerJpMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesPerJpMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  SubCurriculum map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubCurriculum(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      curriculumId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}curriculum_id'],
      )!,
      schoolLevelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_level_id'],
      )!,
      schoolLevelName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_level_name'],
      )!,
      subjects: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subjects'],
      )!,
      minutesPerJp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_per_jp'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
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
  $SubCurriculumsTable createAlias(String alias) {
    return $SubCurriculumsTable(attachedDatabase, alias);
  }
}

class SubCurriculum extends DataClass implements Insertable<SubCurriculum> {
  final String id;
  final String curriculumId;
  final String schoolLevelId;
  final String schoolLevelName;
  final String subjects;
  final int minutesPerJp;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SubCurriculum({
    required this.id,
    required this.curriculumId,
    required this.schoolLevelId,
    required this.schoolLevelName,
    required this.subjects,
    required this.minutesPerJp,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['curriculum_id'] = Variable<String>(curriculumId);
    map['school_level_id'] = Variable<String>(schoolLevelId);
    map['school_level_name'] = Variable<String>(schoolLevelName);
    map['subjects'] = Variable<String>(subjects);
    map['minutes_per_jp'] = Variable<int>(minutesPerJp);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubCurriculumsCompanion toCompanion(bool nullToAbsent) {
    return SubCurriculumsCompanion(
      id: Value(id),
      curriculumId: Value(curriculumId),
      schoolLevelId: Value(schoolLevelId),
      schoolLevelName: Value(schoolLevelName),
      subjects: Value(subjects),
      minutesPerJp: Value(minutesPerJp),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SubCurriculum.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubCurriculum(
      id: serializer.fromJson<String>(json['id']),
      curriculumId: serializer.fromJson<String>(json['curriculumId']),
      schoolLevelId: serializer.fromJson<String>(json['schoolLevelId']),
      schoolLevelName: serializer.fromJson<String>(json['schoolLevelName']),
      subjects: serializer.fromJson<String>(json['subjects']),
      minutesPerJp: serializer.fromJson<int>(json['minutesPerJp']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'curriculumId': serializer.toJson<String>(curriculumId),
      'schoolLevelId': serializer.toJson<String>(schoolLevelId),
      'schoolLevelName': serializer.toJson<String>(schoolLevelName),
      'subjects': serializer.toJson<String>(subjects),
      'minutesPerJp': serializer.toJson<int>(minutesPerJp),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SubCurriculum copyWith({
    String? id,
    String? curriculumId,
    String? schoolLevelId,
    String? schoolLevelName,
    String? subjects,
    int? minutesPerJp,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SubCurriculum(
    id: id ?? this.id,
    curriculumId: curriculumId ?? this.curriculumId,
    schoolLevelId: schoolLevelId ?? this.schoolLevelId,
    schoolLevelName: schoolLevelName ?? this.schoolLevelName,
    subjects: subjects ?? this.subjects,
    minutesPerJp: minutesPerJp ?? this.minutesPerJp,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SubCurriculum copyWithCompanion(SubCurriculumsCompanion data) {
    return SubCurriculum(
      id: data.id.present ? data.id.value : this.id,
      curriculumId: data.curriculumId.present
          ? data.curriculumId.value
          : this.curriculumId,
      schoolLevelId: data.schoolLevelId.present
          ? data.schoolLevelId.value
          : this.schoolLevelId,
      schoolLevelName: data.schoolLevelName.present
          ? data.schoolLevelName.value
          : this.schoolLevelName,
      subjects: data.subjects.present ? data.subjects.value : this.subjects,
      minutesPerJp: data.minutesPerJp.present
          ? data.minutesPerJp.value
          : this.minutesPerJp,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubCurriculum(')
          ..write('id: $id, ')
          ..write('curriculumId: $curriculumId, ')
          ..write('schoolLevelId: $schoolLevelId, ')
          ..write('schoolLevelName: $schoolLevelName, ')
          ..write('subjects: $subjects, ')
          ..write('minutesPerJp: $minutesPerJp, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    curriculumId,
    schoolLevelId,
    schoolLevelName,
    subjects,
    minutesPerJp,
    name,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubCurriculum &&
          other.id == this.id &&
          other.curriculumId == this.curriculumId &&
          other.schoolLevelId == this.schoolLevelId &&
          other.schoolLevelName == this.schoolLevelName &&
          other.subjects == this.subjects &&
          other.minutesPerJp == this.minutesPerJp &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubCurriculumsCompanion extends UpdateCompanion<SubCurriculum> {
  final Value<String> id;
  final Value<String> curriculumId;
  final Value<String> schoolLevelId;
  final Value<String> schoolLevelName;
  final Value<String> subjects;
  final Value<int> minutesPerJp;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SubCurriculumsCompanion({
    this.id = const Value.absent(),
    this.curriculumId = const Value.absent(),
    this.schoolLevelId = const Value.absent(),
    this.schoolLevelName = const Value.absent(),
    this.subjects = const Value.absent(),
    this.minutesPerJp = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubCurriculumsCompanion.insert({
    required String id,
    required String curriculumId,
    required String schoolLevelId,
    required String schoolLevelName,
    required String subjects,
    required int minutesPerJp,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       curriculumId = Value(curriculumId),
       schoolLevelId = Value(schoolLevelId),
       schoolLevelName = Value(schoolLevelName),
       subjects = Value(subjects),
       minutesPerJp = Value(minutesPerJp),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SubCurriculum> custom({
    Expression<String>? id,
    Expression<String>? curriculumId,
    Expression<String>? schoolLevelId,
    Expression<String>? schoolLevelName,
    Expression<String>? subjects,
    Expression<int>? minutesPerJp,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (curriculumId != null) 'curriculum_id': curriculumId,
      if (schoolLevelId != null) 'school_level_id': schoolLevelId,
      if (schoolLevelName != null) 'school_level_name': schoolLevelName,
      if (subjects != null) 'subjects': subjects,
      if (minutesPerJp != null) 'minutes_per_jp': minutesPerJp,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubCurriculumsCompanion copyWith({
    Value<String>? id,
    Value<String>? curriculumId,
    Value<String>? schoolLevelId,
    Value<String>? schoolLevelName,
    Value<String>? subjects,
    Value<int>? minutesPerJp,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SubCurriculumsCompanion(
      id: id ?? this.id,
      curriculumId: curriculumId ?? this.curriculumId,
      schoolLevelId: schoolLevelId ?? this.schoolLevelId,
      schoolLevelName: schoolLevelName ?? this.schoolLevelName,
      subjects: subjects ?? this.subjects,
      minutesPerJp: minutesPerJp ?? this.minutesPerJp,
      name: name ?? this.name,
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
    if (curriculumId.present) {
      map['curriculum_id'] = Variable<String>(curriculumId.value);
    }
    if (schoolLevelId.present) {
      map['school_level_id'] = Variable<String>(schoolLevelId.value);
    }
    if (schoolLevelName.present) {
      map['school_level_name'] = Variable<String>(schoolLevelName.value);
    }
    if (subjects.present) {
      map['subjects'] = Variable<String>(subjects.value);
    }
    if (minutesPerJp.present) {
      map['minutes_per_jp'] = Variable<int>(minutesPerJp.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
    return (StringBuffer('SubCurriculumsCompanion(')
          ..write('id: $id, ')
          ..write('curriculumId: $curriculumId, ')
          ..write('schoolLevelId: $schoolLevelId, ')
          ..write('schoolLevelName: $schoolLevelName, ')
          ..write('subjects: $subjects, ')
          ..write('minutesPerJp: $minutesPerJp, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
  static const VerificationMeta _subNameMeta = const VerificationMeta(
    'subName',
  );
  @override
  late final GeneratedColumn<String> subName = GeneratedColumn<String>(
    'sub_name',
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
    name,
    subName,
    schoolId,
    schoolLevelAccess,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_name')) {
      context.handle(
        _subNameMeta,
        subName.isAcceptableOrUnknown(data['sub_name']!, _subNameMeta),
      );
    } else if (isInserting) {
      context.missing(_subNameMeta);
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
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
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      subName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_name'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
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
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final String id;
  final String name;
  final String subName;
  final String schoolId;
  final String schoolLevelAccess;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Subject({
    required this.id,
    required this.name,
    required this.subName,
    required this.schoolId,
    required this.schoolLevelAccess,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sub_name'] = Variable<String>(subName);
    map['school_id'] = Variable<String>(schoolId);
    map['school_level_access'] = Variable<String>(schoolLevelAccess);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      subName: Value(subName),
      schoolId: Value(schoolId),
      schoolLevelAccess: Value(schoolLevelAccess),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subName: serializer.fromJson<String>(json['subName']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
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
      'name': serializer.toJson<String>(name),
      'subName': serializer.toJson<String>(subName),
      'schoolId': serializer.toJson<String>(schoolId),
      'schoolLevelAccess': serializer.toJson<String>(schoolLevelAccess),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Subject copyWith({
    String? id,
    String? name,
    String? subName,
    String? schoolId,
    String? schoolLevelAccess,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Subject(
    id: id ?? this.id,
    name: name ?? this.name,
    subName: subName ?? this.subName,
    schoolId: schoolId ?? this.schoolId,
    schoolLevelAccess: schoolLevelAccess ?? this.schoolLevelAccess,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      subName: data.subName.present ? data.subName.value : this.subName,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      schoolLevelAccess: data.schoolLevelAccess.present
          ? data.schoolLevelAccess.value
          : this.schoolLevelAccess,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subName: $subName, ')
          ..write('schoolId: $schoolId, ')
          ..write('schoolLevelAccess: $schoolLevelAccess, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    subName,
    schoolId,
    schoolLevelAccess,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.name == this.name &&
          other.subName == this.subName &&
          other.schoolId == this.schoolId &&
          other.schoolLevelAccess == this.schoolLevelAccess &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> subName;
  final Value<String> schoolId;
  final Value<String> schoolLevelAccess;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subName = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.schoolLevelAccess = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectsCompanion.insert({
    required String id,
    required String name,
    required String subName,
    required String schoolId,
    required String schoolLevelAccess,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       subName = Value(subName),
       schoolId = Value(schoolId),
       schoolLevelAccess = Value(schoolLevelAccess),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Subject> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? subName,
    Expression<String>? schoolId,
    Expression<String>? schoolLevelAccess,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subName != null) 'sub_name': subName,
      if (schoolId != null) 'school_id': schoolId,
      if (schoolLevelAccess != null) 'school_level_access': schoolLevelAccess,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? subName,
    Value<String>? schoolId,
    Value<String>? schoolLevelAccess,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subName: subName ?? this.subName,
      schoolId: schoolId ?? this.schoolId,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subName.present) {
      map['sub_name'] = Variable<String>(subName.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<String>(schoolId.value);
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
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subName: $subName, ')
          ..write('schoolId: $schoolId, ')
          ..write('schoolLevelAccess: $schoolLevelAccess, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubCurriculumSubjectsTable extends SubCurriculumSubjects
    with TableInfo<$SubCurriculumSubjectsTable, SubCurriculumSubject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubCurriculumSubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectNameMeta = const VerificationMeta(
    'subjectName',
  );
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
    'subject_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hoursPerWeekMeta = const VerificationMeta(
    'hoursPerWeek',
  );
  @override
  late final GeneratedColumn<int> hoursPerWeek = GeneratedColumn<int>(
    'hours_per_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subCurriculumIdMeta = const VerificationMeta(
    'subCurriculumId',
  );
  @override
  late final GeneratedColumn<String> subCurriculumId = GeneratedColumn<String>(
    'sub_curriculum_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syllabusMeta = const VerificationMeta(
    'syllabus',
  );
  @override
  late final GeneratedColumn<String> syllabus = GeneratedColumn<String>(
    'syllabus',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    subjectId,
    subjectName,
    hoursPerWeek,
    subCurriculumId,
    syllabus,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_curriculum_subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubCurriculumSubject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('subject_name')) {
      context.handle(
        _subjectNameMeta,
        subjectName.isAcceptableOrUnknown(
          data['subject_name']!,
          _subjectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectNameMeta);
    }
    if (data.containsKey('hours_per_week')) {
      context.handle(
        _hoursPerWeekMeta,
        hoursPerWeek.isAcceptableOrUnknown(
          data['hours_per_week']!,
          _hoursPerWeekMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hoursPerWeekMeta);
    }
    if (data.containsKey('sub_curriculum_id')) {
      context.handle(
        _subCurriculumIdMeta,
        subCurriculumId.isAcceptableOrUnknown(
          data['sub_curriculum_id']!,
          _subCurriculumIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subCurriculumIdMeta);
    }
    if (data.containsKey('syllabus')) {
      context.handle(
        _syllabusMeta,
        syllabus.isAcceptableOrUnknown(data['syllabus']!, _syllabusMeta),
      );
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
  SubCurriculumSubject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubCurriculumSubject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      subjectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_name'],
      )!,
      hoursPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hours_per_week'],
      )!,
      subCurriculumId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_curriculum_id'],
      )!,
      syllabus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}syllabus'],
      ),
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
  $SubCurriculumSubjectsTable createAlias(String alias) {
    return $SubCurriculumSubjectsTable(attachedDatabase, alias);
  }
}

class SubCurriculumSubject extends DataClass
    implements Insertable<SubCurriculumSubject> {
  final String id;
  final String subjectId;
  final String subjectName;
  final int hoursPerWeek;
  final String subCurriculumId;
  final String? syllabus;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SubCurriculumSubject({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.hoursPerWeek,
    required this.subCurriculumId,
    this.syllabus,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['subject_name'] = Variable<String>(subjectName);
    map['hours_per_week'] = Variable<int>(hoursPerWeek);
    map['sub_curriculum_id'] = Variable<String>(subCurriculumId);
    if (!nullToAbsent || syllabus != null) {
      map['syllabus'] = Variable<String>(syllabus);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubCurriculumSubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubCurriculumSubjectsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      subjectName: Value(subjectName),
      hoursPerWeek: Value(hoursPerWeek),
      subCurriculumId: Value(subCurriculumId),
      syllabus: syllabus == null && nullToAbsent
          ? const Value.absent()
          : Value(syllabus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SubCurriculumSubject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubCurriculumSubject(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      subjectName: serializer.fromJson<String>(json['subjectName']),
      hoursPerWeek: serializer.fromJson<int>(json['hoursPerWeek']),
      subCurriculumId: serializer.fromJson<String>(json['subCurriculumId']),
      syllabus: serializer.fromJson<String?>(json['syllabus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'subjectName': serializer.toJson<String>(subjectName),
      'hoursPerWeek': serializer.toJson<int>(hoursPerWeek),
      'subCurriculumId': serializer.toJson<String>(subCurriculumId),
      'syllabus': serializer.toJson<String?>(syllabus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SubCurriculumSubject copyWith({
    String? id,
    String? subjectId,
    String? subjectName,
    int? hoursPerWeek,
    String? subCurriculumId,
    Value<String?> syllabus = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SubCurriculumSubject(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    subjectName: subjectName ?? this.subjectName,
    hoursPerWeek: hoursPerWeek ?? this.hoursPerWeek,
    subCurriculumId: subCurriculumId ?? this.subCurriculumId,
    syllabus: syllabus.present ? syllabus.value : this.syllabus,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SubCurriculumSubject copyWithCompanion(SubCurriculumSubjectsCompanion data) {
    return SubCurriculumSubject(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      subjectName: data.subjectName.present
          ? data.subjectName.value
          : this.subjectName,
      hoursPerWeek: data.hoursPerWeek.present
          ? data.hoursPerWeek.value
          : this.hoursPerWeek,
      subCurriculumId: data.subCurriculumId.present
          ? data.subCurriculumId.value
          : this.subCurriculumId,
      syllabus: data.syllabus.present ? data.syllabus.value : this.syllabus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubCurriculumSubject(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('subjectName: $subjectName, ')
          ..write('hoursPerWeek: $hoursPerWeek, ')
          ..write('subCurriculumId: $subCurriculumId, ')
          ..write('syllabus: $syllabus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    subjectName,
    hoursPerWeek,
    subCurriculumId,
    syllabus,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubCurriculumSubject &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.subjectName == this.subjectName &&
          other.hoursPerWeek == this.hoursPerWeek &&
          other.subCurriculumId == this.subCurriculumId &&
          other.syllabus == this.syllabus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubCurriculumSubjectsCompanion
    extends UpdateCompanion<SubCurriculumSubject> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<String> subjectName;
  final Value<int> hoursPerWeek;
  final Value<String> subCurriculumId;
  final Value<String?> syllabus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SubCurriculumSubjectsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.hoursPerWeek = const Value.absent(),
    this.subCurriculumId = const Value.absent(),
    this.syllabus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubCurriculumSubjectsCompanion.insert({
    required String id,
    required String subjectId,
    required String subjectName,
    required int hoursPerWeek,
    required String subCurriculumId,
    this.syllabus = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       subjectName = Value(subjectName),
       hoursPerWeek = Value(hoursPerWeek),
       subCurriculumId = Value(subCurriculumId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SubCurriculumSubject> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<String>? subjectName,
    Expression<int>? hoursPerWeek,
    Expression<String>? subCurriculumId,
    Expression<String>? syllabus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (subjectName != null) 'subject_name': subjectName,
      if (hoursPerWeek != null) 'hours_per_week': hoursPerWeek,
      if (subCurriculumId != null) 'sub_curriculum_id': subCurriculumId,
      if (syllabus != null) 'syllabus': syllabus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubCurriculumSubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<String>? subjectName,
    Value<int>? hoursPerWeek,
    Value<String>? subCurriculumId,
    Value<String?>? syllabus,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SubCurriculumSubjectsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      hoursPerWeek: hoursPerWeek ?? this.hoursPerWeek,
      subCurriculumId: subCurriculumId ?? this.subCurriculumId,
      syllabus: syllabus ?? this.syllabus,
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
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    if (hoursPerWeek.present) {
      map['hours_per_week'] = Variable<int>(hoursPerWeek.value);
    }
    if (subCurriculumId.present) {
      map['sub_curriculum_id'] = Variable<String>(subCurriculumId.value);
    }
    if (syllabus.present) {
      map['syllabus'] = Variable<String>(syllabus.value);
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
    return (StringBuffer('SubCurriculumSubjectsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('subjectName: $subjectName, ')
          ..write('hoursPerWeek: $hoursPerWeek, ')
          ..write('subCurriculumId: $subCurriculumId, ')
          ..write('syllabus: $syllabus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TeacherSubjectsTable extends TeacherSubjects
    with TableInfo<$TeacherSubjectsTable, TeacherSubject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeacherSubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<String> teacherId = GeneratedColumn<String>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teacherNameMeta = const VerificationMeta(
    'teacherName',
  );
  @override
  late final GeneratedColumn<String> teacherName = GeneratedColumn<String>(
    'teacher_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectNameMeta = const VerificationMeta(
    'subjectName',
  );
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
    'subject_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectSubNameMeta = const VerificationMeta(
    'subjectSubName',
  );
  @override
  late final GeneratedColumn<String> subjectSubName = GeneratedColumn<String>(
    'subject_sub_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _childrenRawMeta = const VerificationMeta(
    'childrenRaw',
  );
  @override
  late final GeneratedColumn<String> childrenRaw = GeneratedColumn<String>(
    'children_raw',
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
    teacherId,
    teacherName,
    subjectId,
    subjectName,
    subjectSubName,
    parentId,
    childrenRaw,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher_subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherSubject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('teacher_name')) {
      context.handle(
        _teacherNameMeta,
        teacherName.isAcceptableOrUnknown(
          data['teacher_name']!,
          _teacherNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_teacherNameMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('subject_name')) {
      context.handle(
        _subjectNameMeta,
        subjectName.isAcceptableOrUnknown(
          data['subject_name']!,
          _subjectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectNameMeta);
    }
    if (data.containsKey('subject_sub_name')) {
      context.handle(
        _subjectSubNameMeta,
        subjectSubName.isAcceptableOrUnknown(
          data['subject_sub_name']!,
          _subjectSubNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectSubNameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('children_raw')) {
      context.handle(
        _childrenRawMeta,
        childrenRaw.isAcceptableOrUnknown(
          data['children_raw']!,
          _childrenRawMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_childrenRawMeta);
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
  TeacherSubject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherSubject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_id'],
      )!,
      teacherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_name'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      subjectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_name'],
      )!,
      subjectSubName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_sub_name'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      childrenRaw: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}children_raw'],
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
  $TeacherSubjectsTable createAlias(String alias) {
    return $TeacherSubjectsTable(attachedDatabase, alias);
  }
}

class TeacherSubject extends DataClass implements Insertable<TeacherSubject> {
  final String id;
  final String teacherId;
  final String teacherName;
  final String subjectId;
  final String subjectName;
  final String subjectSubName;
  final String? parentId;
  final String childrenRaw;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TeacherSubject({
    required this.id,
    required this.teacherId,
    required this.teacherName,
    required this.subjectId,
    required this.subjectName,
    required this.subjectSubName,
    this.parentId,
    required this.childrenRaw,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['teacher_id'] = Variable<String>(teacherId);
    map['teacher_name'] = Variable<String>(teacherName);
    map['subject_id'] = Variable<String>(subjectId);
    map['subject_name'] = Variable<String>(subjectName);
    map['subject_sub_name'] = Variable<String>(subjectSubName);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['children_raw'] = Variable<String>(childrenRaw);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TeacherSubjectsCompanion toCompanion(bool nullToAbsent) {
    return TeacherSubjectsCompanion(
      id: Value(id),
      teacherId: Value(teacherId),
      teacherName: Value(teacherName),
      subjectId: Value(subjectId),
      subjectName: Value(subjectName),
      subjectSubName: Value(subjectSubName),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      childrenRaw: Value(childrenRaw),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TeacherSubject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherSubject(
      id: serializer.fromJson<String>(json['id']),
      teacherId: serializer.fromJson<String>(json['teacherId']),
      teacherName: serializer.fromJson<String>(json['teacherName']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      subjectName: serializer.fromJson<String>(json['subjectName']),
      subjectSubName: serializer.fromJson<String>(json['subjectSubName']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      childrenRaw: serializer.fromJson<String>(json['childrenRaw']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'teacherId': serializer.toJson<String>(teacherId),
      'teacherName': serializer.toJson<String>(teacherName),
      'subjectId': serializer.toJson<String>(subjectId),
      'subjectName': serializer.toJson<String>(subjectName),
      'subjectSubName': serializer.toJson<String>(subjectSubName),
      'parentId': serializer.toJson<String?>(parentId),
      'childrenRaw': serializer.toJson<String>(childrenRaw),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TeacherSubject copyWith({
    String? id,
    String? teacherId,
    String? teacherName,
    String? subjectId,
    String? subjectName,
    String? subjectSubName,
    Value<String?> parentId = const Value.absent(),
    String? childrenRaw,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TeacherSubject(
    id: id ?? this.id,
    teacherId: teacherId ?? this.teacherId,
    teacherName: teacherName ?? this.teacherName,
    subjectId: subjectId ?? this.subjectId,
    subjectName: subjectName ?? this.subjectName,
    subjectSubName: subjectSubName ?? this.subjectSubName,
    parentId: parentId.present ? parentId.value : this.parentId,
    childrenRaw: childrenRaw ?? this.childrenRaw,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TeacherSubject copyWithCompanion(TeacherSubjectsCompanion data) {
    return TeacherSubject(
      id: data.id.present ? data.id.value : this.id,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      teacherName: data.teacherName.present
          ? data.teacherName.value
          : this.teacherName,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      subjectName: data.subjectName.present
          ? data.subjectName.value
          : this.subjectName,
      subjectSubName: data.subjectSubName.present
          ? data.subjectSubName.value
          : this.subjectSubName,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      childrenRaw: data.childrenRaw.present
          ? data.childrenRaw.value
          : this.childrenRaw,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherSubject(')
          ..write('id: $id, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('subjectId: $subjectId, ')
          ..write('subjectName: $subjectName, ')
          ..write('subjectSubName: $subjectSubName, ')
          ..write('parentId: $parentId, ')
          ..write('childrenRaw: $childrenRaw, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    teacherId,
    teacherName,
    subjectId,
    subjectName,
    subjectSubName,
    parentId,
    childrenRaw,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherSubject &&
          other.id == this.id &&
          other.teacherId == this.teacherId &&
          other.teacherName == this.teacherName &&
          other.subjectId == this.subjectId &&
          other.subjectName == this.subjectName &&
          other.subjectSubName == this.subjectSubName &&
          other.parentId == this.parentId &&
          other.childrenRaw == this.childrenRaw &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TeacherSubjectsCompanion extends UpdateCompanion<TeacherSubject> {
  final Value<String> id;
  final Value<String> teacherId;
  final Value<String> teacherName;
  final Value<String> subjectId;
  final Value<String> subjectName;
  final Value<String> subjectSubName;
  final Value<String?> parentId;
  final Value<String> childrenRaw;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TeacherSubjectsCompanion({
    this.id = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.subjectSubName = const Value.absent(),
    this.parentId = const Value.absent(),
    this.childrenRaw = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TeacherSubjectsCompanion.insert({
    required String id,
    required String teacherId,
    required String teacherName,
    required String subjectId,
    required String subjectName,
    required String subjectSubName,
    this.parentId = const Value.absent(),
    required String childrenRaw,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       teacherId = Value(teacherId),
       teacherName = Value(teacherName),
       subjectId = Value(subjectId),
       subjectName = Value(subjectName),
       subjectSubName = Value(subjectSubName),
       childrenRaw = Value(childrenRaw),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TeacherSubject> custom({
    Expression<String>? id,
    Expression<String>? teacherId,
    Expression<String>? teacherName,
    Expression<String>? subjectId,
    Expression<String>? subjectName,
    Expression<String>? subjectSubName,
    Expression<String>? parentId,
    Expression<String>? childrenRaw,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teacherId != null) 'teacher_id': teacherId,
      if (teacherName != null) 'teacher_name': teacherName,
      if (subjectId != null) 'subject_id': subjectId,
      if (subjectName != null) 'subject_name': subjectName,
      if (subjectSubName != null) 'subject_sub_name': subjectSubName,
      if (parentId != null) 'parent_id': parentId,
      if (childrenRaw != null) 'children_raw': childrenRaw,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TeacherSubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? teacherId,
    Value<String>? teacherName,
    Value<String>? subjectId,
    Value<String>? subjectName,
    Value<String>? subjectSubName,
    Value<String?>? parentId,
    Value<String>? childrenRaw,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return TeacherSubjectsCompanion(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      subjectSubName: subjectSubName ?? this.subjectSubName,
      parentId: parentId ?? this.parentId,
      childrenRaw: childrenRaw ?? this.childrenRaw,
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
    if (teacherId.present) {
      map['teacher_id'] = Variable<String>(teacherId.value);
    }
    if (teacherName.present) {
      map['teacher_name'] = Variable<String>(teacherName.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    if (subjectSubName.present) {
      map['subject_sub_name'] = Variable<String>(subjectSubName.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (childrenRaw.present) {
      map['children_raw'] = Variable<String>(childrenRaw.value);
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
    return (StringBuffer('TeacherSubjectsCompanion(')
          ..write('id: $id, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('subjectId: $subjectId, ')
          ..write('subjectName: $subjectName, ')
          ..write('subjectSubName: $subjectSubName, ')
          ..write('parentId: $parentId, ')
          ..write('childrenRaw: $childrenRaw, ')
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
  late final $TeachersTable teachers = $TeachersTable(this);
  late final $StaffsTable staffs = $StaffsTable(this);
  late final $StaffPositionsTable staffPositions = $StaffPositionsTable(this);
  late final $CurriculumsTable curriculums = $CurriculumsTable(this);
  late final $SubCurriculumsTable subCurriculums = $SubCurriculumsTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $SubCurriculumSubjectsTable subCurriculumSubjects =
      $SubCurriculumSubjectsTable(this);
  late final $TeacherSubjectsTable teacherSubjects = $TeacherSubjectsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    schoolAdmins,
    schoolLevels,
    teachers,
    staffs,
    staffPositions,
    curriculums,
    subCurriculums,
    subjects,
    subCurriculumSubjects,
    teacherSubjects,
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
typedef $$TeachersTableCreateCompanionBuilder =
    TeachersCompanion Function({
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
typedef $$TeachersTableUpdateCompanionBuilder =
    TeachersCompanion Function({
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

class $$TeachersTableFilterComposer
    extends Composer<_$AppDatabase, $TeachersTable> {
  $$TeachersTableFilterComposer({
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

class $$TeachersTableOrderingComposer
    extends Composer<_$AppDatabase, $TeachersTable> {
  $$TeachersTableOrderingComposer({
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

class $$TeachersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeachersTable> {
  $$TeachersTableAnnotationComposer({
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

class $$TeachersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeachersTable,
          Teacher,
          $$TeachersTableFilterComposer,
          $$TeachersTableOrderingComposer,
          $$TeachersTableAnnotationComposer,
          $$TeachersTableCreateCompanionBuilder,
          $$TeachersTableUpdateCompanionBuilder,
          (Teacher, BaseReferences<_$AppDatabase, $TeachersTable, Teacher>),
          Teacher,
          PrefetchHooks Function()
        > {
  $$TeachersTableTableManager(_$AppDatabase db, $TeachersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeachersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeachersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeachersTableAnnotationComposer($db: db, $table: table),
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
              }) => TeachersCompanion(
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
              }) => TeachersCompanion.insert(
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

typedef $$TeachersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeachersTable,
      Teacher,
      $$TeachersTableFilterComposer,
      $$TeachersTableOrderingComposer,
      $$TeachersTableAnnotationComposer,
      $$TeachersTableCreateCompanionBuilder,
      $$TeachersTableUpdateCompanionBuilder,
      (Teacher, BaseReferences<_$AppDatabase, $TeachersTable, Teacher>),
      Teacher,
      PrefetchHooks Function()
    >;
typedef $$StaffsTableCreateCompanionBuilder =
    StaffsCompanion Function({
      required String id,
      required String schoolId,
      required DateTime dob,
      required String birthPlace,
      required String nik,
      Value<String?> nip,
      required String staffPositionId,
      required String staffPositionName,
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
typedef $$StaffsTableUpdateCompanionBuilder =
    StaffsCompanion Function({
      Value<String> id,
      Value<String> schoolId,
      Value<DateTime> dob,
      Value<String> birthPlace,
      Value<String> nik,
      Value<String?> nip,
      Value<String> staffPositionId,
      Value<String> staffPositionName,
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

class $$StaffsTableFilterComposer
    extends Composer<_$AppDatabase, $StaffsTable> {
  $$StaffsTableFilterComposer({
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

  ColumnFilters<String> get staffPositionId => $composableBuilder(
    column: $table.staffPositionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get staffPositionName => $composableBuilder(
    column: $table.staffPositionName,
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

class $$StaffsTableOrderingComposer
    extends Composer<_$AppDatabase, $StaffsTable> {
  $$StaffsTableOrderingComposer({
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

  ColumnOrderings<String> get staffPositionId => $composableBuilder(
    column: $table.staffPositionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get staffPositionName => $composableBuilder(
    column: $table.staffPositionName,
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

class $$StaffsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StaffsTable> {
  $$StaffsTableAnnotationComposer({
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

  GeneratedColumn<String> get staffPositionId => $composableBuilder(
    column: $table.staffPositionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get staffPositionName => $composableBuilder(
    column: $table.staffPositionName,
    builder: (column) => column,
  );

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

class $$StaffsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StaffsTable,
          Staff,
          $$StaffsTableFilterComposer,
          $$StaffsTableOrderingComposer,
          $$StaffsTableAnnotationComposer,
          $$StaffsTableCreateCompanionBuilder,
          $$StaffsTableUpdateCompanionBuilder,
          (Staff, BaseReferences<_$AppDatabase, $StaffsTable, Staff>),
          Staff,
          PrefetchHooks Function()
        > {
  $$StaffsTableTableManager(_$AppDatabase db, $StaffsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<DateTime> dob = const Value.absent(),
                Value<String> birthPlace = const Value.absent(),
                Value<String> nik = const Value.absent(),
                Value<String?> nip = const Value.absent(),
                Value<String> staffPositionId = const Value.absent(),
                Value<String> staffPositionName = const Value.absent(),
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
              }) => StaffsCompanion(
                id: id,
                schoolId: schoolId,
                dob: dob,
                birthPlace: birthPlace,
                nik: nik,
                nip: nip,
                staffPositionId: staffPositionId,
                staffPositionName: staffPositionName,
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
                required String staffPositionId,
                required String staffPositionName,
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
              }) => StaffsCompanion.insert(
                id: id,
                schoolId: schoolId,
                dob: dob,
                birthPlace: birthPlace,
                nik: nik,
                nip: nip,
                staffPositionId: staffPositionId,
                staffPositionName: staffPositionName,
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

typedef $$StaffsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StaffsTable,
      Staff,
      $$StaffsTableFilterComposer,
      $$StaffsTableOrderingComposer,
      $$StaffsTableAnnotationComposer,
      $$StaffsTableCreateCompanionBuilder,
      $$StaffsTableUpdateCompanionBuilder,
      (Staff, BaseReferences<_$AppDatabase, $StaffsTable, Staff>),
      Staff,
      PrefetchHooks Function()
    >;
typedef $$StaffPositionsTableCreateCompanionBuilder =
    StaffPositionsCompanion Function({
      required String id,
      required String schoolId,
      required String name,
      required String description,
      required bool isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$StaffPositionsTableUpdateCompanionBuilder =
    StaffPositionsCompanion Function({
      Value<String> id,
      Value<String> schoolId,
      Value<String> name,
      Value<String> description,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$StaffPositionsTableFilterComposer
    extends Composer<_$AppDatabase, $StaffPositionsTable> {
  $$StaffPositionsTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
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

class $$StaffPositionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StaffPositionsTable> {
  $$StaffPositionsTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
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

class $$StaffPositionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StaffPositionsTable> {
  $$StaffPositionsTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$StaffPositionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StaffPositionsTable,
          StaffPosition,
          $$StaffPositionsTableFilterComposer,
          $$StaffPositionsTableOrderingComposer,
          $$StaffPositionsTableAnnotationComposer,
          $$StaffPositionsTableCreateCompanionBuilder,
          $$StaffPositionsTableUpdateCompanionBuilder,
          (
            StaffPosition,
            BaseReferences<_$AppDatabase, $StaffPositionsTable, StaffPosition>,
          ),
          StaffPosition,
          PrefetchHooks Function()
        > {
  $$StaffPositionsTableTableManager(
    _$AppDatabase db,
    $StaffPositionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffPositionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffPositionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffPositionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StaffPositionsCompanion(
                id: id,
                schoolId: schoolId,
                name: name,
                description: description,
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
                required String description,
                required bool isActive,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => StaffPositionsCompanion.insert(
                id: id,
                schoolId: schoolId,
                name: name,
                description: description,
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

typedef $$StaffPositionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StaffPositionsTable,
      StaffPosition,
      $$StaffPositionsTableFilterComposer,
      $$StaffPositionsTableOrderingComposer,
      $$StaffPositionsTableAnnotationComposer,
      $$StaffPositionsTableCreateCompanionBuilder,
      $$StaffPositionsTableUpdateCompanionBuilder,
      (
        StaffPosition,
        BaseReferences<_$AppDatabase, $StaffPositionsTable, StaffPosition>,
      ),
      StaffPosition,
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
typedef $$SubCurriculumsTableCreateCompanionBuilder =
    SubCurriculumsCompanion Function({
      required String id,
      required String curriculumId,
      required String schoolLevelId,
      required String schoolLevelName,
      required String subjects,
      required int minutesPerJp,
      required String name,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SubCurriculumsTableUpdateCompanionBuilder =
    SubCurriculumsCompanion Function({
      Value<String> id,
      Value<String> curriculumId,
      Value<String> schoolLevelId,
      Value<String> schoolLevelName,
      Value<String> subjects,
      Value<int> minutesPerJp,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SubCurriculumsTableFilterComposer
    extends Composer<_$AppDatabase, $SubCurriculumsTable> {
  $$SubCurriculumsTableFilterComposer({
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

  ColumnFilters<String> get curriculumId => $composableBuilder(
    column: $table.curriculumId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolLevelId => $composableBuilder(
    column: $table.schoolLevelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolLevelName => $composableBuilder(
    column: $table.schoolLevelName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjects => $composableBuilder(
    column: $table.subjects,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutesPerJp => $composableBuilder(
    column: $table.minutesPerJp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
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

class $$SubCurriculumsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubCurriculumsTable> {
  $$SubCurriculumsTableOrderingComposer({
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

  ColumnOrderings<String> get curriculumId => $composableBuilder(
    column: $table.curriculumId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolLevelId => $composableBuilder(
    column: $table.schoolLevelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolLevelName => $composableBuilder(
    column: $table.schoolLevelName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjects => $composableBuilder(
    column: $table.subjects,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutesPerJp => $composableBuilder(
    column: $table.minutesPerJp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
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

class $$SubCurriculumsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubCurriculumsTable> {
  $$SubCurriculumsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get curriculumId => $composableBuilder(
    column: $table.curriculumId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schoolLevelId => $composableBuilder(
    column: $table.schoolLevelId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schoolLevelName => $composableBuilder(
    column: $table.schoolLevelName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subjects =>
      $composableBuilder(column: $table.subjects, builder: (column) => column);

  GeneratedColumn<int> get minutesPerJp => $composableBuilder(
    column: $table.minutesPerJp,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubCurriculumsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubCurriculumsTable,
          SubCurriculum,
          $$SubCurriculumsTableFilterComposer,
          $$SubCurriculumsTableOrderingComposer,
          $$SubCurriculumsTableAnnotationComposer,
          $$SubCurriculumsTableCreateCompanionBuilder,
          $$SubCurriculumsTableUpdateCompanionBuilder,
          (
            SubCurriculum,
            BaseReferences<_$AppDatabase, $SubCurriculumsTable, SubCurriculum>,
          ),
          SubCurriculum,
          PrefetchHooks Function()
        > {
  $$SubCurriculumsTableTableManager(
    _$AppDatabase db,
    $SubCurriculumsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubCurriculumsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubCurriculumsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubCurriculumsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> curriculumId = const Value.absent(),
                Value<String> schoolLevelId = const Value.absent(),
                Value<String> schoolLevelName = const Value.absent(),
                Value<String> subjects = const Value.absent(),
                Value<int> minutesPerJp = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubCurriculumsCompanion(
                id: id,
                curriculumId: curriculumId,
                schoolLevelId: schoolLevelId,
                schoolLevelName: schoolLevelName,
                subjects: subjects,
                minutesPerJp: minutesPerJp,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String curriculumId,
                required String schoolLevelId,
                required String schoolLevelName,
                required String subjects,
                required int minutesPerJp,
                required String name,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SubCurriculumsCompanion.insert(
                id: id,
                curriculumId: curriculumId,
                schoolLevelId: schoolLevelId,
                schoolLevelName: schoolLevelName,
                subjects: subjects,
                minutesPerJp: minutesPerJp,
                name: name,
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

typedef $$SubCurriculumsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubCurriculumsTable,
      SubCurriculum,
      $$SubCurriculumsTableFilterComposer,
      $$SubCurriculumsTableOrderingComposer,
      $$SubCurriculumsTableAnnotationComposer,
      $$SubCurriculumsTableCreateCompanionBuilder,
      $$SubCurriculumsTableUpdateCompanionBuilder,
      (
        SubCurriculum,
        BaseReferences<_$AppDatabase, $SubCurriculumsTable, SubCurriculum>,
      ),
      SubCurriculum,
      PrefetchHooks Function()
    >;
typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      required String id,
      required String name,
      required String subName,
      required String schoolId,
      required String schoolLevelAccess,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> subName,
      Value<String> schoolId,
      Value<String> schoolLevelAccess,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subName => $composableBuilder(
    column: $table.subName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
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

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subName => $composableBuilder(
    column: $table.subName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
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

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get subName =>
      $composableBuilder(column: $table.subName, builder: (column) => column);

  GeneratedColumn<String> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<String> get schoolLevelAccess => $composableBuilder(
    column: $table.schoolLevelAccess,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
          Subject,
          PrefetchHooks Function()
        > {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> subName = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<String> schoolLevelAccess = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion(
                id: id,
                name: name,
                subName: subName,
                schoolId: schoolId,
                schoolLevelAccess: schoolLevelAccess,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String subName,
                required String schoolId,
                required String schoolLevelAccess,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                name: name,
                subName: subName,
                schoolId: schoolId,
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

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
      Subject,
      PrefetchHooks Function()
    >;
typedef $$SubCurriculumSubjectsTableCreateCompanionBuilder =
    SubCurriculumSubjectsCompanion Function({
      required String id,
      required String subjectId,
      required String subjectName,
      required int hoursPerWeek,
      required String subCurriculumId,
      Value<String?> syllabus,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SubCurriculumSubjectsTableUpdateCompanionBuilder =
    SubCurriculumSubjectsCompanion Function({
      Value<String> id,
      Value<String> subjectId,
      Value<String> subjectName,
      Value<int> hoursPerWeek,
      Value<String> subCurriculumId,
      Value<String?> syllabus,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SubCurriculumSubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubCurriculumSubjectsTable> {
  $$SubCurriculumSubjectsTableFilterComposer({
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

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hoursPerWeek => $composableBuilder(
    column: $table.hoursPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subCurriculumId => $composableBuilder(
    column: $table.subCurriculumId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syllabus => $composableBuilder(
    column: $table.syllabus,
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

class $$SubCurriculumSubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubCurriculumSubjectsTable> {
  $$SubCurriculumSubjectsTableOrderingComposer({
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

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hoursPerWeek => $composableBuilder(
    column: $table.hoursPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subCurriculumId => $composableBuilder(
    column: $table.subCurriculumId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syllabus => $composableBuilder(
    column: $table.syllabus,
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

class $$SubCurriculumSubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubCurriculumSubjectsTable> {
  $$SubCurriculumSubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hoursPerWeek => $composableBuilder(
    column: $table.hoursPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subCurriculumId => $composableBuilder(
    column: $table.subCurriculumId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syllabus =>
      $composableBuilder(column: $table.syllabus, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubCurriculumSubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubCurriculumSubjectsTable,
          SubCurriculumSubject,
          $$SubCurriculumSubjectsTableFilterComposer,
          $$SubCurriculumSubjectsTableOrderingComposer,
          $$SubCurriculumSubjectsTableAnnotationComposer,
          $$SubCurriculumSubjectsTableCreateCompanionBuilder,
          $$SubCurriculumSubjectsTableUpdateCompanionBuilder,
          (
            SubCurriculumSubject,
            BaseReferences<
              _$AppDatabase,
              $SubCurriculumSubjectsTable,
              SubCurriculumSubject
            >,
          ),
          SubCurriculumSubject,
          PrefetchHooks Function()
        > {
  $$SubCurriculumSubjectsTableTableManager(
    _$AppDatabase db,
    $SubCurriculumSubjectsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubCurriculumSubjectsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SubCurriculumSubjectsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SubCurriculumSubjectsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<String> subjectName = const Value.absent(),
                Value<int> hoursPerWeek = const Value.absent(),
                Value<String> subCurriculumId = const Value.absent(),
                Value<String?> syllabus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubCurriculumSubjectsCompanion(
                id: id,
                subjectId: subjectId,
                subjectName: subjectName,
                hoursPerWeek: hoursPerWeek,
                subCurriculumId: subCurriculumId,
                syllabus: syllabus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required String subjectName,
                required int hoursPerWeek,
                required String subCurriculumId,
                Value<String?> syllabus = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SubCurriculumSubjectsCompanion.insert(
                id: id,
                subjectId: subjectId,
                subjectName: subjectName,
                hoursPerWeek: hoursPerWeek,
                subCurriculumId: subCurriculumId,
                syllabus: syllabus,
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

typedef $$SubCurriculumSubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubCurriculumSubjectsTable,
      SubCurriculumSubject,
      $$SubCurriculumSubjectsTableFilterComposer,
      $$SubCurriculumSubjectsTableOrderingComposer,
      $$SubCurriculumSubjectsTableAnnotationComposer,
      $$SubCurriculumSubjectsTableCreateCompanionBuilder,
      $$SubCurriculumSubjectsTableUpdateCompanionBuilder,
      (
        SubCurriculumSubject,
        BaseReferences<
          _$AppDatabase,
          $SubCurriculumSubjectsTable,
          SubCurriculumSubject
        >,
      ),
      SubCurriculumSubject,
      PrefetchHooks Function()
    >;
typedef $$TeacherSubjectsTableCreateCompanionBuilder =
    TeacherSubjectsCompanion Function({
      required String id,
      required String teacherId,
      required String teacherName,
      required String subjectId,
      required String subjectName,
      required String subjectSubName,
      Value<String?> parentId,
      required String childrenRaw,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$TeacherSubjectsTableUpdateCompanionBuilder =
    TeacherSubjectsCompanion Function({
      Value<String> id,
      Value<String> teacherId,
      Value<String> teacherName,
      Value<String> subjectId,
      Value<String> subjectName,
      Value<String> subjectSubName,
      Value<String?> parentId,
      Value<String> childrenRaw,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$TeacherSubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $TeacherSubjectsTable> {
  $$TeacherSubjectsTableFilterComposer({
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

  ColumnFilters<String> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectSubName => $composableBuilder(
    column: $table.subjectSubName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childrenRaw => $composableBuilder(
    column: $table.childrenRaw,
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

class $$TeacherSubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $TeacherSubjectsTable> {
  $$TeacherSubjectsTableOrderingComposer({
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

  ColumnOrderings<String> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectSubName => $composableBuilder(
    column: $table.subjectSubName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childrenRaw => $composableBuilder(
    column: $table.childrenRaw,
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

class $$TeacherSubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeacherSubjectsTable> {
  $$TeacherSubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subjectSubName => $composableBuilder(
    column: $table.subjectSubName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get childrenRaw => $composableBuilder(
    column: $table.childrenRaw,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TeacherSubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeacherSubjectsTable,
          TeacherSubject,
          $$TeacherSubjectsTableFilterComposer,
          $$TeacherSubjectsTableOrderingComposer,
          $$TeacherSubjectsTableAnnotationComposer,
          $$TeacherSubjectsTableCreateCompanionBuilder,
          $$TeacherSubjectsTableUpdateCompanionBuilder,
          (
            TeacherSubject,
            BaseReferences<
              _$AppDatabase,
              $TeacherSubjectsTable,
              TeacherSubject
            >,
          ),
          TeacherSubject,
          PrefetchHooks Function()
        > {
  $$TeacherSubjectsTableTableManager(
    _$AppDatabase db,
    $TeacherSubjectsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeacherSubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeacherSubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeacherSubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> teacherId = const Value.absent(),
                Value<String> teacherName = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<String> subjectName = const Value.absent(),
                Value<String> subjectSubName = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String> childrenRaw = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TeacherSubjectsCompanion(
                id: id,
                teacherId: teacherId,
                teacherName: teacherName,
                subjectId: subjectId,
                subjectName: subjectName,
                subjectSubName: subjectSubName,
                parentId: parentId,
                childrenRaw: childrenRaw,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String teacherId,
                required String teacherName,
                required String subjectId,
                required String subjectName,
                required String subjectSubName,
                Value<String?> parentId = const Value.absent(),
                required String childrenRaw,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TeacherSubjectsCompanion.insert(
                id: id,
                teacherId: teacherId,
                teacherName: teacherName,
                subjectId: subjectId,
                subjectName: subjectName,
                subjectSubName: subjectSubName,
                parentId: parentId,
                childrenRaw: childrenRaw,
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

typedef $$TeacherSubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeacherSubjectsTable,
      TeacherSubject,
      $$TeacherSubjectsTableFilterComposer,
      $$TeacherSubjectsTableOrderingComposer,
      $$TeacherSubjectsTableAnnotationComposer,
      $$TeacherSubjectsTableCreateCompanionBuilder,
      $$TeacherSubjectsTableUpdateCompanionBuilder,
      (
        TeacherSubject,
        BaseReferences<_$AppDatabase, $TeacherSubjectsTable, TeacherSubject>,
      ),
      TeacherSubject,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SchoolAdminsTableTableManager get schoolAdmins =>
      $$SchoolAdminsTableTableManager(_db, _db.schoolAdmins);
  $$SchoolLevelsTableTableManager get schoolLevels =>
      $$SchoolLevelsTableTableManager(_db, _db.schoolLevels);
  $$TeachersTableTableManager get teachers =>
      $$TeachersTableTableManager(_db, _db.teachers);
  $$StaffsTableTableManager get staffs =>
      $$StaffsTableTableManager(_db, _db.staffs);
  $$StaffPositionsTableTableManager get staffPositions =>
      $$StaffPositionsTableTableManager(_db, _db.staffPositions);
  $$CurriculumsTableTableManager get curriculums =>
      $$CurriculumsTableTableManager(_db, _db.curriculums);
  $$SubCurriculumsTableTableManager get subCurriculums =>
      $$SubCurriculumsTableTableManager(_db, _db.subCurriculums);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$SubCurriculumSubjectsTableTableManager get subCurriculumSubjects =>
      $$SubCurriculumSubjectsTableTableManager(_db, _db.subCurriculumSubjects);
  $$TeacherSubjectsTableTableManager get teacherSubjects =>
      $$TeacherSubjectsTableTableManager(_db, _db.teacherSubjects);
}
