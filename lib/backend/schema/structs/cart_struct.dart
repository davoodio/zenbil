// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends BaseStruct {
  CartStruct({
    DateTime? lastUpdates,
    List<CartProductStruct>? products,
  })  : _lastUpdates = lastUpdates,
        _products = products;

  // "last_updates" field.
  DateTime? _lastUpdates;
  DateTime? get lastUpdates => _lastUpdates;
  set lastUpdates(DateTime? val) => _lastUpdates = val;

  bool hasLastUpdates() => _lastUpdates != null;

  // "products" field.
  List<CartProductStruct>? _products;
  List<CartProductStruct> get products => _products ?? const [];
  set products(List<CartProductStruct>? val) => _products = val;

  void updateProducts(Function(List<CartProductStruct>) updateFn) {
    updateFn(_products ??= []);
  }

  bool hasProducts() => _products != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        lastUpdates: data['last_updates'] as DateTime?,
        products: getStructList(
          data['products'],
          CartProductStruct.fromMap,
        ),
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'last_updates': _lastUpdates,
        'products': _products?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'last_updates': serializeParam(
          _lastUpdates,
          ParamType.DateTime,
        ),
        'products': serializeParam(
          _products,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        lastUpdates: deserializeParam(
          data['last_updates'],
          ParamType.DateTime,
          false,
        ),
        products: deserializeStructParam<CartProductStruct>(
          data['products'],
          ParamType.DataStruct,
          true,
          structBuilder: CartProductStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartStruct &&
        lastUpdates == other.lastUpdates &&
        listEquality.equals(products, other.products);
  }

  @override
  int get hashCode => const ListEquality().hash([lastUpdates, products]);
}

CartStruct createCartStruct({
  DateTime? lastUpdates,
}) =>
    CartStruct(
      lastUpdates: lastUpdates,
    );
