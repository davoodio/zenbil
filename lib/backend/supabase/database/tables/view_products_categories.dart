import '../database.dart';

class ViewProductsCategoriesTable
    extends SupabaseTable<ViewProductsCategoriesRow> {
  @override
  String get tableName => 'view_products_categories';

  @override
  ViewProductsCategoriesRow createRow(Map<String, dynamic> data) =>
      ViewProductsCategoriesRow(data);
}

class ViewProductsCategoriesRow extends SupabaseDataRow {
  ViewProductsCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewProductsCategoriesTable();

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

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

  int? get productBuyCount => getField<int>('product_buy_count');
  set productBuyCount(int? value) => setField<int>('product_buy_count', value);

  double? get productReviewRate => getField<double>('product_review_rate');
  set productReviewRate(double? value) =>
      setField<double>('product_review_rate', value);

  int? get quantityInInventory => getField<int>('quantity_in_inventory');
  set quantityInInventory(int? value) =>
      setField<int>('quantity_in_inventory', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get productNumberOfReviews => getField<int>('product_number_of_reviews');
  set productNumberOfReviews(int? value) =>
      setField<int>('product_number_of_reviews', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  int? get categoryParentId => getField<int>('category_parent_id');
  set categoryParentId(int? value) =>
      setField<int>('category_parent_id', value);

  String? get categoryImageUrl => getField<String>('category_image_url');
  set categoryImageUrl(String? value) =>
      setField<String>('category_image_url', value);

  String? get categoryImageUrlBlur =>
      getField<String>('category_image_url_blur');
  set categoryImageUrlBlur(String? value) =>
      setField<String>('category_image_url_blur', value);

  String? get categoryDescription => getField<String>('category_description');
  set categoryDescription(String? value) =>
      setField<String>('category_description', value);

  bool? get categoryIsSubCategory => getField<bool>('category_is_sub_category');
  set categoryIsSubCategory(bool? value) =>
      setField<bool>('category_is_sub_category', value);

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

  String? get categoryNameArabic => getField<String>('category_name_arabic');
  set categoryNameArabic(String? value) =>
      setField<String>('category_name_arabic', value);

  String? get categoryNameKurdish => getField<String>('category_name_kurdish');
  set categoryNameKurdish(String? value) =>
      setField<String>('category_name_kurdish', value);
}
