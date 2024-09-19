import '../database.dart';

class RolesTable extends SupabaseTable<RolesRow> {
  @override
  String get tableName => 'roles';

  @override
  RolesRow createRow(Map<String, dynamic> data) => RolesRow(data);
}

class RolesRow extends SupabaseDataRow {
  RolesRow(super.data);

  @override
  SupabaseTable get table => RolesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get fullAccess => getField<bool>('full_access');
  set fullAccess(bool? value) => setField<bool>('full_access', value);

  bool? get accountantAccess => getField<bool>('accountant_access');
  set accountantAccess(bool? value) =>
      setField<bool>('accountant_access', value);

  bool? get deliveryAccess => getField<bool>('delivery_access');
  set deliveryAccess(bool? value) => setField<bool>('delivery_access', value);

  bool? get readOnly => getField<bool>('read_only');
  set readOnly(bool? value) => setField<bool>('read_only', value);
}
