// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StorageBucketsStruct extends BaseStruct {
  StorageBucketsStruct({
    String? publics,
    String? privates,
    String? shared,
  })  : _publics = publics,
        _privates = privates,
        _shared = shared;

  // "publics" field.
  String? _publics;
  String get publics => _publics ?? 'publics';
  set publics(String? val) => _publics = val;

  bool hasPublics() => _publics != null;

  // "privates" field.
  String? _privates;
  String get privates => _privates ?? 'privates';
  set privates(String? val) => _privates = val;

  bool hasPrivates() => _privates != null;

  // "shared" field.
  String? _shared;
  String get shared => _shared ?? 'shared';
  set shared(String? val) => _shared = val;

  bool hasShared() => _shared != null;

  static StorageBucketsStruct fromMap(Map<String, dynamic> data) =>
      StorageBucketsStruct(
        publics: data['publics'] as String?,
        privates: data['privates'] as String?,
        shared: data['shared'] as String?,
      );

  static StorageBucketsStruct? maybeFromMap(dynamic data) => data is Map
      ? StorageBucketsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'publics': _publics,
        'privates': _privates,
        'shared': _shared,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'publics': serializeParam(
          _publics,
          ParamType.String,
        ),
        'privates': serializeParam(
          _privates,
          ParamType.String,
        ),
        'shared': serializeParam(
          _shared,
          ParamType.String,
        ),
      }.withoutNulls;

  static StorageBucketsStruct fromSerializableMap(Map<String, dynamic> data) =>
      StorageBucketsStruct(
        publics: deserializeParam(
          data['publics'],
          ParamType.String,
          false,
        ),
        privates: deserializeParam(
          data['privates'],
          ParamType.String,
          false,
        ),
        shared: deserializeParam(
          data['shared'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StorageBucketsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StorageBucketsStruct &&
        publics == other.publics &&
        privates == other.privates &&
        shared == other.shared;
  }

  @override
  int get hashCode => const ListEquality().hash([publics, privates, shared]);
}

StorageBucketsStruct createStorageBucketsStruct({
  String? publics,
  String? privates,
  String? shared,
}) =>
    StorageBucketsStruct(
      publics: publics,
      privates: privates,
      shared: shared,
    );
