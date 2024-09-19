import '../database.dart';

class AdvertisingTable extends SupabaseTable<AdvertisingRow> {
  @override
  String get tableName => 'advertising';

  @override
  AdvertisingRow createRow(Map<String, dynamic> data) => AdvertisingRow(data);
}

class AdvertisingRow extends SupabaseDataRow {
  AdvertisingRow(super.data);

  @override
  SupabaseTable get table => AdvertisingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get bannerUrl => getField<String>('banner_url');
  set bannerUrl(String? value) => setField<String>('banner_url', value);

  String? get bannerUrlBlur => getField<String>('banner_url_blur');
  set bannerUrlBlur(String? value) =>
      setField<String>('banner_url_blur', value);

  int? get viewCount => getField<int>('view_count');
  set viewCount(int? value) => setField<int>('view_count', value);

  int? get clickCount => getField<int>('click_count');
  set clickCount(int? value) => setField<int>('click_count', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  String? get websiteUrl => getField<String>('website_url');
  set websiteUrl(String? value) => setField<String>('website_url', value);

  bool? get showCountDown => getField<bool>('show_count_down');
  set showCountDown(bool? value) => setField<bool>('show_count_down', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  String? get adsType => getField<String>('ads_type');
  set adsType(String? value) => setField<String>('ads_type', value);

  List<String> get adsPlace => getListField<String>('ads_place');
  set adsPlace(List<String>? value) => setListField<String>('ads_place', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  DateTime? get lastViewDate => getField<DateTime>('last_view_date');
  set lastViewDate(DateTime? value) =>
      setField<DateTime>('last_view_date', value);

  int? get productBrandId => getField<int>('product_brand_id');
  set productBrandId(int? value) => setField<int>('product_brand_id', value);
}
