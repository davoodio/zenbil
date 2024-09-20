import '../database.dart';

class CategoriesTable extends SupabaseTable<CategoriesRow> {
  @override
  String get tableName => 'categories';

  @override
  CategoriesRow createRow(Map<String, dynamic> data) => CategoriesRow(data);
}

class CategoriesRow extends SupabaseDataRow {
  CategoriesRow(super.data);

  @override
  SupabaseTable get table => CategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get parentId => getField<int>('parent_id');
  set parentId(int? value) => setField<int>('parent_id', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get imageUrlBlur => getField<String>('image_url_blur');
  set imageUrlBlur(String? value) => setField<String>('image_url_blur', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isSubCategory => getField<bool>('is_sub_category');
  set isSubCategory(bool? value) => setField<bool>('is_sub_category', value);

  String? get nameArabic => getField<String>('name_arabic');
  set nameArabic(String? value) => setField<String>('name_arabic', value);

  String? get nameKurdish => getField<String>('name_kurdish');
  set nameKurdish(String? value) => setField<String>('name_kurdish', value);
}
