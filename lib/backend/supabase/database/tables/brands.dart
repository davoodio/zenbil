import '../database.dart';

class BrandsTable extends SupabaseTable<BrandsRow> {
  @override
  String get tableName => 'brands';

  @override
  BrandsRow createRow(Map<String, dynamic> data) => BrandsRow(data);
}

class BrandsRow extends SupabaseDataRow {
  BrandsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BrandsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
