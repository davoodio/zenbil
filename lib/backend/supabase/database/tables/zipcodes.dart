import '../database.dart';

class ZipcodesTable extends SupabaseTable<ZipcodesRow> {
  @override
  String get tableName => 'zipcodes';

  @override
  ZipcodesRow createRow(Map<String, dynamic> data) => ZipcodesRow(data);
}

class ZipcodesRow extends SupabaseDataRow {
  ZipcodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ZipcodesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String? get zipcode => getField<String>('zipcode');
  set zipcode(String? value) => setField<String>('zipcode', value);
}
