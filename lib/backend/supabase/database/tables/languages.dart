import '../database.dart';

class LanguagesTable extends SupabaseTable<LanguagesRow> {
  @override
  String get tableName => 'languages';

  @override
  LanguagesRow createRow(Map<String, dynamic> data) => LanguagesRow(data);
}

class LanguagesRow extends SupabaseDataRow {
  LanguagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LanguagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  bool? get isDefault => getField<bool>('is_default');
  set isDefault(bool? value) => setField<bool>('is_default', value);
}
