// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketTypesStruct extends BaseStruct {
  MarketTypesStruct({
    String? business,
    String? brand,
    String? influencer,
  })  : _business = business,
        _brand = brand,
        _influencer = influencer;

  // "Business" field.
  String? _business;
  String get business => _business ?? 'Business';
  set business(String? val) => _business = val;

  bool hasBusiness() => _business != null;

  // "Brand" field.
  String? _brand;
  String get brand => _brand ?? 'Brand';
  set brand(String? val) => _brand = val;

  bool hasBrand() => _brand != null;

  // "Influencer" field.
  String? _influencer;
  String get influencer => _influencer ?? 'Star';
  set influencer(String? val) => _influencer = val;

  bool hasInfluencer() => _influencer != null;

  static MarketTypesStruct fromMap(Map<String, dynamic> data) =>
      MarketTypesStruct(
        business: data['Business'] as String?,
        brand: data['Brand'] as String?,
        influencer: data['Influencer'] as String?,
      );

  static MarketTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Business': _business,
        'Brand': _brand,
        'Influencer': _influencer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Business': serializeParam(
          _business,
          ParamType.String,
        ),
        'Brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'Influencer': serializeParam(
          _influencer,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarketTypesStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarketTypesStruct(
        business: deserializeParam(
          data['Business'],
          ParamType.String,
          false,
        ),
        brand: deserializeParam(
          data['Brand'],
          ParamType.String,
          false,
        ),
        influencer: deserializeParam(
          data['Influencer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarketTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarketTypesStruct &&
        business == other.business &&
        brand == other.brand &&
        influencer == other.influencer;
  }

  @override
  int get hashCode => const ListEquality().hash([business, brand, influencer]);
}

MarketTypesStruct createMarketTypesStruct({
  String? business,
  String? brand,
  String? influencer,
}) =>
    MarketTypesStruct(
      business: business,
      brand: brand,
      influencer: influencer,
    );
