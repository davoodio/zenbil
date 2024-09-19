import '../database.dart';

class UserAddressesTable extends SupabaseTable<UserAddressesRow> {
  @override
  String get tableName => 'user_addresses';

  @override
  UserAddressesRow createRow(Map<String, dynamic> data) =>
      UserAddressesRow(data);
}

class UserAddressesRow extends SupabaseDataRow {
  UserAddressesRow(super.data);

  @override
  SupabaseTable get table => UserAddressesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get addressNote => getField<String>('address_note');
  set addressNote(String? value) => setField<String>('address_note', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get isDefualt => getField<bool>('is_defualt');
  set isDefualt(bool? value) => setField<bool>('is_defualt', value);

  bool get isShipping => getField<bool>('is_shipping')!;
  set isShipping(bool value) => setField<bool>('is_shipping', value);

  bool? get isDeleted => getField<bool>('is_deleted');
  set isDeleted(bool? value) => setField<bool>('is_deleted', value);

  int? get zipcodeId => getField<int>('zipcode_id');
  set zipcodeId(int? value) => setField<int>('zipcode_id', value);

  String? get addressName => getField<String>('address_name');
  set addressName(String? value) => setField<String>('address_name', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  double? get long => getField<double>('long');
  set long(double? value) => setField<double>('long', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  String? get placeId => getField<String>('place_id');
  set placeId(String? value) => setField<String>('place_id', value);

  String? get fullAddress => getField<String>('full_address');
  set fullAddress(String? value) => setField<String>('full_address', value);

  String? get fullName => getField<String>('fullName');
  set fullName(String? value) => setField<String>('fullName', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get floor => getField<String>('floor');
  set floor(String? value) => setField<String>('floor', value);

  String? get building => getField<String>('building');
  set building(String? value) => setField<String>('building', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);
}
