// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketStatusesStruct extends BaseStruct {
  MarketStatusesStruct({
    String? active,
    String? pending,
    String? deactive,
  })  : _active = active,
        _pending = pending,
        _deactive = deactive;

  // "Active" field.
  String? _active;
  String get active => _active ?? 'Active';
  set active(String? val) => _active = val;

  bool hasActive() => _active != null;

  // "Pending" field.
  String? _pending;
  String get pending => _pending ?? 'Pending';
  set pending(String? val) => _pending = val;

  bool hasPending() => _pending != null;

  // "Deactive" field.
  String? _deactive;
  String get deactive => _deactive ?? 'Deactive';
  set deactive(String? val) => _deactive = val;

  bool hasDeactive() => _deactive != null;

  static MarketStatusesStruct fromMap(Map<String, dynamic> data) =>
      MarketStatusesStruct(
        active: data['Active'] as String?,
        pending: data['Pending'] as String?,
        deactive: data['Deactive'] as String?,
      );

  static MarketStatusesStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketStatusesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Active': _active,
        'Pending': _pending,
        'Deactive': _deactive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Active': serializeParam(
          _active,
          ParamType.String,
        ),
        'Pending': serializeParam(
          _pending,
          ParamType.String,
        ),
        'Deactive': serializeParam(
          _deactive,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarketStatusesStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarketStatusesStruct(
        active: deserializeParam(
          data['Active'],
          ParamType.String,
          false,
        ),
        pending: deserializeParam(
          data['Pending'],
          ParamType.String,
          false,
        ),
        deactive: deserializeParam(
          data['Deactive'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarketStatusesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarketStatusesStruct &&
        active == other.active &&
        pending == other.pending &&
        deactive == other.deactive;
  }

  @override
  int get hashCode => const ListEquality().hash([active, pending, deactive]);
}

MarketStatusesStruct createMarketStatusesStruct({
  String? active,
  String? pending,
  String? deactive,
}) =>
    MarketStatusesStruct(
      active: active,
      pending: pending,
      deactive: deactive,
    );
