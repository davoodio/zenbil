// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentTypesStruct extends BaseStruct {
  PaymentTypesStruct({
    String? name,
    PaymentTypes? type,
  })  : _name = name,
        _type = type;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "type" field.
  PaymentTypes? _type;
  PaymentTypes? get type => _type;
  set type(PaymentTypes? val) => _type = val;

  bool hasType() => _type != null;

  static PaymentTypesStruct fromMap(Map<String, dynamic> data) =>
      PaymentTypesStruct(
        name: data['name'] as String?,
        type: deserializeEnum<PaymentTypes>(data['type']),
      );

  static PaymentTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static PaymentTypesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentTypesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<PaymentTypes>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'PaymentTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentTypesStruct &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([name, type]);
}

PaymentTypesStruct createPaymentTypesStruct({
  String? name,
  PaymentTypes? type,
}) =>
    PaymentTypesStruct(
      name: name,
      type: type,
    );
