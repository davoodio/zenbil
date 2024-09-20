// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationStatusStruct extends BaseStruct {
  ConversationStatusStruct({
    String? active,
    String? closedByUser,
    String? closedByAdmin,
    String? draft,
  })  : _active = active,
        _closedByUser = closedByUser,
        _closedByAdmin = closedByAdmin,
        _draft = draft;

  // "Active" field.
  String? _active;
  String get active => _active ?? 'Active';
  set active(String? val) => _active = val;

  bool hasActive() => _active != null;

  // "ClosedByUser" field.
  String? _closedByUser;
  String get closedByUser => _closedByUser ?? 'Closed By User';
  set closedByUser(String? val) => _closedByUser = val;

  bool hasClosedByUser() => _closedByUser != null;

  // "ClosedByAdmin" field.
  String? _closedByAdmin;
  String get closedByAdmin => _closedByAdmin ?? 'Closed By Admin';
  set closedByAdmin(String? val) => _closedByAdmin = val;

  bool hasClosedByAdmin() => _closedByAdmin != null;

  // "Draft" field.
  String? _draft;
  String get draft => _draft ?? 'Draft';
  set draft(String? val) => _draft = val;

  bool hasDraft() => _draft != null;

  static ConversationStatusStruct fromMap(Map<String, dynamic> data) =>
      ConversationStatusStruct(
        active: data['Active'] as String?,
        closedByUser: data['ClosedByUser'] as String?,
        closedByAdmin: data['ClosedByAdmin'] as String?,
        draft: data['Draft'] as String?,
      );

  static ConversationStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Active': _active,
        'ClosedByUser': _closedByUser,
        'ClosedByAdmin': _closedByAdmin,
        'Draft': _draft,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Active': serializeParam(
          _active,
          ParamType.String,
        ),
        'ClosedByUser': serializeParam(
          _closedByUser,
          ParamType.String,
        ),
        'ClosedByAdmin': serializeParam(
          _closedByAdmin,
          ParamType.String,
        ),
        'Draft': serializeParam(
          _draft,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConversationStatusStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConversationStatusStruct(
        active: deserializeParam(
          data['Active'],
          ParamType.String,
          false,
        ),
        closedByUser: deserializeParam(
          data['ClosedByUser'],
          ParamType.String,
          false,
        ),
        closedByAdmin: deserializeParam(
          data['ClosedByAdmin'],
          ParamType.String,
          false,
        ),
        draft: deserializeParam(
          data['Draft'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConversationStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversationStatusStruct &&
        active == other.active &&
        closedByUser == other.closedByUser &&
        closedByAdmin == other.closedByAdmin &&
        draft == other.draft;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([active, closedByUser, closedByAdmin, draft]);
}

ConversationStatusStruct createConversationStatusStruct({
  String? active,
  String? closedByUser,
  String? closedByAdmin,
  String? draft,
}) =>
    ConversationStatusStruct(
      active: active,
      closedByUser: closedByUser,
      closedByAdmin: closedByAdmin,
      draft: draft,
    );
