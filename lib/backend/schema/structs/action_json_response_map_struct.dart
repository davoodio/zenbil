// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionJsonResponseMapStruct extends BaseStruct {
  ActionJsonResponseMapStruct({
    bool? success,
    String? error,
  })  : _success = success,
        _error = error;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;

  bool hasError() => _error != null;

  static ActionJsonResponseMapStruct fromMap(Map<String, dynamic> data) =>
      ActionJsonResponseMapStruct(
        success: data['success'] as bool?,
        error: data['error'] as String?,
      );

  static ActionJsonResponseMapStruct? maybeFromMap(dynamic data) => data is Map
      ? ActionJsonResponseMapStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'error': _error,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
      }.withoutNulls;

  static ActionJsonResponseMapStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ActionJsonResponseMapStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ActionJsonResponseMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActionJsonResponseMapStruct &&
        success == other.success &&
        error == other.error;
  }

  @override
  int get hashCode => const ListEquality().hash([success, error]);
}

ActionJsonResponseMapStruct createActionJsonResponseMapStruct({
  bool? success,
  String? error,
}) =>
    ActionJsonResponseMapStruct(
      success: success,
      error: error,
    );
