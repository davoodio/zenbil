// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketBannerStruct extends BaseStruct {
  MarketBannerStruct({
    String? url,
    String? type,
    String? imageUrl,
  })  : _url = url,
        _type = type,
        _imageUrl = imageUrl;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static MarketBannerStruct fromMap(Map<String, dynamic> data) =>
      MarketBannerStruct(
        url: data['url'] as String?,
        type: data['type'] as String?,
        imageUrl: data['image_url'] as String?,
      );

  static MarketBannerStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketBannerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'type': _type,
        'image_url': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarketBannerStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarketBannerStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarketBannerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarketBannerStruct &&
        url == other.url &&
        type == other.type &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([url, type, imageUrl]);
}

MarketBannerStruct createMarketBannerStruct({
  String? url,
  String? type,
  String? imageUrl,
}) =>
    MarketBannerStruct(
      url: url,
      type: type,
      imageUrl: imageUrl,
    );
