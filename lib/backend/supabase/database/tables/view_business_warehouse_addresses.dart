import '../database.dart';

class ViewBusinessWarehouseAddressesTable
    extends SupabaseTable<ViewBusinessWarehouseAddressesRow> {
  @override
  String get tableName => 'view_business_warehouse_addresses';

  @override
  ViewBusinessWarehouseAddressesRow createRow(Map<String, dynamic> data) =>
      ViewBusinessWarehouseAddressesRow(data);
}

class ViewBusinessWarehouseAddressesRow extends SupabaseDataRow {
  ViewBusinessWarehouseAddressesRow(super.data);

  @override
  SupabaseTable get table => ViewBusinessWarehouseAddressesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get addressId => getField<int>('address_id');
  set addressId(int? value) => setField<int>('address_id', value);

  PostgresTime? get openingHr => getField<PostgresTime>('opening_hr');
  set openingHr(PostgresTime? value) =>
      setField<PostgresTime>('opening_hr', value);

  PostgresTime? get closingHr => getField<PostgresTime>('closing_hr');
  set closingHr(PostgresTime? value) =>
      setField<PostgresTime>('closing_hr', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  bool? get isAvailable => getField<bool>('is_available');
  set isAvailable(bool? value) => setField<bool>('is_available', value);

  bool? get isDefaultWarehouse => getField<bool>('is_default_warehouse');
  set isDefaultWarehouse(bool? value) =>
      setField<bool>('is_default_warehouse', value);

  String? get fullAddress => getField<String>('full_address');
  set fullAddress(String? value) => setField<String>('full_address', value);
}