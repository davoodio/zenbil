// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartProductStruct extends BaseStruct {
  CartProductStruct({
    String? productName,
    String? productDescription,
    double? price,
    bool? isDiscounted,
    double? discountPercent,
    int? quantity,
    String? image,
    int? productId,
    int? businessId,
    int? deliveryMethodId,
    int? marketId,
    double? tax,
    double? weight,
    double? size,
    double? priceSubTotal,
    List<int>? deliveryMethodsAvailable,
    double? discountedPrice,
    String? note,
    int? quantityInInventory,
    int? warehouseId,
  })  : _productName = productName,
        _productDescription = productDescription,
        _price = price,
        _isDiscounted = isDiscounted,
        _discountPercent = discountPercent,
        _quantity = quantity,
        _image = image,
        _productId = productId,
        _businessId = businessId,
        _deliveryMethodId = deliveryMethodId,
        _marketId = marketId,
        _tax = tax,
        _weight = weight,
        _size = size,
        _priceSubTotal = priceSubTotal,
        _deliveryMethodsAvailable = deliveryMethodsAvailable,
        _discountedPrice = discountedPrice,
        _note = note,
        _quantityInInventory = quantityInInventory,
        _warehouseId = warehouseId;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "product_description" field.
  String? _productDescription;
  String get productDescription => _productDescription ?? '';
  set productDescription(String? val) => _productDescription = val;

  bool hasProductDescription() => _productDescription != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "is_discounted" field.
  bool? _isDiscounted;
  bool get isDiscounted => _isDiscounted ?? false;
  set isDiscounted(bool? val) => _isDiscounted = val;

  bool hasIsDiscounted() => _isDiscounted != null;

  // "discount_percent" field.
  double? _discountPercent;
  double get discountPercent => _discountPercent ?? 0.0;
  set discountPercent(double? val) => _discountPercent = val;

  void incrementDiscountPercent(double amount) =>
      discountPercent = discountPercent + amount;

  bool hasDiscountPercent() => _discountPercent != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "product_id" field.
  int? _productId;
  int get productId => _productId ?? 0;
  set productId(int? val) => _productId = val;

  void incrementProductId(int amount) => productId = productId + amount;

  bool hasProductId() => _productId != null;

  // "business_id" field.
  int? _businessId;
  int get businessId => _businessId ?? 0;
  set businessId(int? val) => _businessId = val;

  void incrementBusinessId(int amount) => businessId = businessId + amount;

  bool hasBusinessId() => _businessId != null;

  // "delivery_method_id" field.
  int? _deliveryMethodId;
  int get deliveryMethodId => _deliveryMethodId ?? 0;
  set deliveryMethodId(int? val) => _deliveryMethodId = val;

  void incrementDeliveryMethodId(int amount) =>
      deliveryMethodId = deliveryMethodId + amount;

  bool hasDeliveryMethodId() => _deliveryMethodId != null;

  // "market_id" field.
  int? _marketId;
  int get marketId => _marketId ?? 0;
  set marketId(int? val) => _marketId = val;

  void incrementMarketId(int amount) => marketId = marketId + amount;

  bool hasMarketId() => _marketId != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  set tax(double? val) => _tax = val;

  void incrementTax(double amount) => tax = tax + amount;

  bool hasTax() => _tax != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;

  void incrementSize(double amount) => size = size + amount;

  bool hasSize() => _size != null;

  // "price_sub_total" field.
  double? _priceSubTotal;
  double get priceSubTotal => _priceSubTotal ?? 0.0;
  set priceSubTotal(double? val) => _priceSubTotal = val;

  void incrementPriceSubTotal(double amount) =>
      priceSubTotal = priceSubTotal + amount;

  bool hasPriceSubTotal() => _priceSubTotal != null;

  // "delivery_methods_available" field.
  List<int>? _deliveryMethodsAvailable;
  List<int> get deliveryMethodsAvailable =>
      _deliveryMethodsAvailable ?? const [];
  set deliveryMethodsAvailable(List<int>? val) =>
      _deliveryMethodsAvailable = val;

  void updateDeliveryMethodsAvailable(Function(List<int>) updateFn) {
    updateFn(_deliveryMethodsAvailable ??= []);
  }

  bool hasDeliveryMethodsAvailable() => _deliveryMethodsAvailable != null;

  // "discountedPrice" field.
  double? _discountedPrice;
  double get discountedPrice => _discountedPrice ?? 0.0;
  set discountedPrice(double? val) => _discountedPrice = val;

  void incrementDiscountedPrice(double amount) =>
      discountedPrice = discountedPrice + amount;

  bool hasDiscountedPrice() => _discountedPrice != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "quantity_in_inventory" field.
  int? _quantityInInventory;
  int get quantityInInventory => _quantityInInventory ?? 0;
  set quantityInInventory(int? val) => _quantityInInventory = val;

  void incrementQuantityInInventory(int amount) =>
      quantityInInventory = quantityInInventory + amount;

  bool hasQuantityInInventory() => _quantityInInventory != null;

  // "warehouse_id" field.
  int? _warehouseId;
  int get warehouseId => _warehouseId ?? 0;
  set warehouseId(int? val) => _warehouseId = val;

  void incrementWarehouseId(int amount) => warehouseId = warehouseId + amount;

  bool hasWarehouseId() => _warehouseId != null;

  static CartProductStruct fromMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productName: data['product_name'] as String?,
        productDescription: data['product_description'] as String?,
        price: castToType<double>(data['price']),
        isDiscounted: data['is_discounted'] as bool?,
        discountPercent: castToType<double>(data['discount_percent']),
        quantity: castToType<int>(data['quantity']),
        image: data['image'] as String?,
        productId: castToType<int>(data['product_id']),
        businessId: castToType<int>(data['business_id']),
        deliveryMethodId: castToType<int>(data['delivery_method_id']),
        marketId: castToType<int>(data['market_id']),
        tax: castToType<double>(data['tax']),
        weight: castToType<double>(data['weight']),
        size: castToType<double>(data['size']),
        priceSubTotal: castToType<double>(data['price_sub_total']),
        deliveryMethodsAvailable:
            getDataList(data['delivery_methods_available']),
        discountedPrice: castToType<double>(data['discountedPrice']),
        note: data['note'] as String?,
        quantityInInventory: castToType<int>(data['quantity_in_inventory']),
        warehouseId: castToType<int>(data['warehouse_id']),
      );

  static CartProductStruct? maybeFromMap(dynamic data) => data is Map
      ? CartProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_name': _productName,
        'product_description': _productDescription,
        'price': _price,
        'is_discounted': _isDiscounted,
        'discount_percent': _discountPercent,
        'quantity': _quantity,
        'image': _image,
        'product_id': _productId,
        'business_id': _businessId,
        'delivery_method_id': _deliveryMethodId,
        'market_id': _marketId,
        'tax': _tax,
        'weight': _weight,
        'size': _size,
        'price_sub_total': _priceSubTotal,
        'delivery_methods_available': _deliveryMethodsAvailable,
        'discountedPrice': _discountedPrice,
        'note': _note,
        'quantity_in_inventory': _quantityInInventory,
        'warehouse_id': _warehouseId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'product_description': serializeParam(
          _productDescription,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'is_discounted': serializeParam(
          _isDiscounted,
          ParamType.bool,
        ),
        'discount_percent': serializeParam(
          _discountPercent,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.int,
        ),
        'business_id': serializeParam(
          _businessId,
          ParamType.int,
        ),
        'delivery_method_id': serializeParam(
          _deliveryMethodId,
          ParamType.int,
        ),
        'market_id': serializeParam(
          _marketId,
          ParamType.int,
        ),
        'tax': serializeParam(
          _tax,
          ParamType.double,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'price_sub_total': serializeParam(
          _priceSubTotal,
          ParamType.double,
        ),
        'delivery_methods_available': serializeParam(
          _deliveryMethodsAvailable,
          ParamType.int,
          isList: true,
        ),
        'discountedPrice': serializeParam(
          _discountedPrice,
          ParamType.double,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'quantity_in_inventory': serializeParam(
          _quantityInInventory,
          ParamType.int,
        ),
        'warehouse_id': serializeParam(
          _warehouseId,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        productDescription: deserializeParam(
          data['product_description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        isDiscounted: deserializeParam(
          data['is_discounted'],
          ParamType.bool,
          false,
        ),
        discountPercent: deserializeParam(
          data['discount_percent'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.int,
          false,
        ),
        businessId: deserializeParam(
          data['business_id'],
          ParamType.int,
          false,
        ),
        deliveryMethodId: deserializeParam(
          data['delivery_method_id'],
          ParamType.int,
          false,
        ),
        marketId: deserializeParam(
          data['market_id'],
          ParamType.int,
          false,
        ),
        tax: deserializeParam(
          data['tax'],
          ParamType.double,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        priceSubTotal: deserializeParam(
          data['price_sub_total'],
          ParamType.double,
          false,
        ),
        deliveryMethodsAvailable: deserializeParam<int>(
          data['delivery_methods_available'],
          ParamType.int,
          true,
        ),
        discountedPrice: deserializeParam(
          data['discountedPrice'],
          ParamType.double,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        quantityInInventory: deserializeParam(
          data['quantity_in_inventory'],
          ParamType.int,
          false,
        ),
        warehouseId: deserializeParam(
          data['warehouse_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartProductStruct &&
        productName == other.productName &&
        productDescription == other.productDescription &&
        price == other.price &&
        isDiscounted == other.isDiscounted &&
        discountPercent == other.discountPercent &&
        quantity == other.quantity &&
        image == other.image &&
        productId == other.productId &&
        businessId == other.businessId &&
        deliveryMethodId == other.deliveryMethodId &&
        marketId == other.marketId &&
        tax == other.tax &&
        weight == other.weight &&
        size == other.size &&
        priceSubTotal == other.priceSubTotal &&
        listEquality.equals(
            deliveryMethodsAvailable, other.deliveryMethodsAvailable) &&
        discountedPrice == other.discountedPrice &&
        note == other.note &&
        quantityInInventory == other.quantityInInventory &&
        warehouseId == other.warehouseId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productName,
        productDescription,
        price,
        isDiscounted,
        discountPercent,
        quantity,
        image,
        productId,
        businessId,
        deliveryMethodId,
        marketId,
        tax,
        weight,
        size,
        priceSubTotal,
        deliveryMethodsAvailable,
        discountedPrice,
        note,
        quantityInInventory,
        warehouseId
      ]);
}

CartProductStruct createCartProductStruct({
  String? productName,
  String? productDescription,
  double? price,
  bool? isDiscounted,
  double? discountPercent,
  int? quantity,
  String? image,
  int? productId,
  int? businessId,
  int? deliveryMethodId,
  int? marketId,
  double? tax,
  double? weight,
  double? size,
  double? priceSubTotal,
  double? discountedPrice,
  String? note,
  int? quantityInInventory,
  int? warehouseId,
}) =>
    CartProductStruct(
      productName: productName,
      productDescription: productDescription,
      price: price,
      isDiscounted: isDiscounted,
      discountPercent: discountPercent,
      quantity: quantity,
      image: image,
      productId: productId,
      businessId: businessId,
      deliveryMethodId: deliveryMethodId,
      marketId: marketId,
      tax: tax,
      weight: weight,
      size: size,
      priceSubTotal: priceSubTotal,
      discountedPrice: discountedPrice,
      note: note,
      quantityInInventory: quantityInInventory,
      warehouseId: warehouseId,
    );
