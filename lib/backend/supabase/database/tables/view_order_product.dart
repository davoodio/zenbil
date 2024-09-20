import '../database.dart';

class ViewOrderProductTable extends SupabaseTable<ViewOrderProductRow> {
  @override
  String get tableName => 'view_order_product';

  @override
  ViewOrderProductRow createRow(Map<String, dynamic> data) =>
      ViewOrderProductRow(data);
}

class ViewOrderProductRow extends SupabaseDataRow {
  ViewOrderProductRow(super.data);

  @override
  SupabaseTable get table => ViewOrderProductTable();

  int? get orderProductId => getField<int>('order_product_id');
  set orderProductId(int? value) => setField<int>('order_product_id', value);

  DateTime? get orderProductCreatedAt =>
      getField<DateTime>('order_product_created_at');
  set orderProductCreatedAt(DateTime? value) =>
      setField<DateTime>('order_product_created_at', value);

  int? get orderProductOrderGroupId =>
      getField<int>('order_product_order_group_id');
  set orderProductOrderGroupId(int? value) =>
      setField<int>('order_product_order_group_id', value);

  int? get orderProductProductId => getField<int>('order_product_product_id');
  set orderProductProductId(int? value) =>
      setField<int>('order_product_product_id', value);

  int? get orderProductQuantity => getField<int>('order_product_quantity');
  set orderProductQuantity(int? value) =>
      setField<int>('order_product_quantity', value);

  double? get orderProductFee => getField<double>('order_product_fee');
  set orderProductFee(double? value) =>
      setField<double>('order_product_fee', value);

  double? get orderProductMarketPercent =>
      getField<double>('order_product_market_percent');
  set orderProductMarketPercent(double? value) =>
      setField<double>('order_product_market_percent', value);

  double? get orderProductMarketPrice =>
      getField<double>('order_product_market_price');
  set orderProductMarketPrice(double? value) =>
      setField<double>('order_product_market_price', value);

  double? get orderProductPriceTotal =>
      getField<double>('order_product_price_total');
  set orderProductPriceTotal(double? value) =>
      setField<double>('order_product_price_total', value);

  double? get orderProductPriceSubTotal =>
      getField<double>('order_product_price_sub_total');
  set orderProductPriceSubTotal(double? value) =>
      setField<double>('order_product_price_sub_total', value);

  double? get orderProductPriceDiscounts =>
      getField<double>('order_product_price_discounts');
  set orderProductPriceDiscounts(double? value) =>
      setField<double>('order_product_price_discounts', value);

  double? get orderProductPriceTaxes =>
      getField<double>('order_product_price_taxes');
  set orderProductPriceTaxes(double? value) =>
      setField<double>('order_product_price_taxes', value);

  String? get orderProductDescription =>
      getField<String>('order_product_description');
  set orderProductDescription(String? value) =>
      setField<String>('order_product_description', value);

  String? get orderProductStatus => getField<String>('order_product_status');
  set orderProductStatus(String? value) =>
      setField<String>('order_product_status', value);

  double? get orderProductSumWeight =>
      getField<double>('order_product_sum_weight');
  set orderProductSumWeight(double? value) =>
      setField<double>('order_product_sum_weight', value);

  double? get orderProductSumSize => getField<double>('order_product_sum_size');
  set orderProductSumSize(double? value) =>
      setField<double>('order_product_sum_size', value);

  String? get orderProductImage => getField<String>('order_product__image');
  set orderProductImage(String? value) =>
      setField<String>('order_product__image', value);

  String? get orderProductName => getField<String>('order_product_name');
  set orderProductName(String? value) =>
      setField<String>('order_product_name', value);

  int? get orderProductBusinessId => getField<int>('order_product_business_id');
  set orderProductBusinessId(int? value) =>
      setField<int>('order_product_business_id', value);

  int? get orderProductMarketId => getField<int>('order_product_market_id');
  set orderProductMarketId(int? value) =>
      setField<int>('order_product_market_id', value);

  double? get orderProductPlatformSharePercent =>
      getField<double>('order_product_platform_share_percent');
  set orderProductPlatformSharePercent(double? value) =>
      setField<double>('order_product_platform_share_percent', value);

  int? get orderGroupId => getField<int>('order_group_id');
  set orderGroupId(int? value) => setField<int>('order_group_id', value);

  DateTime? get orderGroupCreatedAt =>
      getField<DateTime>('order_group_created_at');
  set orderGroupCreatedAt(DateTime? value) =>
      setField<DateTime>('order_group_created_at', value);

  int? get orderGroupOrderId => getField<int>('order_group_order_id');
  set orderGroupOrderId(int? value) =>
      setField<int>('order_group_order_id', value);

  int? get orderGroupMarketId => getField<int>('order_group_market_id');
  set orderGroupMarketId(int? value) =>
      setField<int>('order_group_market_id', value);

  String? get orderGroupDescription =>
      getField<String>('order_group_description');
  set orderGroupDescription(String? value) =>
      setField<String>('order_group_description', value);

