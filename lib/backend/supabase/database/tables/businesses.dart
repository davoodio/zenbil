import '../database.dart';

class BusinessesTable extends SupabaseTable<BusinessesRow> {
  @override
  String get tableName => 'businesses';

  @override
  BusinessesRow createRow(Map<String, dynamic> data) => BusinessesRow(data);
}

class BusinessesRow extends SupabaseDataRow {
  BusinessesRow(super.data);

  @override
  SupabaseTable get table => BusinessesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get logo => getField<String>('logo');
  set logo(String? value) => setField<String>('logo', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String? get footerUrl => getField<String>('footer_url');
  set footerUrl(String? value) => setField<String>('footer_url', value);

  String? get footerUrlBlur => getField<String>('footer_url_blur');
  set footerUrlBlur(String? value) =>
      setField<String>('footer_url_blur', value);

  String? get statusDescription => getField<String>('status_description');
  set statusDescription(String? value) =>
      setField<String>('status_description', value);

  int? get languageId => getField<int>('language_id');
  set languageId(int? value) => setField<int>('language_id', value);

  int? get defaultMarketId => getField<int>('default_market_id');
  set defaultMarketId(int? value) => setField<int>('default_market_id', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  dynamic get social => getField<dynamic>('social');
  set social(dynamic value) => setField<dynamic>('social', value);

  int? get warehouseZipcodeId => getField<int>('warehouse_zipcode_id');
  set warehouseZipcodeId(int? value) =>
      setField<int>('warehouse_zipcode_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

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

  int? get warehouseAddressId => getField<int>('warehouse_address_id');
  set warehouseAddressId(int? value) =>
      setField<int>('warehouse_address_id', value);

  double? get commissionFeePercentage =>
      getField<double>('commission_fee_percentage');
  set commissionFeePercentage(double? value) =>
      setField<double>('commission_fee_percentage', value);

  double? get marketingFeePercentage =>
      getField<double>('marketing_fee_percentage');
  set marketingFeePercentage(double? value) =>
      setField<double>('marketing_fee_percentage', value);
}
