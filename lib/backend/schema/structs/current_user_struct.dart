// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentUserStruct extends BaseStruct {
  CurrentUserStruct({
    DateTime? createdAt,
    String? mobileNumber,
    String? firstName,
    String? lastName,
    String? displayName,
    DateTime? lastLoginDate,
    String? bio,
    String? address,
    int? cityId,
    bool? isAnon,
    String? email,
    int? defaultPaymentTypeId,
    int? defaultAddressId,
    int? countryId,
    String? userName,
    String? gender,
    DateTime? birthDate,
    int? role,
    String? authProvider,
    int? defaultDeliveryMethod,
    String? userType,
    String? location,
    String? avatarUrl,
  })  : _createdAt = createdAt,
        _mobileNumber = mobileNumber,
        _firstName = firstName,
        _lastName = lastName,
        _displayName = displayName,
        _lastLoginDate = lastLoginDate,
        _bio = bio,
        _address = address,
        _cityId = cityId,
        _isAnon = isAnon,
        _email = email,
        _defaultPaymentTypeId = defaultPaymentTypeId,
        _defaultAddressId = defaultAddressId,
        _countryId = countryId,
        _userName = userName,
        _gender = gender,
        _birthDate = birthDate,
        _role = role,
        _authProvider = authProvider,
        _defaultDeliveryMethod = defaultDeliveryMethod,
        _userType = userType,
        _location = location,
        _avatarUrl = avatarUrl;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "mobile_number" field.
  String? _mobileNumber;
  String get mobileNumber => _mobileNumber ?? '';
  set mobileNumber(String? val) => _mobileNumber = val;

  bool hasMobileNumber() => _mobileNumber != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "last_login_date" field.
  DateTime? _lastLoginDate;
  DateTime? get lastLoginDate => _lastLoginDate;
  set lastLoginDate(DateTime? val) => _lastLoginDate = val;

  bool hasLastLoginDate() => _lastLoginDate != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;

  void incrementCityId(int amount) => cityId = cityId + amount;

  bool hasCityId() => _cityId != null;

  // "is_anon" field.
  bool? _isAnon;
  bool get isAnon => _isAnon ?? false;
  set isAnon(bool? val) => _isAnon = val;

  bool hasIsAnon() => _isAnon != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "default_payment_type_id" field.
  int? _defaultPaymentTypeId;
  int get defaultPaymentTypeId => _defaultPaymentTypeId ?? 0;
  set defaultPaymentTypeId(int? val) => _defaultPaymentTypeId = val;

  void incrementDefaultPaymentTypeId(int amount) =>
      defaultPaymentTypeId = defaultPaymentTypeId + amount;

  bool hasDefaultPaymentTypeId() => _defaultPaymentTypeId != null;

  // "default_address_id" field.
  int? _defaultAddressId;
  int get defaultAddressId => _defaultAddressId ?? 0;
  set defaultAddressId(int? val) => _defaultAddressId = val;

  void incrementDefaultAddressId(int amount) =>
      defaultAddressId = defaultAddressId + amount;

  bool hasDefaultAddressId() => _defaultAddressId != null;

  // "country_id" field.
  int? _countryId;
  int get countryId => _countryId ?? 0;
  set countryId(int? val) => _countryId = val;

  void incrementCountryId(int amount) => countryId = countryId + amount;

  bool hasCountryId() => _countryId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  set birthDate(DateTime? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  set role(int? val) => _role = val;

  void incrementRole(int amount) => role = role + amount;

  bool hasRole() => _role != null;

  // "auth_provider" field.
  String? _authProvider;
  String get authProvider => _authProvider ?? '';
  set authProvider(String? val) => _authProvider = val;

  bool hasAuthProvider() => _authProvider != null;

  // "default_delivery_method" field.
  int? _defaultDeliveryMethod;
  int get defaultDeliveryMethod => _defaultDeliveryMethod ?? 0;
  set defaultDeliveryMethod(int? val) => _defaultDeliveryMethod = val;

  void incrementDefaultDeliveryMethod(int amount) =>
      defaultDeliveryMethod = defaultDeliveryMethod + amount;

  bool hasDefaultDeliveryMethod() => _defaultDeliveryMethod != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "avatar_url" field.
  String? _avatarUrl;
  String get avatarUrl => _avatarUrl ?? '';
  set avatarUrl(String? val) => _avatarUrl = val;

  bool hasAvatarUrl() => _avatarUrl != null;

  static CurrentUserStruct fromMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        createdAt: data['created_at'] as DateTime?,
        mobileNumber: data['mobile_number'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        displayName: data['display_name'] as String?,
        lastLoginDate: data['last_login_date'] as DateTime?,
        bio: data['bio'] as String?,
        address: data['address'] as String?,
        cityId: castToType<int>(data['city_id']),
        isAnon: data['is_anon'] as bool?,
        email: data['email'] as String?,
        defaultPaymentTypeId: castToType<int>(data['default_payment_type_id']),
        defaultAddressId: castToType<int>(data['default_address_id']),
        countryId: castToType<int>(data['country_id']),
        userName: data['user_name'] as String?,
        gender: data['gender'] as String?,
        birthDate: data['birth_date'] as DateTime?,
        role: castToType<int>(data['role']),
        authProvider: data['auth_provider'] as String?,
        defaultDeliveryMethod: castToType<int>(data['default_delivery_method']),
        userType: data['user_type'] as String?,
        location: data['location'] as String?,
        avatarUrl: data['avatar_url'] as String?,
      );

  static CurrentUserStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'mobile_number': _mobileNumber,
        'first_name': _firstName,
        'last_name': _lastName,
        'display_name': _displayName,
        'last_login_date': _lastLoginDate,
        'bio': _bio,
        'address': _address,
        'city_id': _cityId,
        'is_anon': _isAnon,
        'email': _email,
        'default_payment_type_id': _defaultPaymentTypeId,
        'default_address_id': _defaultAddressId,
        'country_id': _countryId,
        'user_name': _userName,
        'gender': _gender,
        'birth_date': _birthDate,
        'role': _role,
        'auth_provider': _authProvider,
        'default_delivery_method': _defaultDeliveryMethod,
        'user_type': _userType,
        'location': _location,
        'avatar_url': _avatarUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'mobile_number': serializeParam(
          _mobileNumber,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'last_login_date': serializeParam(
          _lastLoginDate,
          ParamType.DateTime,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'is_anon': serializeParam(
          _isAnon,
          ParamType.bool,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'default_payment_type_id': serializeParam(
          _defaultPaymentTypeId,
          ParamType.int,
        ),
        'default_address_id': serializeParam(
          _defaultAddressId,
          ParamType.int,
        ),
        'country_id': serializeParam(
          _countryId,
          ParamType.int,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'birth_date': serializeParam(
          _birthDate,
          ParamType.DateTime,
        ),
        'role': serializeParam(
          _role,
          ParamType.int,
        ),
        'auth_provider': serializeParam(
          _authProvider,
          ParamType.String,
        ),
        'default_delivery_method': serializeParam(
          _defaultDeliveryMethod,
          ParamType.int,
        ),
        'user_type': serializeParam(
          _userType,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'avatar_url': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static CurrentUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        mobileNumber: deserializeParam(
          data['mobile_number'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        lastLoginDate: deserializeParam(
          data['last_login_date'],
          ParamType.DateTime,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        isAnon: deserializeParam(
          data['is_anon'],
          ParamType.bool,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        defaultPaymentTypeId: deserializeParam(
          data['default_payment_type_id'],
          ParamType.int,
          false,
        ),
        defaultAddressId: deserializeParam(
          data['default_address_id'],
          ParamType.int,
          false,
        ),
        countryId: deserializeParam(
          data['country_id'],
          ParamType.int,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        birthDate: deserializeParam(
          data['birth_date'],
          ParamType.DateTime,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.int,
          false,
        ),
        authProvider: deserializeParam(
          data['auth_provider'],
          ParamType.String,
          false,
        ),
        defaultDeliveryMethod: deserializeParam(
          data['default_delivery_method'],
          ParamType.int,
          false,
        ),
        userType: deserializeParam(
          data['user_type'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        avatarUrl: deserializeParam(
          data['avatar_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CurrentUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentUserStruct &&
        createdAt == other.createdAt &&
        mobileNumber == other.mobileNumber &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        displayName == other.displayName &&
        lastLoginDate == other.lastLoginDate &&
        bio == other.bio &&
        address == other.address &&
        cityId == other.cityId &&
        isAnon == other.isAnon &&
        email == other.email &&
        defaultPaymentTypeId == other.defaultPaymentTypeId &&
        defaultAddressId == other.defaultAddressId &&
        countryId == other.countryId &&
        userName == other.userName &&
        gender == other.gender &&
        birthDate == other.birthDate &&
        role == other.role &&
        authProvider == other.authProvider &&
        defaultDeliveryMethod == other.defaultDeliveryMethod &&
        userType == other.userType &&
        location == other.location &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        mobileNumber,
        firstName,
        lastName,
        displayName,
        lastLoginDate,
        bio,
        address,
        cityId,
        isAnon,
        email,
        defaultPaymentTypeId,
        defaultAddressId,
        countryId,
        userName,
        gender,
        birthDate,
        role,
        authProvider,
        defaultDeliveryMethod,
        userType,
        location,
        avatarUrl
      ]);
}

CurrentUserStruct createCurrentUserStruct({
  DateTime? createdAt,
  String? mobileNumber,
  String? firstName,
  String? lastName,
  String? displayName,
  DateTime? lastLoginDate,
  String? bio,
  String? address,
  int? cityId,
  bool? isAnon,
  String? email,
  int? defaultPaymentTypeId,
  int? defaultAddressId,
  int? countryId,
  String? userName,
  String? gender,
  DateTime? birthDate,
  int? role,
  String? authProvider,
  int? defaultDeliveryMethod,
  String? userType,
  String? location,
  String? avatarUrl,
}) =>
    CurrentUserStruct(
      createdAt: createdAt,
      mobileNumber: mobileNumber,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
      lastLoginDate: lastLoginDate,
      bio: bio,
      address: address,
      cityId: cityId,
      isAnon: isAnon,
      email: email,
      defaultPaymentTypeId: defaultPaymentTypeId,
      defaultAddressId: defaultAddressId,
      countryId: countryId,
      userName: userName,
      gender: gender,
      birthDate: birthDate,
      role: role,
      authProvider: authProvider,
      defaultDeliveryMethod: defaultDeliveryMethod,
      userType: userType,
      location: location,
      avatarUrl: avatarUrl,
    );
