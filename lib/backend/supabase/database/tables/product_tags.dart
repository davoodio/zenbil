import '../database.dart';

class ProductTagsTable extends SupabaseTable<ProductTagsRow> {
  @override
  String get tableName => 'product_tags';

  @override
  ProductTagsRow createRow(Map<String, dynamic> data) => ProductTagsRow(data);
}

class ProductTagsRow extends SupabaseDataRow {
  ProductTagsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductTagsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get tagId => getField<int>('tag_id');
  set tagId(int? value) => setField<int>('tag_id', value);

  int? get sortIndex => getField<int>('sort_index');
  set sortIndex(int? value) => setField<int>('sort_index', value);
}
