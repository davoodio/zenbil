import '../database.dart';

class DeliveryMethodMappingsTable
    extends SupabaseTable<DeliveryMethodMappingsRow> {
  @override
  String get tableName => 'delivery_method_mappings';

  @override
  DeliveryMethodMappingsRow createRow(Map<String, dynamic> data) =>
      DeliveryMethodMappingsRow(data);
}

class DeliveryMethodMappingsRow extends SupabaseDataRow {
  DeliveryMethodMappingsRow(super.data);

  @override
  SupabaseTable get table => DeliveryMethodMappingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get deliveryMethodId => getField<int>('delivery_method_id');
  set deliveryMethodId(int? value) =>
      setField<int>('delivery_method_id', value);

  double? get fromWeight => getField<double>('from_weight');
  set fromWeight(double? value) => setField<double>('from_weight', value);

  double? get toWeight => getField<double>('to_weight');
  set toWeight(double? value) => setField<double>('to_weight', value);

  double? get fromSize => getField<double>('from_size');
  set fromSize(double? value) => setField<double>('from_size', value);

  double? get toSize => getField<double>('to_size');
  set toSize(double? value) => setField<double>('to_size', value);

  int get deliveryMethodTypeId => getField<int>('delivery_method_type_id')!;
  set deliveryMethodTypeId(int value) =>
      setField<int>('delivery_method_type_id', value);

  String? get onroServiceId => getField<String>('onro_service_id');
  set onroServiceId(String? value) =>
      setField<String>('onro_service_id', value);

  String? get onroVehicleTypeId => getField<String>('onro_vehicle_type_id');
  set onroVehicleTypeId(String? value) =>
      setField<String>('onro_vehicle_type_id', value);
}
