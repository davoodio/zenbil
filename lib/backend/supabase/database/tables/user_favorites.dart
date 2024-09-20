import '../database.dart';

class UserFavoritesTable extends SupabaseTable<UserFavoritesRow> {
  @override
  String get tableName => 'user_favorites';

  @override
  UserFavoritesRow createRow(Map<String, dynamic> data) =>
      UserFavoritesRow(data);
}

class UserFavoritesRow extends SupabaseDataRow {
  UserFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoritesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  bool? get isProduct => getField<bool>('is_product');
  set isProduct(bool? value) => setField<bool>('is_product', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
