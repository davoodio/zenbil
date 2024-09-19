import '../database.dart';

class ProductOptionsTable extends SupabaseTable<ProductOptionsRow> {
  @override
  String get tableName => 'product_options';

  @override
  ProductOptionsRow createRow(Map<String, dynamic> data) =>
      ProductOptionsRow(data);
}

class ProductOptionsRow extends SupabaseDataRow {
  ProductOptionsRow(super.data);

  @override
  SupabaseTable get table => ProductOptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get isRequired => getField<bool>('is_required');
  set isRequired(bool? value) => setField<bool>('is_required', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  bool? get inventoryAffect => getField<bool>('inventory_affect');
  set inventoryAffect(bool? value) => setField<bool>('inventory_affect', value);
}
