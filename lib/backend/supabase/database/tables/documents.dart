import '../database.dart';

class DocumentsTable extends SupabaseTable<DocumentsRow> {
  @override
  String get tableName => 'documents';

  @override
  DocumentsRow createRow(Map<String, dynamic> data) => DocumentsRow(data);
}

class DocumentsRow extends SupabaseDataRow {
  DocumentsRow(super.data);

  @override
  SupabaseTable get table => DocumentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get documentUrl => getField<String>('document_url');
  set documentUrl(String? value) => setField<String>('document_url', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get uploaderRoleId => getField<int>('uploader_role_id');
  set uploaderRoleId(int? value) => setField<int>('uploader_role_id', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get marketId => getField<int>('market_id');
  set marketId(int? value) => setField<int>('market_id', value);
}
