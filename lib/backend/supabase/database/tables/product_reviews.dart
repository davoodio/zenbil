import '../database.dart';

class ProductReviewsTable extends SupabaseTable<ProductReviewsRow> {
  @override
  String get tableName => 'product_reviews';

  @override
  ProductReviewsRow createRow(Map<String, dynamic> data) =>
      ProductReviewsRow(data);
}

class ProductReviewsRow extends SupabaseDataRow {
  ProductReviewsRow(super.data);

  @override
  SupabaseTable get table => ProductReviewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  int? get rate => getField<int>('rate');
  set rate(int? value) => setField<int>('rate', value);

  String? get userSenderId => getField<String>('user_sender_id');
  set userSenderId(String? value) => setField<String>('user_sender_id', value);

  int? get languageId => getField<int>('language_id');
  set languageId(int? value) => setField<int>('language_id', value);

  List<String> get attachmentsUrl => getListField<String>('attachments_url');
  set attachmentsUrl(List<String>? value) =>
      setListField<String>('attachments_url', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
