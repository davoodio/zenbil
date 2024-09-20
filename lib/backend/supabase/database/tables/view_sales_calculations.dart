import '../database.dart';

class ViewSalesCalculationsTable
    extends SupabaseTable<ViewSalesCalculationsRow> {
  @override
  String get tableName => 'view_sales_calculations';

  @override
  ViewSalesCalculationsRow createRow(Map<String, dynamic> data) =>
      ViewSalesCalculationsRow(data);
}

class ViewSalesCalculationsRow extends SupabaseDataRow {
  ViewSalesCalculationsRow(super.data);

  @override
  SupabaseTable get table => ViewSalesCalculationsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get orderProductId => getField<int>('order_product_id');
  set orderProductId(int? value) => setField<int>('order_product_id', value);

  double? get productPrice => getField<double>('product_price');
  set productPrice(double? value) => setField<double>('product_price', value);

  double? get commisionAmount => getField<double>('commision_amount');
  set commisionAmount(double? value) =>
      setField<double>('commision_amount', value);

  double? get marketingFeeAmount => getField<double>('marketing_fee_amount');
  set marketingFeeAmount(double? value) =>
      setField<double>('marketing_fee_amount', value);

  int? get paymentMethodId => getField<int>('payment_method_id');
  set paymentMethodId(int? value) => setField<int>('payment_method_id', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  String? get transactionStatus => getField<String>('transaction_status');
  set transactionStatus(String? value) =>
      setField<String>('transaction_status', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get marketName => getField<String>('market_name');
  set marketName(String? value) => setField<String>('market_name', value);

  int? get orderProductQuantity => getField<int>('order_product_quantity');
  set orderProductQuantity(int? value) =>
      setField<int>('order_product_quantity', value);

  String? get orderProductName => getField<String>('order_product_name');
  set orderProductName(String? value) =>
      setField<String>('order_product_name', value);

  int? get orderGroupId => getField<int>('order_group_id');
  set orderGroupId(int? value) => setField<int>('order_group_id', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);
}
