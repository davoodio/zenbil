import '../database.dart';

class ProductsExtraTable extends SupabaseTable<ProductsExtraRow> {
  @override
  String get tableName => 'products_extra';

  @override
  ProductsExtraRow createRow(Map<String, dynamic> data) =>
      ProductsExtraRow(data);
}

class ProductsExtraRow extends SupabaseDataRow {
  ProductsExtraRow(super.data);

  @override
  SupabaseTable get table => ProductsExtraTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get defaultImageUrl => getField<String>('default_image_url');
  set defaultImageUrl(String? value) =>
      setField<String>('default_image_url', value);

  String? get defaultThumbnailUrl => getField<String>('default_thumbnail_url');
  set defaultThumbnailUrl(String? value) =>
      setField<String>('default_thumbnail_url', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get languageId => getField<int>('language_id');
  set languageId(int? value) => setField<int>('language_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  List<String> get imagesUrl => getListField<String>('images_url');
  set imagesUrl(List<String>? value) =>
      setListField<String>('images_url', value);

  List<String> get otherComments => getListField<String>('other_comments');
  set otherComments(List<String>? value) =>
      setListField<String>('other_comments', value);
}
