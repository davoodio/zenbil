// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaStruct extends BaseStruct {
  MediaStruct({
    MediaTypes? type,
    String? url,
  })  : _type = type,
        _url = url;

  // "Type" field.
  MediaTypes? _type;
  MediaTypes? get type => _type;
  set type(MediaTypes? val) => _type = val;

  bool hasType() => _type != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static MediaStruct fromMap(Map<String, dynamic> data) => MediaStruct(
        type: deserializeEnum<MediaTypes>(data['Type']),
        url: data['url'] as String?,
      );

  static MediaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Type': _type?.serialize(),
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static MediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaStruct(
        type: deserializeParam<MediaTypes>(
          data['Type'],
          ParamType.Enum,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaStruct && type == other.type && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([type, url]);
}

MediaStruct createMediaStruct({
  MediaTypes? type,
  String? url,
}) =>
    MediaStruct(
      type: type,
      url: url,
    );
