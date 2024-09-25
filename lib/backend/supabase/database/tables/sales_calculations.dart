import '../database.dart';

class SalesCalculationsTable extends SupabaseTable<SalesCalculationsRow> {
  @override
  String get tableName => 'sales_calculations';

  @override
  SalesCalculationsRow createRow(Map<String, dynamic> data) =>
      SalesCalculationsRow(data);
}

class SalesCalculationsRow extends SupabaseDataRow {
  SalesCalculationsRow(super.data);

  @override
  SupabaseTable get table => SalesCalculationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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

  double? get commisionPercent => getField<double>('commision_percent');
  set commisionPercent(double? value) =>
      setField<double>('commision_percent', value);

  double? get marketingPercent => getField<double>('marketing_percent');
  set marketingPercent(double? value) =>
      setField<double>('marketing_percent', value);

  double? get platformAmount => getField<double>('platform_amount');
  set platformAmount(double? value) =>
      setField<double>('platform_amount', value);
}
