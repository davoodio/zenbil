import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mobileNumber => getField<String>('mobile_number');
  set mobileNumber(String? value) => setField<String>('mobile_number', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  DateTime? get lastLoginDate => getField<DateTime>('last_login_date');
  set lastLoginDate(DateTime? value) =>
      setField<DateTime>('last_login_date', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  bool get isAnon => getField<bool>('is_anon')!;
  set isAnon(bool value) => setField<bool>('is_anon', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get defaultPaymentTypeId => getField<int>('default_payment_type_id');
  set defaultPaymentTypeId(int? value) =>
      setField<int>('default_payment_type_id', value);

  int? get defaultAddressId => getField<int>('default_address_id');
  set defaultAddressId(int? value) =>
      setField<int>('default_address_id', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  int? get role => getField<int>('role');
  set role(int? value) => setField<int>('role', value);

  String? get authProvider => getField<String>('auth_provider');
  set authProvider(String? value) => setField<String>('auth_provider', value);

  int? get defaultDeliveryMethod => getField<int>('default_delivery_method');
  set defaultDeliveryMethod(int? value) =>
      setField<int>('default_delivery_method', value);

  String? get userType => getField<String>('user_type');
  set userType(String? value) => setField<String>('user_type', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get madeBy => getField<String>('made_by');
  set madeBy(String? value) => setField<String>('made_by', value);

  String? get madeById => getField<String>('made_by_id');
  set madeById(String? value) => setField<String>('made_by_id', value);
}
