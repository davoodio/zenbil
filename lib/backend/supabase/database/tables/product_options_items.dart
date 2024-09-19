import '../database.dart';

class ProductOptionsItemsTable extends SupabaseTable<ProductOptionsItemsRow> {
  @override
  String get tableName => 'product_options_items';

  @override
  ProductOptionsItemsRow createRow(Map<String, dynamic> data) =>
      ProductOptionsItemsRow(data);
}

class ProductOptionsItemsRow extends SupabaseDataRow {
  ProductOptionsItemsRow(super.data);

  @override
  SupabaseTable get table => ProductOptionsItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get optionName => getField<String>('option_name');
  set optionName(String? value) => setField<String>('option_name', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get productOptionId => getField<int>('product_option_id');
  set productOptionId(int? value) => setField<int>('product_option_id', value);
}
