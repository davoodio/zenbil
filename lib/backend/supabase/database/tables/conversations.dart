import '../database.dart';

class ConversationsTable extends SupabaseTable<ConversationsRow> {
  @override
  String get tableName => 'conversations';

  @override
  ConversationsRow createRow(Map<String, dynamic> data) =>
      ConversationsRow(data);
}

class ConversationsRow extends SupabaseDataRow {
  ConversationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConversationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userCreatedId => getField<String>('user_created_id');
  set userCreatedId(String? value) =>
      setField<String>('user_created_id', value);

  String? get adminCurrentId => getField<String>('admin_current_id');
  set adminCurrentId(String? value) =>
      setField<String>('admin_current_id', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get lastUpdate => getField<DateTime>('last_update');
  set lastUpdate(DateTime? value) => setField<DateTime>('last_update', value);

  int? get adminUnreadMessageNumber =>
      getField<int>('admin_unread_message_number');
  set adminUnreadMessageNumber(int? value) =>
      setField<int>('admin_unread_message_number', value);

  int? get userUnreadMessageNumber =>
      getField<int>('user_unread_message_number');
  set userUnreadMessageNumber(int? value) =>
      setField<int>('user_unread_message_number', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  String? get lastMessageSenderId => getField<String>('last_message_sender_id');
  set lastMessageSenderId(String? value) =>
      setField<String>('last_message_sender_id', value);
}
