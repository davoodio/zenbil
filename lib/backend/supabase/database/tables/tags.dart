import '../database.dart';

class TagsTable extends SupabaseTable<TagsRow> {
  @override
  String get tableName => 'tags';

  @override
  TagsRow createRow(Map<String, dynamic> data) => TagsRow(data);
}

class TagsRow extends SupabaseDataRow {
  TagsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TagsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameArabic => getField<String>('name_arabic');
  set nameArabic(String? value) => setField<String>('name_arabic', value);

  String? get nameKurdish => getField<String>('name_kurdish');
  set nameKurdish(String? value) => setField<String>('name_kurdish', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