  String? get orderGroupStatus => getField<String>('order_group_status');
  set orderGroupStatus(String? value) =>
      setField<String>('order_group_status', value);

  double? get orderGroupPriceTotal =>
      getField<double>('order_group_price_total');
  set orderGroupPriceTotal(double? value) =>
      setField<double>('order_group_price_total', value);

  double? get orderGroupPriceSubTotal =>
      getField<double>('order_group_price_sub_total');
  set orderGroupPriceSubTotal(double? value) =>
      setField<double>('order_group_price_sub_total', value);

  double? get orderGroupPriceDiscounts =>
      getField<double>('order_group_price_discounts');
  set orderGroupPriceDiscounts(double? value) =>
      setField<double>('order_group_price_discounts', value);

  double? get orderGroupPriceTaxes =>
      getField<double>('order_group_price_taxes');
  set orderGroupPriceTaxes(double? value) =>
      setField<double>('order_group_price_taxes', value);

  double? get orderGroupPriceDelivery =>
      getField<double>('order_group_price_delivery');
  set orderGroupPriceDelivery(double? value) =>
      setField<double>('order_group_price_delivery', value);

  double? get orderGroupAmountForMarket =>
      getField<double>('order_group_amount_for_market');
  set orderGroupAmountForMarket(double? value) =>
      setField<double>('order_group_amount_for_market', value);

  int? get orderGroupBusinessId => getField<int>('order_group_business_id');
  set orderGroupBusinessId(int? value) =>
      setField<int>('order_group_business_id', value);

  int? get orderGroupDeliveryMethodId =>
      getField<int>('order_group_delivery_method_id');
  set orderGroupDeliveryMethodId(int? value) =>
      setField<int>('order_group_delivery_method_id', value);

  int? get orderGroupDeliveryMethodMappingId =>
      getField<int>('order_group_delivery_method_mapping_id');
  set orderGroupDeliveryMethodMappingId(int? value) =>
      setField<int>('order_group_delivery_method_mapping_id', value);

  double? get orderGroupSumWeight => getField<double>('order_group_sum_weight');
  set orderGroupSumWeight(double? value) =>
      setField<double>('order_group_sum_weight', value);

  double? get orderGroupSumSize => getField<double>('order_group_sum_size');
  set orderGroupSumSize(double? value) =>
      setField<double>('order_group_sum_size', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  DateTime? get orderCreatedAt => getField<DateTime>('order_created_at');
  set orderCreatedAt(DateTime? value) =>
      setField<DateTime>('order_created_at', value);

  String? get orderUserId => getField<String>('order_user_id');
  set orderUserId(String? value) => setField<String>('order_user_id', value);

  int? get orderUserAddressId => getField<int>('order_user_address_id');
  set orderUserAddressId(int? value) =>
      setField<int>('order_user_address_id', value);

  String? get orderDescription => getField<String>('order_description');
  set orderDescription(String? value) =>
      setField<String>('order_description', value);

  String? get orderOrderNumber => getField<String>('order_order_number');
  set orderOrderNumber(String? value) =>
      setField<String>('order_order_number', value);

  String? get orderOrderStatus => getField<String>('order_order_status');
  set orderOrderStatus(String? value) =>
      setField<String>('order_order_status', value);

  String? get orderPaymentStatus => getField<String>('order_payment_status');
  set orderPaymentStatus(String? value) =>
      setField<String>('order_payment_status', value);

  int? get orderPaymentTypeId => getField<int>('order_payment_type_id');
  set orderPaymentTypeId(int? value) =>
      setField<int>('order_payment_type_id', value);

  double? get orderPriceTotal => getField<double>('order_price_total');
  set orderPriceTotal(double? value) =>
      setField<double>('order_price_total', value);

  double? get orderPriceSubTotal => getField<double>('order_price_sub_total');
  set orderPriceSubTotal(double? value) =>
      setField<double>('order_price_sub_total', value);

  double? get orderPriceDiscounts => getField<double>('order_price_discounts');
  set orderPriceDiscounts(double? value) =>
      setField<double>('order_price_discounts', value);

  double? get orderPriceTaxes => getField<double>('order_price_taxes');
  set orderPriceTaxes(double? value) =>
      setField<double>('order_price_taxes', value);

  double? get orderPriceDelivery => getField<double>('order_price_delivery');
  set orderPriceDelivery(double? value) =>
      setField<double>('order_price_delivery', value);

  String? get orderTransactionRef => getField<String>('order_transaction_ref');
  set orderTransactionRef(String? value) =>
      setField<String>('order_transaction_ref', value);

  String? get orderTransactionType =>
      getField<String>('order_transaction_type');
  set orderTransactionType(String? value) =>
      setField<String>('order_transaction_type', value);

  int? get orderUserShippingAddressId =>
      getField<int>('order_user_shipping_address_id');
  set orderUserShippingAddressId(int? value) =>
      setField<int>('order_user_shipping_address_id', value);
}
