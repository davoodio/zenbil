import '../database.dart';

class PaymentTypesTable extends SupabaseTable<PaymentTypesRow> {
  @override
  String get tableName => 'payment_types';

  @override
  PaymentTypesRow createRow(Map<String, dynamic> data) => PaymentTypesRow(data);
}

class PaymentTypesRow extends SupabaseDataRow {
  PaymentTypesRow(super.data);

  @override
  SupabaseTable get table => PaymentTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool get published => getField<bool>('published')!;
  set published(bool value) => setField<bool>('published', value);

  int? get languageId => getField<int>('language_id');
  set languageId(int? value) => setField<int>('language_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
