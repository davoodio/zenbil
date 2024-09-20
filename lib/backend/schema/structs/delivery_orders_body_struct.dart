// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryOrdersBodyStruct extends BaseStruct {
  DeliveryOrdersBodyStruct({
    List<DeliveryOrdersStruct>? deliveryOrder,
  }) : _deliveryOrder = deliveryOrder;

  // "delivery_order" field.
  List<DeliveryOrdersStruct>? _deliveryOrder;
  List<DeliveryOrdersStruct> get deliveryOrder => _deliveryOrder ?? const [];
  set deliveryOrder(List<DeliveryOrdersStruct>? val) => _deliveryOrder = val;

  void updateDeliveryOrder(Function(List<DeliveryOrdersStruct>) updateFn) {
    updateFn(_deliveryOrder ??= []);
  }

  bool hasDeliveryOrder() => _deliveryOrder != null;

  static DeliveryOrdersBodyStruct fromMap(Map<String, dynamic> data) =>
      DeliveryOrdersBodyStruct(
        deliveryOrder: getStructList(
          data['delivery_order'],
          DeliveryOrdersStruct.fromMap,
        ),
      );

  static DeliveryOrdersBodyStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryOrdersBodyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'delivery_order': _deliveryOrder?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'delivery_order': serializeParam(
          _deliveryOrder,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeliveryOrdersBodyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DeliveryOrdersBodyStruct(
        deliveryOrder: deserializeStructParam<DeliveryOrdersStruct>(
          data['delivery_order'],
          ParamType.DataStruct,
          true,
          structBuilder: DeliveryOrdersStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeliveryOrdersBodyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeliveryOrdersBodyStruct &&
        listEquality.equals(deliveryOrder, other.deliveryOrder);
  }

  @override
  int get hashCode => const ListEquality().hash([deliveryOrder]);
}

DeliveryOrdersBodyStruct createDeliveryOrdersBodyStruct() =>
    DeliveryOrdersBodyStruct();
