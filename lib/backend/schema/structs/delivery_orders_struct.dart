// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryOrdersStruct extends BaseStruct {
  DeliveryOrdersStruct({
    int? orderGroupId,
    List<String>? deliveryOptionsAvailable,
    double? selectedOptionPrice,
    String? selectedOptionCurrencyCode,
    OrderGroupDeliveryMethodsStruct? selectedDeliveryMethodForOrderGroup,
  })  : _orderGroupId = orderGroupId,
        _deliveryOptionsAvailable = deliveryOptionsAvailable,
        _selectedOptionPrice = selectedOptionPrice,
        _selectedOptionCurrencyCode = selectedOptionCurrencyCode,
        _selectedDeliveryMethodForOrderGroup =
            selectedDeliveryMethodForOrderGroup;

  // "order_group_id" field.
  int? _orderGroupId;
  int get orderGroupId => _orderGroupId ?? 0;
  set orderGroupId(int? val) => _orderGroupId = val;

  void incrementOrderGroupId(int amount) =>
      orderGroupId = orderGroupId + amount;

  bool hasOrderGroupId() => _orderGroupId != null;

  // "deliveryOptionsAvailable" field.
  List<String>? _deliveryOptionsAvailable;
  List<String> get deliveryOptionsAvailable =>
      _deliveryOptionsAvailable ?? const [];
  set deliveryOptionsAvailable(List<String>? val) =>
      _deliveryOptionsAvailable = val;

  void updateDeliveryOptionsAvailable(Function(List<String>) updateFn) {
    updateFn(_deliveryOptionsAvailable ??= []);
  }

  bool hasDeliveryOptionsAvailable() => _deliveryOptionsAvailable != null;

  // "selectedOptionPrice" field.
  double? _selectedOptionPrice;
  double get selectedOptionPrice => _selectedOptionPrice ?? 0.0;
  set selectedOptionPrice(double? val) => _selectedOptionPrice = val;

  void incrementSelectedOptionPrice(double amount) =>
      selectedOptionPrice = selectedOptionPrice + amount;

  bool hasSelectedOptionPrice() => _selectedOptionPrice != null;

  // "selectedOptionCurrencyCode" field.
  String? _selectedOptionCurrencyCode;
  String get selectedOptionCurrencyCode => _selectedOptionCurrencyCode ?? '';
  set selectedOptionCurrencyCode(String? val) =>
      _selectedOptionCurrencyCode = val;

  bool hasSelectedOptionCurrencyCode() => _selectedOptionCurrencyCode != null;

  // "selectedDeliveryMethodForOrderGroup" field.
  OrderGroupDeliveryMethodsStruct? _selectedDeliveryMethodForOrderGroup;
  OrderGroupDeliveryMethodsStruct get selectedDeliveryMethodForOrderGroup =>
      _selectedDeliveryMethodForOrderGroup ?? OrderGroupDeliveryMethodsStruct();
  set selectedDeliveryMethodForOrderGroup(
          OrderGroupDeliveryMethodsStruct? val) =>
      _selectedDeliveryMethodForOrderGroup = val;

  void updateSelectedDeliveryMethodForOrderGroup(
      Function(OrderGroupDeliveryMethodsStruct) updateFn) {
    updateFn(_selectedDeliveryMethodForOrderGroup ??=
        OrderGroupDeliveryMethodsStruct());
  }

  bool hasSelectedDeliveryMethodForOrderGroup() =>
      _selectedDeliveryMethodForOrderGroup != null;

  static DeliveryOrdersStruct fromMap(Map<String, dynamic> data) =>
      DeliveryOrdersStruct(
        orderGroupId: castToType<int>(data['order_group_id']),
        deliveryOptionsAvailable: getDataList(data['deliveryOptionsAvailable']),
        selectedOptionPrice: castToType<double>(data['selectedOptionPrice']),
        selectedOptionCurrencyCode:
            data['selectedOptionCurrencyCode'] as String?,
        selectedDeliveryMethodForOrderGroup:
            OrderGroupDeliveryMethodsStruct.maybeFromMap(
                data['selectedDeliveryMethodForOrderGroup']),
      );

  static DeliveryOrdersStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryOrdersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'order_group_id': _orderGroupId,
        'deliveryOptionsAvailable': _deliveryOptionsAvailable,
        'selectedOptionPrice': _selectedOptionPrice,
        'selectedOptionCurrencyCode': _selectedOptionCurrencyCode,
        'selectedDeliveryMethodForOrderGroup':
            _selectedDeliveryMethodForOrderGroup?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_group_id': serializeParam(
          _orderGroupId,
          ParamType.int,
        ),
        'deliveryOptionsAvailable': serializeParam(
          _deliveryOptionsAvailable,
          ParamType.String,
          isList: true,
        ),
        'selectedOptionPrice': serializeParam(
          _selectedOptionPrice,
          ParamType.double,
        ),
        'selectedOptionCurrencyCode': serializeParam(
          _selectedOptionCurrencyCode,
          ParamType.String,
        ),
        'selectedDeliveryMethodForOrderGroup': serializeParam(
          _selectedDeliveryMethodForOrderGroup,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DeliveryOrdersStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeliveryOrdersStruct(
        orderGroupId: deserializeParam(
          data['order_group_id'],
          ParamType.int,
          false,
        ),
        deliveryOptionsAvailable: deserializeParam<String>(
          data['deliveryOptionsAvailable'],
          ParamType.String,
          true,
        ),
        selectedOptionPrice: deserializeParam(
          data['selectedOptionPrice'],
          ParamType.double,
          false,
        ),
        selectedOptionCurrencyCode: deserializeParam(
          data['selectedOptionCurrencyCode'],
          ParamType.String,
          false,
        ),
        selectedDeliveryMethodForOrderGroup: deserializeStructParam(
          data['selectedDeliveryMethodForOrderGroup'],
          ParamType.DataStruct,
          false,
          structBuilder: OrderGroupDeliveryMethodsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeliveryOrdersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeliveryOrdersStruct &&
        orderGroupId == other.orderGroupId &&
        listEquality.equals(
            deliveryOptionsAvailable, other.deliveryOptionsAvailable) &&
        selectedOptionPrice == other.selectedOptionPrice &&
        selectedOptionCurrencyCode == other.selectedOptionCurrencyCode &&
        selectedDeliveryMethodForOrderGroup ==
            other.selectedDeliveryMethodForOrderGroup;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderGroupId,
        deliveryOptionsAvailable,
        selectedOptionPrice,
        selectedOptionCurrencyCode,
        selectedDeliveryMethodForOrderGroup
      ]);
}

DeliveryOrdersStruct createDeliveryOrdersStruct({
  int? orderGroupId,
  double? selectedOptionPrice,
  String? selectedOptionCurrencyCode,
  OrderGroupDeliveryMethodsStruct? selectedDeliveryMethodForOrderGroup,
}) =>
    DeliveryOrdersStruct(
      orderGroupId: orderGroupId,
      selectedOptionPrice: selectedOptionPrice,
      selectedOptionCurrencyCode: selectedOptionCurrencyCode,
      selectedDeliveryMethodForOrderGroup:
          selectedDeliveryMethodForOrderGroup ??
              OrderGroupDeliveryMethodsStruct(),
    );
