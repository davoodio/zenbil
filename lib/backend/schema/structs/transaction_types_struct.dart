// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionTypesStruct extends BaseStruct {
  TransactionTypesStruct({
    String? order,
    String? topup,
  })  : _order = order,
        _topup = topup;

  // "Order" field.
  String? _order;
  String get order => _order ?? 'Order';
  set order(String? val) => _order = val;

  bool hasOrder() => _order != null;

  // "Topup" field.
  String? _topup;
  String get topup => _topup ?? 'Topup';
  set topup(String? val) => _topup = val;

  bool hasTopup() => _topup != null;

  static TransactionTypesStruct fromMap(Map<String, dynamic> data) =>
      TransactionTypesStruct(
        order: data['Order'] as String?,
        topup: data['Topup'] as String?,
      );

  static TransactionTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Order': _order,
        'Topup': _topup,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Order': serializeParam(
          _order,
          ParamType.String,
        ),
        'Topup': serializeParam(
          _topup,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransactionTypesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TransactionTypesStruct(
        order: deserializeParam(
          data['Order'],
          ParamType.String,
          false,
        ),
        topup: deserializeParam(
          data['Topup'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransactionTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionTypesStruct &&
        order == other.order &&
        topup == other.topup;
  }

  @override
  int get hashCode => const ListEquality().hash([order, topup]);
}

TransactionTypesStruct createTransactionTypesStruct({
  String? order,
  String? topup,
}) =>
    TransactionTypesStruct(
      order: order,
      topup: topup,
    );
