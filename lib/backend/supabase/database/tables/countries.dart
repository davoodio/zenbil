import '../database.dart';

class CountriesTable extends SupabaseTable<CountriesRow> {
  @override
  String get tableName => 'countries';

  @override
  CountriesRow createRow(Map<String, dynamic> data) => CountriesRow(data);
}

class CountriesRow extends SupabaseDataRow {
  CountriesRow(super.data);

  @override
  SupabaseTable get table => CountriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  String? get currencySymbol => getField<String>('currency_symbol');
  set currencySymbol(String? value) =>
      setField<String>('currency_symbol', value);

  String? get dialCode => getField<String>('dial_code');
  set dialCode(String? value) => setField<String>('dial_code', value);

  String? get currencySymbolArabic =>
      getField<String>('currency_symbol_arabic');
  set currencySymbolArabic(String? value) =>
      setField<String>('currency_symbol_arabic', value);

  String? get currencySymbolKurdish =>
      getField<String>('currency_symbol_kurdish');
  set currencySymbolKurdish(String? value) =>
      setField<String>('currency_symbol_kurdish', value);

  double? get currencyExchangeRate =>
      getField<double>('currency_exchange_rate');
  set currencyExchangeRate(double? value) =>
      setField<double>('currency_exchange_rate', value);
}
