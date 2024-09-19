// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketBannerBodyStruct extends BaseStruct {
  MarketBannerBodyStruct({
    List<MarketBannerStruct>? marketBanner,
  }) : _marketBanner = marketBanner;

  // "market_banner" field.
  List<MarketBannerStruct>? _marketBanner;
  List<MarketBannerStruct> get marketBanner => _marketBanner ?? const [];
  set marketBanner(List<MarketBannerStruct>? val) => _marketBanner = val;

  void updateMarketBanner(Function(List<MarketBannerStruct>) updateFn) {
    updateFn(_marketBanner ??= []);
  }

  bool hasMarketBanner() => _marketBanner != null;

  static MarketBannerBodyStruct fromMap(Map<String, dynamic> data) =>
      MarketBannerBodyStruct(
        marketBanner: getStructList(
          data['market_banner'],
          MarketBannerStruct.fromMap,
        ),
      );

  static MarketBannerBodyStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketBannerBodyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'market_banner': _marketBanner?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'market_banner': serializeParam(
          _marketBanner,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MarketBannerBodyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MarketBannerBodyStruct(
        marketBanner: deserializeStructParam<MarketBannerStruct>(
          data['market_banner'],
          ParamType.DataStruct,
          true,
          structBuilder: MarketBannerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MarketBannerBodyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MarketBannerBodyStruct &&
        listEquality.equals(marketBanner, other.marketBanner);
  }

  @override
  int get hashCode => const ListEquality().hash([marketBanner]);
}

MarketBannerBodyStruct createMarketBannerBodyStruct() =>
    MarketBannerBodyStruct();
