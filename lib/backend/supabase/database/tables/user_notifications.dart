import '../database.dart';

class UserNotificationsTable extends SupabaseTable<UserNotificationsRow> {
  @override
  String get tableName => 'user_notifications';

  @override
  UserNotificationsRow createRow(Map<String, dynamic> data) =>
      UserNotificationsRow(data);
}

class UserNotificationsRow extends SupabaseDataRow {
  UserNotificationsRow(super.data);

  @override
  SupabaseTable get table => UserNotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get senderId => getField<String>('sender_id');
  set senderId(String? value) => setField<String>('sender_id', value);

  bool? get seen => getField<bool>('seen');
  set seen(bool? value) => setField<bool>('seen', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
