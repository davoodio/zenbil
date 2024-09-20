import '../database.dart';

class TransactionsTable extends SupabaseTable<TransactionsRow> {
  @override
  String get tableName => 'transactions';

  @override
  TransactionsRow createRow(Map<String, dynamic> data) => TransactionsRow(data);
}

class TransactionsRow extends SupabaseDataRow {
  TransactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransactionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get walletId => getField<int>('wallet_id');
  set walletId(int? value) => setField<int>('wallet_id', value);

  String? get transactionType => getField<String>('transaction_type');
  set transactionType(String? value) =>
      setField<String>('transaction_type', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get paymentTransactionId =>
      getField<String>('payment_transaction_id');
  set paymentTransactionId(String? value) =>
      setField<String>('payment_transaction_id', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  DateTime? get paymentTransactionDate =>
      getField<DateTime>('payment_transaction_date');
  set paymentTransactionDate(DateTime? value) =>
      setField<DateTime>('payment_transaction_date', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  int? get paymentTypeId => getField<int>('payment_type_id');
  set paymentTypeId(int? value) => setField<int>('payment_type_id', value);
}
