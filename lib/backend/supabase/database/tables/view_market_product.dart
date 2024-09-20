import '../database.dart';

class ViewMarketProductTable extends SupabaseTable<ViewMarketProductRow> {
  @override
  String get tableName => 'view_market_product';

  @override
  ViewMarketProductRow createRow(Map<String, dynamic> data) =>
      ViewMarketProductRow(data);
}

class ViewMarketProductRow extends SupabaseDataRow {
  ViewMarketProductRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewMarketProductTable();

  int? get marketProductId => getField<int>('market_product_id');
  set marketProductId(int? value) => setField<int>('market_product_id', value);

  DateTime? get marketProductCreatedAt =>
      getField<DateTime>('market_product_created_at');
  set marketProductCreatedAt(DateTime? value) =>
      setField<DateTime>('market_product_created_at', value);

  bool? get marketProductIsActive => getField<bool>('market_product_is_active');
  set marketProductIsActive(bool? value) =>
      setField<bool>('market_product_is_active', value);

  int? get marketProductProductId => getField<int>('market_product_product_id');
  set marketProductProductId(int? value) =>
      setField<int>('market_product_product_id', value);

  int? get marketProductMarketId => getField<int>('market_product_market_id');
  set marketProductMarketId(int? value) =>
      setField<int>('market_product_market_id', value);

  String? get marketProductProductStatus =>
      getField<String>('market_product_product_status');
  set marketProductProductStatus(String? value) =>
      setField<String>('market_product_product_status', value);

