import '../database.dart';

class ProductsCategoriesTable extends SupabaseTable<ProductsCategoriesRow> {
  @override
  String get tableName => 'products_categories';

  @override
  ProductsCategoriesRow createRow(Map<String, dynamic> data) =>
      ProductsCategoriesRow(data);
}

class ProductsCategoriesRow extends SupabaseDataRow {
  ProductsCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get productID => getField<int>('productID');
  set productID(int? value) => setField<int>('productID', value);

  int? get categoryID => getField<int>('categoryID');
  set categoryID(int? value) => setField<int>('categoryID', value);
}
