import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(super.data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get userAddressId => getField<int>('user_address_id');
  set userAddressId(int? value) => setField<int>('user_address_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get orderNumber => getField<String>('order_number');
  set orderNumber(String? value) => setField<String>('order_number', value);

  String? get orderStatus => getField<String>('order_status');
  set orderStatus(String? value) => setField<String>('order_status', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  int? get paymentTypeId => getField<int>('payment_type_id');
  set paymentTypeId(int? value) => setField<int>('payment_type_id', value);

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

  String? get transactionRef => getField<String>('transaction_ref');
  set transactionRef(String? value) =>
      setField<String>('transaction_ref', value);

  String? get transactionType => getField<String>('transaction_type');
  set transactionType(String? value) =>
      setField<String>('transaction_type', value);

  int? get userShippingAddressId => getField<int>('user_shipping_address_id');
  set userShippingAddressId(int? value) =>
      setField<int>('user_shipping_address_id', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

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

  dynamic get onroDriver => getField<dynamic>('onro_driver');
  set onroDriver(dynamic value) => setField<dynamic>('onro_driver', value);

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

  String? get paymentTransactionId =>
      getField<String>('payment_transaction_id');
  set paymentTransactionId(String? value) =>
      setField<String>('payment_transaction_id', value);

  DateTime? get paymentTransactionDate =>
      getField<DateTime>('payment_transaction_date');
  set paymentTransactionDate(DateTime? value) =>
      setField<DateTime>('payment_transaction_date', value);

  String? get internalTrackCode => getField<String>('internal_track_code');
  set internalTrackCode(String? value) =>
      setField<String>('internal_track_code', value);
}
