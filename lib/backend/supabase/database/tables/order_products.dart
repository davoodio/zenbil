import '../database.dart';

class OrderProductsTable extends SupabaseTable<OrderProductsRow> {
  @override
  String get tableName => 'order_products';

  @override
  OrderProductsRow createRow(Map<String, dynamic> data) =>
      OrderProductsRow(data);
}

class OrderProductsRow extends SupabaseDataRow {
  OrderProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get orderGroupId => getField<int>('order_group_id');
  set orderGroupId(int? value) => setField<int>('order_group_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  double? get fee => getField<double>('fee');
  set fee(double? value) => setField<double>('fee', value);

  double? get marketPercent => getField<double>('market_percent');
  set marketPercent(double? value) => setField<double>('market_percent', value);

  double? get marketPrice => getField<double>('market_price');
  set marketPrice(double? value) => setField<double>('market_price', value);

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

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double? get sumWeight => getField<double>('sum_weight');
  set sumWeight(double? value) => setField<double>('sum_weight', value);

  double? get sumSize => getField<double>('sum_size');
  set sumSize(double? value) => setField<double>('sum_size', value);

  String? get productImage => getField<String>('product_image');
  set productImage(String? value) => setField<String>('product_image', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  double? get platformSharePercent =>
      getField<double>('platform_share_percent');
  set platformSharePercent(double? value) =>
      setField<double>('platform_share_percent', value);

  int? get deliveryMethodId => getField<int>('delivery_method_id');
  set deliveryMethodId(int? value) =>
      setField<int>('delivery_method_id', value);

  int? get deliveryMethodMappingId =>
      getField<int>('delivery_method_mapping_id');
  set deliveryMethodMappingId(int? value) =>
      setField<int>('delivery_method_mapping_id', value);

  List<int> get deliveryMethodsAvailableIds =>
      getListField<int>('delivery_methods_available_Ids');
  set deliveryMethodsAvailableIds(List<int>? value) =>
      setListField<int>('delivery_methods_available_Ids', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);
}