  String? get marketProductApprovedBy =>
      getField<String>('market_product_approved_by');
  set marketProductApprovedBy(String? value) =>
      setField<String>('market_product_approved_by', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get productDescription => getField<String>('product_description');
  set productDescription(String? value) =>
      setField<String>('product_description', value);

  String? get productModel => getField<String>('product_model');
  set productModel(String? value) => setField<String>('product_model', value);

  String? get productNotes => getField<String>('product_notes');
  set productNotes(String? value) => setField<String>('product_notes', value);

  int? get productBusinessId => getField<int>('product_business_id');
  set productBusinessId(int? value) =>
      setField<int>('product_business_id', value);

  double? get productPrice => getField<double>('product_price');
  set productPrice(double? value) => setField<double>('product_price', value);

  int? get productSubCategoryId => getField<int>('product_sub_category_id');
  set productSubCategoryId(int? value) =>
      setField<int>('product_sub_category_id', value);

  String? get productDefaultImageUrl =>
      getField<String>('product_default_image_url');
  set productDefaultImageUrl(String? value) =>
      setField<String>('product_default_image_url', value);

  int? get productLanguageId => getField<int>('product_language_id');
  set productLanguageId(int? value) =>
      setField<int>('product_language_id', value);

  String? get productDefaultThumbnailUrl =>
      getField<String>('product_default_thumbnail_url');
  set productDefaultThumbnailUrl(String? value) =>
      setField<String>('product_default_thumbnail_url', value);

  int? get productBrandId => getField<int>('product_brand_id');
  set productBrandId(int? value) => setField<int>('product_brand_id', value);

  List<String> get productImagesUrl =>
      getListField<String>('product_images_url');
  set productImagesUrl(List<String>? value) =>
      setListField<String>('product_images_url', value);

  bool? get productCheckInventory => getField<bool>('product_check_inventory');
  set productCheckInventory(bool? value) =>
      setField<bool>('product_check_inventory', value);

  List<String> get productOtherComments =>
      getListField<String>('product_other_comments');
  set productOtherComments(List<String>? value) =>
      setListField<String>('product_other_comments', value);

  double? get productDiscountedPrice =>
      getField<double>('product_discounted_price');
  set productDiscountedPrice(double? value) =>
      setField<double>('product_discounted_price', value);

  double? get productDiscountPercent =>
      getField<double>('product_discount_percent');
  set productDiscountPercent(double? value) =>
      setField<double>('product_discount_percent', value);

  int? get productDeliveryMethodId =>
      getField<int>('product_delivery_method_id');
  set productDeliveryMethodId(int? value) =>
      setField<int>('product_delivery_method_id', value);

  bool? get productHasSpecialDeliveryMethod =>
      getField<bool>('product_has_special_delivery_method');
  set productHasSpecialDeliveryMethod(bool? value) =>
      setField<bool>('product_has_special_delivery_method', value);

  double? get productWeight => getField<double>('product_weight');
  set productWeight(double? value) => setField<double>('product_weight', value);

  double? get productSize => getField<double>('product_size');
  set productSize(double? value) => setField<double>('product_size', value);

  bool? get productDeliveryIsFree => getField<bool>('product_delivery_is_free');
  set productDeliveryIsFree(bool? value) =>
      setField<bool>('product_delivery_is_free', value);

  double? get productMarketPercent =>
      getField<double>('product_market_percent');
  set productMarketPercent(double? value) =>
      setField<double>('product_market_percent', value);

  int? get productViewCount => getField<int>('product_view_count');
  set productViewCount(int? value) =>
      setField<int>('product_view_count', value);

  int? get productLikeCount => getField<int>('product_like_count');
  set productLikeCount(int? value) =>
      setField<int>('product_like_count', value);

  int? get quantityInInventory => getField<int>('quantity_in_inventory');
  set quantityInInventory(int? value) =>
      setField<int>('quantity_in_inventory', value);

  int? get productBuyCount => getField<int>('product_buy_count');
  set productBuyCount(int? value) => setField<int>('product_buy_count', value);

  double? get productReviewRate => getField<double>('product_review_rate');
  set productReviewRate(double? value) =>
      setField<double>('product_review_rate', value);

  int? get productNumberOfReviews => getField<int>('product_number_of_reviews');
  set productNumberOfReviews(int? value) =>
      setField<int>('product_number_of_reviews', value);

  String? get marketName => getField<String>('market_name');
  set marketName(String? value) => setField<String>('market_name', value);

  String? get marketDescription => getField<String>('market_description');
  set marketDescription(String? value) =>
      setField<String>('market_description', value);

  bool? get marketIsDefault => getField<bool>('market_is_default');
  set marketIsDefault(bool? value) =>
      setField<bool>('market_is_default', value);

  String? get marketAddress => getField<String>('market_address');
  set marketAddress(String? value) => setField<String>('market_address', value);

  int? get marketCityId => getField<int>('market_city_id');
  set marketCityId(int? value) => setField<int>('market_city_id', value);

  String? get marketLogoUrl => getField<String>('market_logo_url');
  set marketLogoUrl(String? value) =>
      setField<String>('market_logo_url', value);

  String? get marketStatus => getField<String>('market_status');
  set marketStatus(String? value) => setField<String>('market_status', value);

  String? get marketStatusDescription =>
      getField<String>('market_status_description');
  set marketStatusDescription(String? value) =>
      setField<String>('market_status_description', value);

  int? get marketLanguageId => getField<int>('market_language_id');
  set marketLanguageId(int? value) =>
      setField<int>('market_language_id', value);

  String? get marketOwnerId => getField<String>('market_owner_id');
  set marketOwnerId(String? value) =>
      setField<String>('market_owner_id', value);

  dynamic? get marketSocial => getField<dynamic>('market_social');
  set marketSocial(dynamic? value) => setField<dynamic>('market_social', value);

  String? get marketType => getField<String>('market_type');
  set marketType(String? value) => setField<String>('market_type', value);

  int? get marketBusinessId => getField<int>('market_business_id');
  set marketBusinessId(int? value) =>
      setField<int>('market_business_id', value);

  String? get marketGender => getField<String>('market_gender');
  set marketGender(String? value) => setField<String>('market_gender', value);

  dynamic? get marketBanner => getField<dynamic>('market_banner');
  set marketBanner(dynamic? value) => setField<dynamic>('market_banner', value);

  String? get productNameArabic => getField<String>('product_name_arabic');
  set productNameArabic(String? value) =>
      setField<String>('product_name_arabic', value);

  String? get productNameKurdish => getField<String>('product_name_kurdish');
  set productNameKurdish(String? value) =>
      setField<String>('product_name_kurdish', value);

  String? get productDescriptionArabic =>
      getField<String>('product_description_arabic');
  set productDescriptionArabic(String? value) =>
      setField<String>('product_description_arabic', value);

  String? get productDescriptionKurdish =>
      getField<String>('product_description_kurdish');
  set productDescriptionKurdish(String? value) =>
      setField<String>('product_description_kurdish', value);
}
