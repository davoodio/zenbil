// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WalletStruct extends BaseStruct {
  WalletStruct({
    int? walletId,
    DateTime? createdAt,
    String? userId,
    String? currencyCode,
    String? transactionSymbol,
    double? balance,
  })  : _walletId = walletId,
        _createdAt = createdAt,
        _userId = userId,
        _currencyCode = currencyCode,
        _transactionSymbol = transactionSymbol,
        _balance = balance;

  // "wallet_id" field.
  int? _walletId;
  int get walletId => _walletId ?? 0;
  set walletId(int? val) => _walletId = val;

  void incrementWalletId(int amount) => walletId = walletId + amount;

  bool hasWalletId() => _walletId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "currency_code" field.
  String? _currencyCode;
  String get currencyCode => _currencyCode ?? '';
  set currencyCode(String? val) => _currencyCode = val;

  bool hasCurrencyCode() => _currencyCode != null;

  // "transaction_symbol" field.
  String? _transactionSymbol;
  String get transactionSymbol => _transactionSymbol ?? '';
  set transactionSymbol(String? val) => _transactionSymbol = val;

  bool hasTransactionSymbol() => _transactionSymbol != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  set balance(double? val) => _balance = val;

  void incrementBalance(double amount) => balance = balance + amount;

  bool hasBalance() => _balance != null;

  static WalletStruct fromMap(Map<String, dynamic> data) => WalletStruct(
        walletId: castToType<int>(data['wallet_id']),
        createdAt: data['created_at'] as DateTime?,
        userId: data['user_id'] as String?,
        currencyCode: data['currency_code'] as String?,
        transactionSymbol: data['transaction_symbol'] as String?,
        balance: castToType<double>(data['balance']),
      );

  static WalletStruct? maybeFromMap(dynamic data) =>
      data is Map ? WalletStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'wallet_id': _walletId,
        'created_at': _createdAt,
        'user_id': _userId,
        'currency_code': _currencyCode,
        'transaction_symbol': _transactionSymbol,
        'balance': _balance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wallet_id': serializeParam(
          _walletId,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'currency_code': serializeParam(
          _currencyCode,
          ParamType.String,
        ),
        'transaction_symbol': serializeParam(
          _transactionSymbol,
          ParamType.String,
        ),
        'balance': serializeParam(
          _balance,
          ParamType.double,
        ),
      }.withoutNulls;

  static WalletStruct fromSerializableMap(Map<String, dynamic> data) =>
      WalletStruct(
        walletId: deserializeParam(
          data['wallet_id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        currencyCode: deserializeParam(
          data['currency_code'],
          ParamType.String,
          false,
        ),
        transactionSymbol: deserializeParam(
          data['transaction_symbol'],
          ParamType.String,
          false,
        ),
        balance: deserializeParam(
          data['balance'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WalletStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WalletStruct &&
        walletId == other.walletId &&
        createdAt == other.createdAt &&
        userId == other.userId &&
        currencyCode == other.currencyCode &&
        transactionSymbol == other.transactionSymbol &&
        balance == other.balance;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [walletId, createdAt, userId, currencyCode, transactionSymbol, balance]);
}

WalletStruct createWalletStruct({
  int? walletId,
  DateTime? createdAt,
  String? userId,
  String? currencyCode,
  String? transactionSymbol,
  double? balance,
}) =>
    WalletStruct(
      walletId: walletId,
      createdAt: createdAt,
      userId: userId,
      currencyCode: currencyCode,
      transactionSymbol: transactionSymbol,
      balance: balance,
    );
