// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiveLocationStruct extends BaseStruct {
  LiveLocationStruct({
    bool? liveLocationIsOn,
    DateTime? updatedTime,
    LatLng? location,
  })  : _liveLocationIsOn = liveLocationIsOn,
        _updatedTime = updatedTime,
        _location = location;

  // "LiveLocationIsOn" field.
  bool? _liveLocationIsOn;
  bool get liveLocationIsOn => _liveLocationIsOn ?? false;
  set liveLocationIsOn(bool? val) => _liveLocationIsOn = val;

  bool hasLiveLocationIsOn() => _liveLocationIsOn != null;

  // "UpdatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  set updatedTime(DateTime? val) => _updatedTime = val;

  bool hasUpdatedTime() => _updatedTime != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  static LiveLocationStruct fromMap(Map<String, dynamic> data) =>
      LiveLocationStruct(
        liveLocationIsOn: data['LiveLocationIsOn'] as bool?,
        updatedTime: data['UpdatedTime'] as DateTime?,
        location: data['Location'] as LatLng?,
      );

  static LiveLocationStruct? maybeFromMap(dynamic data) => data is Map
      ? LiveLocationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'LiveLocationIsOn': _liveLocationIsOn,
        'UpdatedTime': _updatedTime,
        'Location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LiveLocationIsOn': serializeParam(
          _liveLocationIsOn,
          ParamType.bool,
        ),
        'UpdatedTime': serializeParam(
          _updatedTime,
          ParamType.DateTime,
        ),
        'Location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static LiveLocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LiveLocationStruct(
        liveLocationIsOn: deserializeParam(
          data['LiveLocationIsOn'],
          ParamType.bool,
          false,
        ),
        updatedTime: deserializeParam(
          data['UpdatedTime'],
          ParamType.DateTime,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'LiveLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LiveLocationStruct &&
        liveLocationIsOn == other.liveLocationIsOn &&
        updatedTime == other.updatedTime &&
        location == other.location;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([liveLocationIsOn, updatedTime, location]);
}

LiveLocationStruct createLiveLocationStruct({
  bool? liveLocationIsOn,
  DateTime? updatedTime,
  LatLng? location,
}) =>
    LiveLocationStruct(
      liveLocationIsOn: liveLocationIsOn,
      updatedTime: updatedTime,
      location: location,
    );
