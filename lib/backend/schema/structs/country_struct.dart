// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryStruct extends BaseStruct {
  CountryStruct({
    String? name,
    String? code,
    String? currencyCode,
    String? currencySymbol,
    String? dialCode,
    double? currencyExchangeRate,
    int? id,
  })  : _name = name,
        _code = code,
        _currencyCode = currencyCode,
        _currencySymbol = currencySymbol,
        _dialCode = dialCode,
        _currencyExchangeRate = currencyExchangeRate,
        _id = id;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "currency_code" field.
  String? _currencyCode;
  String get currencyCode => _currencyCode ?? '';
  set currencyCode(String? val) => _currencyCode = val;

  bool hasCurrencyCode() => _currencyCode != null;

  // "currency_symbol" field.
  String? _currencySymbol;
  String get currencySymbol => _currencySymbol ?? '';
  set currencySymbol(String? val) => _currencySymbol = val;

  bool hasCurrencySymbol() => _currencySymbol != null;

  // "dial_code" field.
  String? _dialCode;
  String get dialCode => _dialCode ?? '';
  set dialCode(String? val) => _dialCode = val;

  bool hasDialCode() => _dialCode != null;

  // "currency_exchange_rate" field.
  double? _currencyExchangeRate;
  double get currencyExchangeRate => _currencyExchangeRate ?? 0.0;
  set currencyExchangeRate(double? val) => _currencyExchangeRate = val;

  void incrementCurrencyExchangeRate(double amount) =>
      currencyExchangeRate = currencyExchangeRate + amount;

  bool hasCurrencyExchangeRate() => _currencyExchangeRate != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static CountryStruct fromMap(Map<String, dynamic> data) => CountryStruct(
        name: data['name'] as String?,
        code: data['code'] as String?,
        currencyCode: data['currency_code'] as String?,
        currencySymbol: data['currency_symbol'] as String?,
        dialCode: data['dial_code'] as String?,
        currencyExchangeRate:
            castToType<double>(data['currency_exchange_rate']),
        id: castToType<int>(data['id']),
      );

  static CountryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CountryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'code': _code,
        'currency_code': _currencyCode,
        'currency_symbol': _currencySymbol,
        'dial_code': _dialCode,
        'currency_exchange_rate': _currencyExchangeRate,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'currency_code': serializeParam(
          _currencyCode,
          ParamType.String,
        ),
        'currency_symbol': serializeParam(
          _currencySymbol,
          ParamType.String,
        ),
        'dial_code': serializeParam(
          _dialCode,
          ParamType.String,
        ),
        'currency_exchange_rate': serializeParam(
          _currencyExchangeRate,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static CountryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        currencyCode: deserializeParam(
          data['currency_code'],
          ParamType.String,
          false,
        ),
        currencySymbol: deserializeParam(
          data['currency_symbol'],
          ParamType.String,
          false,
        ),
        dialCode: deserializeParam(
          data['dial_code'],
          ParamType.String,
          false,
        ),
        currencyExchangeRate: deserializeParam(
          data['currency_exchange_rate'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CountryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryStruct &&
        name == other.name &&
        code == other.code &&
        currencyCode == other.currencyCode &&
        currencySymbol == other.currencySymbol &&
        dialCode == other.dialCode &&
        currencyExchangeRate == other.currencyExchangeRate &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        code,
        currencyCode,
        currencySymbol,
        dialCode,
        currencyExchangeRate,
        id
      ]);
}

CountryStruct createCountryStruct({
  String? name,
  String? code,
  String? currencyCode,
  String? currencySymbol,
  String? dialCode,
  double? currencyExchangeRate,
  int? id,
}) =>
    CountryStruct(
      name: name,
      code: code,
      currencyCode: currencyCode,
      currencySymbol: currencySymbol,
      dialCode: dialCode,
      currencyExchangeRate: currencyExchangeRate,
      id: id,
    );
