import '../database.dart';

class ViewMarketableProductsTable
    extends SupabaseTable<ViewMarketableProductsRow> {
  @override
  String get tableName => 'view_marketable_products';

  @override
  ViewMarketableProductsRow createRow(Map<String, dynamic> data) =>
      ViewMarketableProductsRow(data);
}

class ViewMarketableProductsRow extends SupabaseDataRow {
  ViewMarketableProductsRow(super.data);

  @override
  SupabaseTable get table => ViewMarketableProductsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get subCategoryId => getField<int>('sub_category_id');
  set subCategoryId(int? value) => setField<int>('sub_category_id', value);

  String? get defaultImageUrl => getField<String>('default_image_url');
  set defaultImageUrl(String? value) =>
      setField<String>('default_image_url', value);

  int? get languageId => getField<int>('language_id');
  set languageId(int? value) => setField<int>('language_id', value);

  String? get defaultThumbnailUrl => getField<String>('default_thumbnail_url');
  set defaultThumbnailUrl(String? value) =>
      setField<String>('default_thumbnail_url', value);

  int? get brandId => getField<int>('brand_id');
  set brandId(int? value) => setField<int>('brand_id', value);

  List<String> get imagesUrl => getListField<String>('images_url');
  set imagesUrl(List<String>? value) =>
      setListField<String>('images_url', value);

  bool? get checkInventory => getField<bool>('check_inventory');
  set checkInventory(bool? value) => setField<bool>('check_inventory', value);

  List<String> get otherComments => getListField<String>('other_comments');
  set otherComments(List<String>? value) =>
      setListField<String>('other_comments', value);

  double? get discountedPrice => getField<double>('discounted_price');
  set discountedPrice(double? value) =>
      setField<double>('discounted_price', value);

  double? get discountPercent => getField<double>('discount_percent');
  set discountPercent(double? value) =>
      setField<double>('discount_percent', value);

  int? get deliveryMethodId => getField<int>('delivery_method_id');
  set deliveryMethodId(int? value) =>
      setField<int>('delivery_method_id', value);

  bool? get hasSpecialDeliveryMethod =>
      getField<bool>('has_special_delivery_method');
  set hasSpecialDeliveryMethod(bool? value) =>
      setField<bool>('has_special_delivery_method', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  double? get size => getField<double>('size');
  set size(double? value) => setField<double>('size', value);

  bool? get deliveryIsFree => getField<bool>('delivery_is_free');
  set deliveryIsFree(bool? value) => setField<bool>('delivery_is_free', value);

  double? get marketPercent => getField<double>('market_percent');
  set marketPercent(double? value) => setField<double>('market_percent', value);

  int? get viewCount => getField<int>('view_count');
  set viewCount(int? value) => setField<int>('view_count', value);

  int? get likeCount => getField<int>('like_count');
  set likeCount(int? value) => setField<int>('like_count', value);

  int? get buyCount => getField<int>('buy_count');
  set buyCount(int? value) => setField<int>('buy_count', value);

  double? get reviewRate => getField<double>('review_rate');
  set reviewRate(double? value) => setField<double>('review_rate', value);

  int? get numberOfReviews => getField<int>('number_of_reviews');
  set numberOfReviews(int? value) => setField<int>('number_of_reviews', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get sku => getField<String>('SKU');
  set sku(String? value) => setField<String>('SKU', value);

  String? get barcode => getField<String>('Barcode');
  set barcode(String? value) => setField<String>('Barcode', value);

  bool? get availableForMarketers => getField<bool>('available_for_marketers');
  set availableForMarketers(bool? value) =>
      setField<bool>('available_for_marketers', value);

  int? get quantityInInventory => getField<int>('quantity_in_inventory');
  set quantityInInventory(int? value) =>
      setField<int>('quantity_in_inventory', value);

  List<int> get deliveryMethodsAvailableList =>
      getListField<int>('delivery_methods_available_list');
  set deliveryMethodsAvailableList(List<int>? value) =>
      setListField<int>('delivery_methods_available_list', value);

  String? get marketingOption => getField<String>('marketing_option');
  set marketingOption(String? value) =>
      setField<String>('marketing_option', value);

  String? get nameArabic => getField<String>('name_arabic');
  set nameArabic(String? value) => setField<String>('name_arabic', value);

  String? get nameKurdish => getField<String>('name_kurdish');
  set nameKurdish(String? value) => setField<String>('name_kurdish', value);

  String? get descriptionArabic => getField<String>('description_arabic');
  set descriptionArabic(String? value) =>
      setField<String>('description_arabic', value);

  String? get descriptionKurdish => getField<String>('description_kurdish');
  set descriptionKurdish(String? value) =>
      setField<String>('description_kurdish', value);

  bool? get isApproved => getField<bool>('is_approved');
  set isApproved(bool? value) => setField<bool>('is_approved', value);

  String? get returnPolicy => getField<String>('return_policy');
  set returnPolicy(String? value) => setField<String>('return_policy', value);

  String? get warranty => getField<String>('warranty');
  set warranty(String? value) => setField<String>('warranty', value);

  double? get commissionFeePercentage =>
      getField<double>('commission_fee_percentage');
  set commissionFeePercentage(double? value) =>
      setField<double>('commission_fee_percentage', value);

  double? get marketingFeePercentage =>
      getField<double>('marketing_fee_percentage');
  set marketingFeePercentage(double? value) =>
      setField<double>('marketing_fee_percentage', value);

  List<int> get categoryIds => getListField<int>('category_ids');
  set categoryIds(List<int>? value) => setListField<int>('category_ids', value);

  double? get starMarketingFeePercentage =>
      getField<double>('star_marketing_fee_percentage');
  set starMarketingFeePercentage(double? value) =>
      setField<double>('star_marketing_fee_percentage', value);
}
