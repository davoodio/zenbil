import '../database.dart';

class ViewProductInventoryTable extends SupabaseTable<ViewProductInventoryRow> {
  @override
  String get tableName => 'view_product_inventory';

  @override
  ViewProductInventoryRow createRow(Map<String, dynamic> data) =>
      ViewProductInventoryRow(data);
}

class ViewProductInventoryRow extends SupabaseDataRow {
  ViewProductInventoryRow(super.data);

  @override
  SupabaseTable get table => ViewProductInventoryTable();

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  double? get calculatedInventory => getField<double>('calculated_inventory');
  set calculatedInventory(double? value) =>
      setField<double>('calculated_inventory', value);
}
