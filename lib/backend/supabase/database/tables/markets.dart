import '../database.dart';

class MarketsTable extends SupabaseTable<MarketsRow> {
  @override
  String get tableName => 'markets';

  @override
  MarketsRow createRow(Map<String, dynamic> data) => MarketsRow(data);
}

class MarketsRow extends SupabaseDataRow {
  MarketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MarketsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isDefault => getField<bool>('is_default');
  set isDefault(bool? value) => setField<bool>('is_default', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get statusDescription => getField<String>('status_description');
  set statusDescription(String? value) =>
      setField<String>('status_description', value);

  int? get languageId => getField<int>('language_id');
  set languageId(int? value) => setField<int>('language_id', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  dynamic? get social => getField<dynamic>('social');
  set social(dynamic? value) => setField<dynamic>('social', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  dynamic? get marketBanner => getField<dynamic>('market_banner');
  set marketBanner(dynamic? value) => setField<dynamic>('market_banner', value);

  String? get headerUrl => getField<String>('header_url');
  set headerUrl(String? value) => setField<String>('header_url', value);

  bool? get isPage => getField<bool>('is_page');
  set isPage(bool? value) => setField<bool>('is_page', value);

  String? get nameArabic => getField<String>('name_arabic');
  set nameArabic(String? value) => setField<String>('name_arabic', value);

  String? get descriptionArabic => getField<String>('description_arabic');
  set descriptionArabic(String? value) =>
      setField<String>('description_arabic', value);

  String? get nameKurdish => getField<String>('name_kurdish');
  set nameKurdish(String? value) => setField<String>('name_kurdish', value);

  String? get descriptionKurdish => getField<String>('description_kurdish');
  set descriptionKurdish(String? value) =>
      setField<String>('description_kurdish', value);
}
