import '../database.dart';

class WalletsTable extends SupabaseTable<WalletsRow> {
  @override
  String get tableName => 'wallets';

  @override
  WalletsRow createRow(Map<String, dynamic> data) => WalletsRow(data);
}

class WalletsRow extends SupabaseDataRow {
  WalletsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WalletsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double get balance => getField<double>('balance')!;
  set balance(double value) => setField<double>('balance', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  String? get transactionSymbol => getField<String>('transaction_symbol');
  set transactionSymbol(String? value) =>
      setField<String>('transaction_symbol', value);
}
