import '../database.dart';

class DeliveryMethodTypesTable extends SupabaseTable<DeliveryMethodTypesRow> {
  @override
  String get tableName => 'delivery_method_types';

  @override
  DeliveryMethodTypesRow createRow(Map<String, dynamic> data) =>
      DeliveryMethodTypesRow(data);
}

class DeliveryMethodTypesRow extends SupabaseDataRow {
  DeliveryMethodTypesRow(super.data);

  @override
  SupabaseTable get table => DeliveryMethodTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get onroDefaultServiceType =>
      getField<String>('onro_default_service_type');
  set onroDefaultServiceType(String? value) =>
      setField<String>('onro_default_service_type', value);

  String? get onroDefaultVehicleType =>
      getField<String>('onro_default_vehicle_type');
  set onroDefaultVehicleType(String? value) =>
      setField<String>('onro_default_vehicle_type', value);

  bool? get createOndemandOrder => getField<bool>('create_ondemand_order');
  set createOndemandOrder(bool? value) =>
      setField<bool>('create_ondemand_order', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  bool get isDefault => getField<bool>('is_default')!;
  set isDefault(bool value) => setField<bool>('is_default', value);

  String? get arabicName => getField<String>('arabic_name');
  set arabicName(String? value) => setField<String>('arabic_name', value);

  String? get kurdishName => getField<String>('kurdish_name');
  set kurdishName(String? value) => setField<String>('kurdish_name', value);
}
