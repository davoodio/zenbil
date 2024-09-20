import '../database.dart';

class AppGeneralSettingsTable extends SupabaseTable<AppGeneralSettingsRow> {
  @override
  String get tableName => 'app_general_settings';

  @override
  AppGeneralSettingsRow createRow(Map<String, dynamic> data) =>
      AppGeneralSettingsRow(data);
}

class AppGeneralSettingsRow extends SupabaseDataRow {
  AppGeneralSettingsRow(super.data);

  @override
  SupabaseTable get table => AppGeneralSettingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get enableAdvertisement => getField<bool>('enable_advertisement');
  set enableAdvertisement(bool? value) =>
      setField<bool>('enable_advertisement', value);

  bool? get showBusinessMarkets => getField<bool>('show_business_markets');
  set showBusinessMarkets(bool? value) =>
      setField<bool>('show_business_markets', value);

  int? get maxAmountProductsStarMarkets =>
      getField<int>('max_amount_products_star_markets');
  set maxAmountProductsStarMarkets(int? value) =>
      setField<int>('max_amount_products_star_markets', value);

  bool? get enableWalletAsPaymentOption =>
      getField<bool>('enable_wallet_as_payment_option');
  set enableWalletAsPaymentOption(bool? value) =>
      setField<bool>('enable_wallet_as_payment_option', value);

  bool? get enableWalletTopup => getField<bool>('enable_wallet_topup');
  set enableWalletTopup(bool? value) =>
      setField<bool>('enable_wallet_topup', value);

  int? get defaultDeliveryMethodId =>
      getField<int>('default_delivery_method_id');
  set defaultDeliveryMethodId(int? value) =>
      setField<int>('default_delivery_method_id', value);

  bool? get enableDocumentUploadBusiness =>
      getField<bool>('enable_document_upload_business');
  set enableDocumentUploadBusiness(bool? value) =>
      setField<bool>('enable_document_upload_business', value);

  bool? get enableDocumentUploadStar =>
      getField<bool>('enable_document_upload_star');
  set enableDocumentUploadStar(bool? value) =>
      setField<bool>('enable_document_upload_star', value);

  bool? get enableAdvertisementOnCategories =>
      getField<bool>('enable_advertisement_on_categories');
  set enableAdvertisementOnCategories(bool? value) =>
      setField<bool>('enable_advertisement_on_categories', value);

  bool? get enableAdvertisementOnHome =>
      getField<bool>('enable_advertisement_on_home');
  set enableAdvertisementOnHome(bool? value) =>
      setField<bool>('enable_advertisement_on_home', value);

  bool? get enableAdvertisementOnSubCategories =>
      getField<bool>('enable_advertisement_on_sub_categories');
  set enableAdvertisementOnSubCategories(bool? value) =>
      setField<bool>('enable_advertisement_on_sub_categories', value);

  bool? get enableAdvertisementOnMarkets =>
      getField<bool>('enable_advertisement_on_markets');
  set enableAdvertisementOnMarkets(bool? value) =>
      setField<bool>('enable_advertisement_on_markets', value);

  double? get minAmountWalletTopup =>
      getField<double>('min_amount_wallet_topup');
  set minAmountWalletTopup(double? value) =>
      setField<double>('min_amount_wallet_topup', value);

  double? get maxAmountWalletTopup =>
      getField<double>('max_amount_wallet_topup');
  set maxAmountWalletTopup(double? value) =>
      setField<double>('max_amount_wallet_topup', value);

  dynamic get social => getField<dynamic>('social');
  set social(dynamic value) => setField<dynamic>('social', value);

  String? get paymentRedirectUrlWeb =>
      getField<String>('payment_redirect_url_web');
  set paymentRedirectUrlWeb(String? value) =>
      setField<String>('payment_redirect_url_web', value);

  String? get paymentBannerImage => getField<String>('payment_banner_image');
  set paymentBannerImage(String? value) =>
      setField<String>('payment_banner_image', value);

  bool? get enableAdvertisementOnProductDetail =>
      getField<bool>('enable_advertisement_on_product_detail');
  set enableAdvertisementOnProductDetail(bool? value) =>
      setField<bool>('enable_advertisement_on_product_detail', value);

  double? get commissionFeePercentage =>
      getField<double>('commission_fee_percentage');
  set commissionFeePercentage(double? value) =>
      setField<double>('commission_fee_percentage', value);

  double? get marketingFeePercentage =>
      getField<double>('marketing_fee_percentage');
  set marketingFeePercentage(double? value) =>
      setField<double>('marketing_fee_percentage', value);
}
