// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavProductStruct extends BaseStruct {
  FavProductStruct({
    int? productId,
    int? marketId,
  })  : _productId = productId,
        _marketId = marketId;

  // "product_id" field.
  int? _productId;
  int get productId => _productId ?? 0;
  set productId(int? val) => _productId = val;

  void incrementProductId(int amount) => productId = productId + amount;

  bool hasProductId() => _productId != null;

  // "market_id" field.
  int? _marketId;
  int get marketId => _marketId ?? 0;
  set marketId(int? val) => _marketId = val;

  void incrementMarketId(int amount) => marketId = marketId + amount;

  bool hasMarketId() => _marketId != null;

  static FavProductStruct fromMap(Map<String, dynamic> data) =>
      FavProductStruct(
        productId: castToType<int>(data['product_id']),
        marketId: castToType<int>(data['market_id']),
      );

  static FavProductStruct? maybeFromMap(dynamic data) => data is Map
      ? FavProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_id': _productId,
        'market_id': _marketId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_id': serializeParam(
          _productId,
          ParamType.int,
        ),
        'market_id': serializeParam(
          _marketId,
          ParamType.int,
        ),
      }.withoutNulls;

  static FavProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavProductStruct(
        productId: deserializeParam(
          data['product_id'],
          ParamType.int,
          false,
        ),
        marketId: deserializeParam(
          data['market_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FavProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavProductStruct &&
        productId == other.productId &&
        marketId == other.marketId;
  }

  @override
  int get hashCode => const ListEquality().hash([productId, marketId]);
}

FavProductStruct createFavProductStruct({
  int? productId,
  int? marketId,
}) =>
    FavProductStruct(
      productId: productId,
      marketId: marketId,
    );
