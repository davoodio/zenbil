import '../database.dart';

class UserRoleTable extends SupabaseTable<UserRoleRow> {
  @override
  String get tableName => 'user_role';

  @override
  UserRoleRow createRow(Map<String, dynamic> data) => UserRoleRow(data);
}

class UserRoleRow extends SupabaseDataRow {
  UserRoleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRoleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get role => getField<int>('role');
  set role(int? value) => setField<int>('role', value);

  String? get roleCode => getField<String>('role_code');
  set roleCode(String? value) => setField<String>('role_code', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
