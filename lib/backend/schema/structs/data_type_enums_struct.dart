// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypeEnumsStruct extends BaseStruct {
  DataTypeEnumsStruct({
    MarketStatusesStruct? marketStatuses,
    ConversationStatusStruct? conversationStatus,
    MarketTypesStruct? marketTypes,
    TransactionTypesStruct? transactionTypes,
    List<DeliveryOptions>? deliveryOptions,
  })  : _marketStatuses = marketStatuses,
        _conversationStatus = conversationStatus,
        _marketTypes = marketTypes,
        _transactionTypes = transactionTypes,
        _deliveryOptions = deliveryOptions;

  // "MarketStatuses" field.
  MarketStatusesStruct? _marketStatuses;
  MarketStatusesStruct get marketStatuses =>
      _marketStatuses ?? MarketStatusesStruct();
  set marketStatuses(MarketStatusesStruct? val) => _marketStatuses = val;

  void updateMarketStatuses(Function(MarketStatusesStruct) updateFn) {
    updateFn(_marketStatuses ??= MarketStatusesStruct());
  }

  bool hasMarketStatuses() => _marketStatuses != null;

  // "ConversationStatus" field.
  ConversationStatusStruct? _conversationStatus;
  ConversationStatusStruct get conversationStatus =>
      _conversationStatus ?? ConversationStatusStruct();
  set conversationStatus(ConversationStatusStruct? val) =>
      _conversationStatus = val;

  void updateConversationStatus(Function(ConversationStatusStruct) updateFn) {
    updateFn(_conversationStatus ??= ConversationStatusStruct());
  }

  bool hasConversationStatus() => _conversationStatus != null;

  // "MarketTypes" field.
  MarketTypesStruct? _marketTypes;
  MarketTypesStruct get marketTypes => _marketTypes ?? MarketTypesStruct();
  set marketTypes(MarketTypesStruct? val) => _marketTypes = val;

  void updateMarketTypes(Function(MarketTypesStruct) updateFn) {
    updateFn(_marketTypes ??= MarketTypesStruct());
  }

  bool hasMarketTypes() => _marketTypes != null;

  // "TransactionTypes" field.
  TransactionTypesStruct? _transactionTypes;
  TransactionTypesStruct get transactionTypes =>
      _transactionTypes ?? TransactionTypesStruct();
  set transactionTypes(TransactionTypesStruct? val) => _transactionTypes = val;

  void updateTransactionTypes(Function(TransactionTypesStruct) updateFn) {
    updateFn(_transactionTypes ??= TransactionTypesStruct());
  }

  bool hasTransactionTypes() => _transactionTypes != null;

  // "DeliveryOptions" field.
  List<DeliveryOptions>? _deliveryOptions;
  List<DeliveryOptions> get deliveryOptions => _deliveryOptions ?? const [];
  set deliveryOptions(List<DeliveryOptions>? val) => _deliveryOptions = val;

  void updateDeliveryOptions(Function(List<DeliveryOptions>) updateFn) {
    updateFn(_deliveryOptions ??= []);
  }

  bool hasDeliveryOptions() => _deliveryOptions != null;

  static DataTypeEnumsStruct fromMap(Map<String, dynamic> data) =>
      DataTypeEnumsStruct(
        marketStatuses:
            MarketStatusesStruct.maybeFromMap(data['MarketStatuses']),
        conversationStatus:
            ConversationStatusStruct.maybeFromMap(data['ConversationStatus']),
        marketTypes: MarketTypesStruct.maybeFromMap(data['MarketTypes']),
        transactionTypes:
            TransactionTypesStruct.maybeFromMap(data['TransactionTypes']),
        deliveryOptions: getEnumList<DeliveryOptions>(data['DeliveryOptions']),
      );

  static DataTypeEnumsStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeEnumsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MarketStatuses': _marketStatuses?.toMap(),
        'ConversationStatus': _conversationStatus?.toMap(),
        'MarketTypes': _marketTypes?.toMap(),
        'TransactionTypes': _transactionTypes?.toMap(),
        'DeliveryOptions': _deliveryOptions?.map((e) => e.serialize()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MarketStatuses': serializeParam(
          _marketStatuses,
          ParamType.DataStruct,
        ),
        'ConversationStatus': serializeParam(
          _conversationStatus,
          ParamType.DataStruct,
        ),
        'MarketTypes': serializeParam(
          _marketTypes,
          ParamType.DataStruct,
        ),
        'TransactionTypes': serializeParam(
          _transactionTypes,
          ParamType.DataStruct,
        ),
        'DeliveryOptions': serializeParam(
          _deliveryOptions,
          ParamType.Enum,
          isList: true,
        ),
      }.withoutNulls;

  static DataTypeEnumsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataTypeEnumsStruct(
        marketStatuses: deserializeStructParam(
          data['MarketStatuses'],
          ParamType.DataStruct,
          false,
          structBuilder: MarketStatusesStruct.fromSerializableMap,
        ),
        conversationStatus: deserializeStructParam(
          data['ConversationStatus'],
          ParamType.DataStruct,
          false,
          structBuilder: ConversationStatusStruct.fromSerializableMap,
        ),
        marketTypes: deserializeStructParam(
          data['MarketTypes'],
          ParamType.DataStruct,
          false,
          structBuilder: MarketTypesStruct.fromSerializableMap,
        ),
        transactionTypes: deserializeStructParam(
          data['TransactionTypes'],
          ParamType.DataStruct,
          false,
          structBuilder: TransactionTypesStruct.fromSerializableMap,
        ),
        deliveryOptions: deserializeParam<DeliveryOptions>(
          data['DeliveryOptions'],
          ParamType.Enum,
          true,
        ),
      );

  @override
  String toString() => 'DataTypeEnumsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataTypeEnumsStruct &&
        marketStatuses == other.marketStatuses &&
        conversationStatus == other.conversationStatus &&
        marketTypes == other.marketTypes &&
        transactionTypes == other.transactionTypes &&
        listEquality.equals(deliveryOptions, other.deliveryOptions);
  }

  @override
  int get hashCode => const ListEquality().hash([
        marketStatuses,
        conversationStatus,
        marketTypes,
        transactionTypes,
        deliveryOptions
      ]);
}

DataTypeEnumsStruct createDataTypeEnumsStruct({
  MarketStatusesStruct? marketStatuses,
  ConversationStatusStruct? conversationStatus,
  MarketTypesStruct? marketTypes,
  TransactionTypesStruct? transactionTypes,
}) =>
    DataTypeEnumsStruct(
      marketStatuses: marketStatuses ?? MarketStatusesStruct(),
      conversationStatus: conversationStatus ?? ConversationStatusStruct(),
      marketTypes: marketTypes ?? MarketTypesStruct(),
      transactionTypes: transactionTypes ?? TransactionTypesStruct(),
    );
