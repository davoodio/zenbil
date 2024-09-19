import '../database.dart';

class ConversationMessagesTable extends SupabaseTable<ConversationMessagesRow> {
  @override
  String get tableName => 'conversation_messages';

  @override
  ConversationMessagesRow createRow(Map<String, dynamic> data) =>
      ConversationMessagesRow(data);
}

class ConversationMessagesRow extends SupabaseDataRow {
  ConversationMessagesRow(super.data);

  @override
  SupabaseTable get table => ConversationMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get senderId => getField<String>('sender_id');
  set senderId(String? value) => setField<String>('sender_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  int? get conversationId => getField<int>('conversation_id');
  set conversationId(int? value) => setField<int>('conversation_id', value);

  bool get isSenderSupportAgent => getField<bool>('is_sender_support_agent')!;
  set isSenderSupportAgent(bool value) =>
      setField<bool>('is_sender_support_agent', value);

  dynamic get media => getField<dynamic>('media');
  set media(dynamic value) => setField<dynamic>('media', value);
}
