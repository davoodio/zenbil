import '../database.dart';

class DeliveryMethodsTable extends SupabaseTable<DeliveryMethodsRow> {
  @override
  String get tableName => 'delivery_methods';

  @override
  DeliveryMethodsRow createRow(Map<String, dynamic> data) =>
      DeliveryMethodsRow(data);
}

class DeliveryMethodsRow extends SupabaseDataRow {
  DeliveryMethodsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeliveryMethodsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get published => getField<bool>('published');
  set published(bool? value) => setField<bool>('published', value);

  String? get nameCode => getField<String>('name_code');
  set nameCode(String? value) => setField<String>('name_code', value);

  String? get onroServiceId => getField<String>('onro_service_id');
  set onroServiceId(String? value) =>
      setField<String>('onro_service_id', value);

  String? get onroVehicleTypeId => getField<String>('onro_vehicle_type_id');
  set onroVehicleTypeId(String? value) =>
      setField<String>('onro_vehicle_type_id', value);

  String? get arabicName => getField<String>('arabic_name');
  set arabicName(String? value) => setField<String>('arabic_name', value);

  String? get kurdishName => getField<String>('kurdish_name');
  set kurdishName(String? value) => setField<String>('kurdish_name', value);
}
