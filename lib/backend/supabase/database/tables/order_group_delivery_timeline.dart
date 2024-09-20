import '../database.dart';

class OrderGroupDeliveryTimelineTable
    extends SupabaseTable<OrderGroupDeliveryTimelineRow> {
  @override
  String get tableName => 'order_group_delivery_timeline';

  @override
  OrderGroupDeliveryTimelineRow createRow(Map<String, dynamic> data) =>
      OrderGroupDeliveryTimelineRow(data);
}

class OrderGroupDeliveryTimelineRow extends SupabaseDataRow {
  OrderGroupDeliveryTimelineRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderGroupDeliveryTimelineTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get orderGroupId => getField<int>('order_group_id');
  set orderGroupId(int? value) => setField<int>('order_group_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
