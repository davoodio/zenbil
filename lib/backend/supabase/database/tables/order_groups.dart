import '../database.dart';

class OrderGroupsTable extends SupabaseTable<OrderGroupsRow> {
  @override
  String get tableName => 'order_groups';

  @override
  OrderGroupsRow createRow(Map<String, dynamic> data) => OrderGroupsRow(data);
}

class OrderGroupsRow extends SupabaseDataRow {
  OrderGroupsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderGroupsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double? get priceTotal => getField<double>('price_total');
  set priceTotal(double? value) => setField<double>('price_total', value);

  double? get priceSubTotal => getField<double>('price_sub_total');
  set priceSubTotal(double? value) =>
      setField<double>('price_sub_total', value);

  double? get priceDiscounts => getField<double>('price_discounts');
  set priceDiscounts(double? value) =>
      setField<double>('price_discounts', value);

  double? get priceTaxes => getField<double>('price_taxes');
  set priceTaxes(double? value) => setField<double>('price_taxes', value);

  double? get priceDelivery => getField<double>('price_delivery');
  set priceDelivery(double? value) => setField<double>('price_delivery', value);

  double? get amountForMarket => getField<double>('amount_for_market');
  set amountForMarket(double? value) =>
      setField<double>('amount_for_market', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  int? get deliveryMethodId => getField<int>('delivery_method_id');
  set deliveryMethodId(int? value) =>
      setField<int>('delivery_method_id', value);

  int? get deliveryMethodMappingId =>
      getField<int>('delivery_method_mapping_id');
  set deliveryMethodMappingId(int? value) =>
      setField<int>('delivery_method_mapping_id', value);

  double? get sumWeight => getField<double>('sum_weight');
  set sumWeight(double? value) => setField<double>('sum_weight', value);

  double? get sumSize => getField<double>('sum_size');
  set sumSize(double? value) => setField<double>('sum_size', value);

  String? get onroId => getField<String>('onro_id');
  set onroId(String? value) => setField<String>('onro_id', value);

  String? get onroDriverId => getField<String>('onro_driver_id');
  set onroDriverId(String? value) => setField<String>('onro_driver_id', value);

  double? get onroPrice => getField<double>('onro_price');
  set onroPrice(double? value) => setField<double>('onro_price', value);

  String? get onroStatusDescription =>
      getField<String>('onro_status_description');
  set onroStatusDescription(String? value) =>
      setField<String>('onro_status_description', value);

  String? get onroPaymentSide => getField<String>('onro_payment_side');
  set onroPaymentSide(String? value) =>
      setField<String>('onro_payment_side', value);

  String? get onroCode => getField<String>('onro_code');
  set onroCode(String? value) => setField<String>('onro_code', value);

  String? get onroReferenceId => getField<String>('onro_reference_id');
  set onroReferenceId(String? value) =>
      setField<String>('onro_reference_id', value);

  String? get onroStatus => getField<String>('onro_status');
  set onroStatus(String? value) => setField<String>('onro_status', value);

  bool? get onroIsDelayed => getField<bool>('onro_is_delayed');
  set onroIsDelayed(bool? value) => setField<bool>('onro_is_delayed', value);

  dynamic? get onroDriver => getField<dynamic>('onro_driver');
  set onroDriver(dynamic? value) => setField<dynamic>('onro_driver', value);

  String? get onroTrackOrder => getField<String>('onro_track_order');
  set onroTrackOrder(String? value) =>
      setField<String>('onro_track_order', value);

  String? get onroTrackOrderCode => getField<String>('onro_track_order_code');
  set onroTrackOrderCode(String? value) =>
      setField<String>('onro_track_order_code', value);

  String? get onroType => getField<String>('onro_type');
  set onroType(String? value) => setField<String>('onro_type', value);

  double? get onroBaseEta => getField<double>('onro_base_eta');
  set onroBaseEta(double? value) => setField<double>('onro_base_eta', value);

  double? get onroRealEta => getField<double>('onro_real_eta');
  set onroRealEta(double? value) => setField<double>('onro_real_eta', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get language => getField<String>('language');
  set language(String? value) => setField<String>('language', value);

  String? get orderStatus => getField<String>('order_status');
  set orderStatus(String? value) => setField<String>('order_status', value);

  String? get internalTrackCode => getField<String>('internal_track_code');
  set internalTrackCode(String? value) =>
      setField<String>('internal_track_code', value);

  int? get onroDeliveryMethodId => getField<int>('onro_delivery_method_id');
  set onroDeliveryMethodId(int? value) =>
      setField<int>('onro_delivery_method_id', value);

  int? get businessWarehouseId => getField<int>('business_warehouse_id');
  set businessWarehouseId(int? value) =>
      setField<int>('business_warehouse_id', value);
}
