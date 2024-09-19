import '../database.dart';

class ProductInventoriesTable extends SupabaseTable<ProductInventoriesRow> {
  @override
  String get tableName => 'product_inventories';

  @override
  ProductInventoriesRow createRow(Map<String, dynamic> data) =>
      ProductInventoriesRow(data);
}

class ProductInventoriesRow extends SupabaseDataRow {
  ProductInventoriesRow(super.data);

  @override
  SupabaseTable get table => ProductInventoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get inventory => getField<int>('inventory');
  set inventory(int? value) => setField<int>('inventory', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  List<int> get productOptionItems => getListField<int>('product_option_items');
  set productOptionItems(List<int>? value) =>
      setListField<int>('product_option_items', value);
}
