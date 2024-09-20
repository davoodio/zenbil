import '../database.dart';

class ProductBrandsTable extends SupabaseTable<ProductBrandsRow> {
  @override
  String get tableName => 'product_brands';

  @override
  ProductBrandsRow createRow(Map<String, dynamic> data) =>
      ProductBrandsRow(data);
}

class ProductBrandsRow extends SupabaseDataRow {
  ProductBrandsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductBrandsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get imageUrlBlur => getField<String>('image_url_blur');
  set imageUrlBlur(String? value) => setField<String>('image_url_blur', value);
}
