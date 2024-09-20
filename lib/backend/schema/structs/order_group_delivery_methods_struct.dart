// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderGroupDeliveryMethodsStruct extends BaseStruct {
  OrderGroupDeliveryMethodsStruct({
    int? methodId,
    int? methodTypeId,
    String? methodTypeName,
    int? methodMappingId,
    String? methodTypeNameArabic,
    String? methodTypeNameKurdish,
  })  : _methodId = methodId,
        _methodTypeId = methodTypeId,
        _methodTypeName = methodTypeName,
        _methodMappingId = methodMappingId,
        _methodTypeNameArabic = methodTypeNameArabic,
        _methodTypeNameKurdish = methodTypeNameKurdish;

  // "methodId" field.
  int? _methodId;
  int get methodId => _methodId ?? 0;
  set methodId(int? val) => _methodId = val;

  void incrementMethodId(int amount) => methodId = methodId + amount;

  bool hasMethodId() => _methodId != null;

  // "methodTypeId" field.
  int? _methodTypeId;
  int get methodTypeId => _methodTypeId ?? 0;
  set methodTypeId(int? val) => _methodTypeId = val;

  void incrementMethodTypeId(int amount) =>
      methodTypeId = methodTypeId + amount;

  bool hasMethodTypeId() => _methodTypeId != null;

  // "methodTypeName" field.
  String? _methodTypeName;
  String get methodTypeName => _methodTypeName ?? '';
  set methodTypeName(String? val) => _methodTypeName = val;

  bool hasMethodTypeName() => _methodTypeName != null;

  // "methodMappingId" field.
  int? _methodMappingId;
  int get methodMappingId => _methodMappingId ?? 0;
  set methodMappingId(int? val) => _methodMappingId = val;

  void incrementMethodMappingId(int amount) =>
      methodMappingId = methodMappingId + amount;

  bool hasMethodMappingId() => _methodMappingId != null;

  // "methodTypeNameArabic" field.
  String? _methodTypeNameArabic;
  String get methodTypeNameArabic => _methodTypeNameArabic ?? '';
  set methodTypeNameArabic(String? val) => _methodTypeNameArabic = val;

  bool hasMethodTypeNameArabic() => _methodTypeNameArabic != null;

  // "methodTypeNameKurdish" field.
  String? _methodTypeNameKurdish;
  String get methodTypeNameKurdish => _methodTypeNameKurdish ?? '';
  set methodTypeNameKurdish(String? val) => _methodTypeNameKurdish = val;

  bool hasMethodTypeNameKurdish() => _methodTypeNameKurdish != null;

  static OrderGroupDeliveryMethodsStruct fromMap(Map<String, dynamic> data) =>
      OrderGroupDeliveryMethodsStruct(
        methodId: castToType<int>(data['methodId']),
        methodTypeId: castToType<int>(data['methodTypeId']),
        methodTypeName: data['methodTypeName'] as String?,
        methodMappingId: castToType<int>(data['methodMappingId']),
        methodTypeNameArabic: data['methodTypeNameArabic'] as String?,
        methodTypeNameKurdish: data['methodTypeNameKurdish'] as String?,
      );

  static OrderGroupDeliveryMethodsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? OrderGroupDeliveryMethodsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'methodId': _methodId,
        'methodTypeId': _methodTypeId,
        'methodTypeName': _methodTypeName,
        'methodMappingId': _methodMappingId,
        'methodTypeNameArabic': _methodTypeNameArabic,
        'methodTypeNameKurdish': _methodTypeNameKurdish,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'methodId': serializeParam(
          _methodId,
          ParamType.int,
        ),
        'methodTypeId': serializeParam(
          _methodTypeId,
          ParamType.int,
        ),
        'methodTypeName': serializeParam(
          _methodTypeName,
          ParamType.String,
        ),
        'methodMappingId': serializeParam(
          _methodMappingId,
          ParamType.int,
        ),
        'methodTypeNameArabic': serializeParam(
          _methodTypeNameArabic,
          ParamType.String,
        ),
        'methodTypeNameKurdish': serializeParam(
          _methodTypeNameKurdish,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderGroupDeliveryMethodsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrderGroupDeliveryMethodsStruct(
        methodId: deserializeParam(
          data['methodId'],
          ParamType.int,
          false,
        ),
        methodTypeId: deserializeParam(
          data['methodTypeId'],
          ParamType.int,
          false,
        ),
        methodTypeName: deserializeParam(
          data['methodTypeName'],
          ParamType.String,
          false,
        ),
        methodMappingId: deserializeParam(
          data['methodMappingId'],
          ParamType.int,
          false,
        ),
        methodTypeNameArabic: deserializeParam(
          data['methodTypeNameArabic'],
          ParamType.String,
          false,
        ),
        methodTypeNameKurdish: deserializeParam(
          data['methodTypeNameKurdish'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrderGroupDeliveryMethodsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderGroupDeliveryMethodsStruct &&
        methodId == other.methodId &&
        methodTypeId == other.methodTypeId &&
        methodTypeName == other.methodTypeName &&
        methodMappingId == other.methodMappingId &&
        methodTypeNameArabic == other.methodTypeNameArabic &&
        methodTypeNameKurdish == other.methodTypeNameKurdish;
  }

  @override
  int get hashCode => const ListEquality().hash([
        methodId,
        methodTypeId,
        methodTypeName,
        methodMappingId,
        methodTypeNameArabic,
        methodTypeNameKurdish
      ]);
}

OrderGroupDeliveryMethodsStruct createOrderGroupDeliveryMethodsStruct({
  int? methodId,
  int? methodTypeId,
  String? methodTypeName,
  int? methodMappingId,
  String? methodTypeNameArabic,
  String? methodTypeNameKurdish,
}) =>
    OrderGroupDeliveryMethodsStruct(
      methodId: methodId,
      methodTypeId: methodTypeId,
      methodTypeName: methodTypeName,
      methodMappingId: methodMappingId,
      methodTypeNameArabic: methodTypeNameArabic,
      methodTypeNameKurdish: methodTypeNameKurdish,
    );
