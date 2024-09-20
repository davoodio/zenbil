// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomResultStruct extends BaseStruct {
  CustomResultStruct({
    String? message,
    bool? isSuccess,
  })  : _message = message,
        _isSuccess = isSuccess;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "isSuccess" field.
  bool? _isSuccess;
  bool get isSuccess => _isSuccess ?? false;
  set isSuccess(bool? val) => _isSuccess = val;

  bool hasIsSuccess() => _isSuccess != null;

  static CustomResultStruct fromMap(Map<String, dynamic> data) =>
      CustomResultStruct(
        message: data['message'] as String?,
        isSuccess: data['isSuccess'] as bool?,
      );

  static CustomResultStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'isSuccess': _isSuccess,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'isSuccess': serializeParam(
          _isSuccess,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CustomResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomResultStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        isSuccess: deserializeParam(
          data['isSuccess'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CustomResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomResultStruct &&
        message == other.message &&
        isSuccess == other.isSuccess;
  }

  @override
  int get hashCode => const ListEquality().hash([message, isSuccess]);
}

CustomResultStruct createCustomResultStruct({
  String? message,
  bool? isSuccess,
}) =>
    CustomResultStruct(
      message: message,
      isSuccess: isSuccess,
    );
