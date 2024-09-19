// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleStruct extends BaseStruct {
  RoleStruct({
    String? name,
    bool? fullAccess,
    bool? accountantAccess,
    bool? deliveryAccess,
    bool? readOnly,
    int? id,
    String? code,
  })  : _name = name,
        _fullAccess = fullAccess,
        _accountantAccess = accountantAccess,
        _deliveryAccess = deliveryAccess,
        _readOnly = readOnly,
        _id = id,
        _code = code;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "full_access" field.
  bool? _fullAccess;
  bool get fullAccess => _fullAccess ?? false;
  set fullAccess(bool? val) => _fullAccess = val;

  bool hasFullAccess() => _fullAccess != null;

  // "accountant_access" field.
  bool? _accountantAccess;
  bool get accountantAccess => _accountantAccess ?? false;
  set accountantAccess(bool? val) => _accountantAccess = val;

  bool hasAccountantAccess() => _accountantAccess != null;

  // "delivery_access" field.
  bool? _deliveryAccess;
  bool get deliveryAccess => _deliveryAccess ?? false;
  set deliveryAccess(bool? val) => _deliveryAccess = val;

  bool hasDeliveryAccess() => _deliveryAccess != null;

  // "read_only" field.
  bool? _readOnly;
  bool get readOnly => _readOnly ?? false;
  set readOnly(bool? val) => _readOnly = val;

  bool hasReadOnly() => _readOnly != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static RoleStruct fromMap(Map<String, dynamic> data) => RoleStruct(
        name: data['name'] as String?,
        fullAccess: data['full_access'] as bool?,
        accountantAccess: data['accountant_access'] as bool?,
        deliveryAccess: data['delivery_access'] as bool?,
        readOnly: data['read_only'] as bool?,
        id: castToType<int>(data['id']),
        code: data['code'] as String?,
      );

  static RoleStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'full_access': _fullAccess,
        'accountant_access': _accountantAccess,
        'delivery_access': _deliveryAccess,
        'read_only': _readOnly,
        'id': _id,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'full_access': serializeParam(
          _fullAccess,
          ParamType.bool,
        ),
        'accountant_access': serializeParam(
          _accountantAccess,
          ParamType.bool,
        ),
        'delivery_access': serializeParam(
          _deliveryAccess,
          ParamType.bool,
        ),
        'read_only': serializeParam(
          _readOnly,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static RoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoleStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        fullAccess: deserializeParam(
          data['full_access'],
          ParamType.bool,
          false,
        ),
        accountantAccess: deserializeParam(
          data['accountant_access'],
          ParamType.bool,
          false,
        ),
        deliveryAccess: deserializeParam(
          data['delivery_access'],
          ParamType.bool,
          false,
        ),
        readOnly: deserializeParam(
          data['read_only'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoleStruct &&
        name == other.name &&
        fullAccess == other.fullAccess &&
        accountantAccess == other.accountantAccess &&
        deliveryAccess == other.deliveryAccess &&
        readOnly == other.readOnly &&
        id == other.id &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, fullAccess, accountantAccess, deliveryAccess, readOnly, id, code]);
}

RoleStruct createRoleStruct({
  String? name,
  bool? fullAccess,
  bool? accountantAccess,
  bool? deliveryAccess,
  bool? readOnly,
  int? id,
  String? code,
}) =>
    RoleStruct(
      name: name,
      fullAccess: fullAccess,
      accountantAccess: accountantAccess,
      deliveryAccess: deliveryAccess,
      readOnly: readOnly,
      id: id,
      code: code,
    );
