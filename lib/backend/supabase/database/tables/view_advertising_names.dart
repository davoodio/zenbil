import '../database.dart';

class ViewAdvertisingNamesTable extends SupabaseTable<ViewAdvertisingNamesRow> {
  @override
  String get tableName => 'view_advertising_names';

  @override
  ViewAdvertisingNamesRow createRow(Map<String, dynamic> data) =>
      ViewAdvertisingNamesRow(data);
}

class ViewAdvertisingNamesRow extends SupabaseDataRow {
  ViewAdvertisingNamesRow(super.data);

  @override
  SupabaseTable get table => ViewAdvertisingNamesTable();

  int? get advertisingId => getField<int>('advertising_id');
  set advertisingId(int? value) => setField<int>('advertising_id', value);

  DateTime? get advertisingCreatedAt =>
      getField<DateTime>('advertising_created_at');
  set advertisingCreatedAt(DateTime? value) =>
      setField<DateTime>('advertising_created_at', value);

  String? get advertisingAdsType => getField<String>('advertising_ads_type');
  set advertisingAdsType(String? value) =>
      setField<String>('advertising_ads_type', value);

  List<String> get advertisingAdsPlace =>
      getListField<String>('advertising_ads_place');
  set advertisingAdsPlace(List<String>? value) =>
      setListField<String>('advertising_ads_place', value);

  String? get advertisingStatus => getField<String>('advertising_status');
  set advertisingStatus(String? value) =>
      setField<String>('advertising_status', value);

  DateTime? get advertisingStartDate =>
      getField<DateTime>('advertising_start_date');
  set advertisingStartDate(DateTime? value) =>
      setField<DateTime>('advertising_start_date', value);

  DateTime? get advertisingEndDate =>
      getField<DateTime>('advertising_end_date');
  set advertisingEndDate(DateTime? value) =>
      setField<DateTime>('advertising_end_date', value);

  String? get advertisingBannerUrl =>
      getField<String>('advertising_banner_url');
  set advertisingBannerUrl(String? value) =>
      setField<String>('advertising_banner_url', value);

  String? get advertisingWebsiteUrl =>
      getField<String>('advertising_website_url');
  set advertisingWebsiteUrl(String? value) =>
      setField<String>('advertising_website_url', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  String? get marketName => getField<String>('market_name');
  set marketName(String? value) => setField<String>('market_name', value);

  int? get productBrandId => getField<int>('product_brand_id');
  set productBrandId(int? value) => setField<int>('product_brand_id', value);

  String? get productBrandName => getField<String>('product_brand_name');
  set productBrandName(String? value) =>
      setField<String>('product_brand_name', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);
}
