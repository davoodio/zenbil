import '../database.dart';

class MarketsProductsTable extends SupabaseTable<MarketsProductsRow> {
  @override
  String get tableName => 'markets_products';

  @override
  MarketsProductsRow createRow(Map<String, dynamic> data) =>
      MarketsProductsRow(data);
}

class MarketsProductsRow extends SupabaseDataRow {
  MarketsProductsRow(super.data);

  @override
  SupabaseTable get table => MarketsProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  String get productStatus => getField<String>('product_status')!;
  set productStatus(String value) => setField<String>('product_status', value);

  String? get approvedBy => getField<String>('approved_by');
  set approvedBy(String? value) => setField<String>('approved_by', value);
}
