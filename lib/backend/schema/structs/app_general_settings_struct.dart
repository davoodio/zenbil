// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppGeneralSettingsStruct extends BaseStruct {
  AppGeneralSettingsStruct({
    bool? enableWalletAsPaymentOption,
    bool? enableWalletTopup,
    bool? enableAdvertisement,
    bool? enableAdvertisementOnHome,
    bool? enableAdvertisementOnCategories,
    bool? enableAdvertisementOnSubCategories,
    bool? enableAdvertisementOnMarkets,
    double? minAmountWalletTopup,
    double? maxAmountWalletTopup,
    List<SocialStruct>? social,
    bool? enableAdvertisementOnProductDetail,
  })  : _enableWalletAsPaymentOption = enableWalletAsPaymentOption,
        _enableWalletTopup = enableWalletTopup,
        _enableAdvertisement = enableAdvertisement,
        _enableAdvertisementOnHome = enableAdvertisementOnHome,
        _enableAdvertisementOnCategories = enableAdvertisementOnCategories,
        _enableAdvertisementOnSubCategories =
            enableAdvertisementOnSubCategories,
        _enableAdvertisementOnMarkets = enableAdvertisementOnMarkets,
        _minAmountWalletTopup = minAmountWalletTopup,
        _maxAmountWalletTopup = maxAmountWalletTopup,
        _social = social,
        _enableAdvertisementOnProductDetail =
            enableAdvertisementOnProductDetail;

  // "enableWalletAsPaymentOption" field.
  bool? _enableWalletAsPaymentOption;
  bool get enableWalletAsPaymentOption => _enableWalletAsPaymentOption ?? true;
  set enableWalletAsPaymentOption(bool? val) =>
      _enableWalletAsPaymentOption = val;

  bool hasEnableWalletAsPaymentOption() => _enableWalletAsPaymentOption != null;

  // "enableWalletTopup" field.
  bool? _enableWalletTopup;
  bool get enableWalletTopup => _enableWalletTopup ?? true;
  set enableWalletTopup(bool? val) => _enableWalletTopup = val;

  bool hasEnableWalletTopup() => _enableWalletTopup != null;

  // "enableAdvertisement" field.
  bool? _enableAdvertisement;
  bool get enableAdvertisement => _enableAdvertisement ?? true;
  set enableAdvertisement(bool? val) => _enableAdvertisement = val;

  bool hasEnableAdvertisement() => _enableAdvertisement != null;

  // "enableAdvertisementOnHome" field.
  bool? _enableAdvertisementOnHome;
  bool get enableAdvertisementOnHome => _enableAdvertisementOnHome ?? true;
  set enableAdvertisementOnHome(bool? val) => _enableAdvertisementOnHome = val;

  bool hasEnableAdvertisementOnHome() => _enableAdvertisementOnHome != null;

  // "enableAdvertisementOnCategories" field.
  bool? _enableAdvertisementOnCategories;
  bool get enableAdvertisementOnCategories =>
      _enableAdvertisementOnCategories ?? true;
  set enableAdvertisementOnCategories(bool? val) =>
      _enableAdvertisementOnCategories = val;

  bool hasEnableAdvertisementOnCategories() =>
      _enableAdvertisementOnCategories != null;

  // "enableAdvertisementOnSubCategories" field.
  bool? _enableAdvertisementOnSubCategories;
  bool get enableAdvertisementOnSubCategories =>
      _enableAdvertisementOnSubCategories ?? true;
  set enableAdvertisementOnSubCategories(bool? val) =>
      _enableAdvertisementOnSubCategories = val;

  bool hasEnableAdvertisementOnSubCategories() =>
      _enableAdvertisementOnSubCategories != null;

  // "enableAdvertisementOnMarkets" field.
  bool? _enableAdvertisementOnMarkets;
  bool get enableAdvertisementOnMarkets =>
      _enableAdvertisementOnMarkets ?? true;
  set enableAdvertisementOnMarkets(bool? val) =>
      _enableAdvertisementOnMarkets = val;

  bool hasEnableAdvertisementOnMarkets() =>
      _enableAdvertisementOnMarkets != null;

  // "minAmountWalletTopup" field.
  double? _minAmountWalletTopup;
  double get minAmountWalletTopup => _minAmountWalletTopup ?? 1.0;
  set minAmountWalletTopup(double? val) => _minAmountWalletTopup = val;

  void incrementMinAmountWalletTopup(double amount) =>
      minAmountWalletTopup = minAmountWalletTopup + amount;

  bool hasMinAmountWalletTopup() => _minAmountWalletTopup != null;

  // "maxAmountWalletTopup" field.
  double? _maxAmountWalletTopup;
  double get maxAmountWalletTopup => _maxAmountWalletTopup ?? 1000.0;
  set maxAmountWalletTopup(double? val) => _maxAmountWalletTopup = val;

  void incrementMaxAmountWalletTopup(double amount) =>
      maxAmountWalletTopup = maxAmountWalletTopup + amount;

  bool hasMaxAmountWalletTopup() => _maxAmountWalletTopup != null;

  // "social" field.
  List<SocialStruct>? _social;
  List<SocialStruct> get social => _social ?? const [];
  set social(List<SocialStruct>? val) => _social = val;

  void updateSocial(Function(List<SocialStruct>) updateFn) {
    updateFn(_social ??= []);
  }

  bool hasSocial() => _social != null;

  // "enableAdvertisementOnProductDetail" field.
  bool? _enableAdvertisementOnProductDetail;
  bool get enableAdvertisementOnProductDetail =>
      _enableAdvertisementOnProductDetail ?? true;
  set enableAdvertisementOnProductDetail(bool? val) =>
      _enableAdvertisementOnProductDetail = val;

  bool hasEnableAdvertisementOnProductDetail() =>
      _enableAdvertisementOnProductDetail != null;

  static AppGeneralSettingsStruct fromMap(Map<String, dynamic> data) =>
      AppGeneralSettingsStruct(
        enableWalletAsPaymentOption:
            data['enableWalletAsPaymentOption'] as bool?,
        enableWalletTopup: data['enableWalletTopup'] as bool?,
        enableAdvertisement: data['enableAdvertisement'] as bool?,
        enableAdvertisementOnHome: data['enableAdvertisementOnHome'] as bool?,
        enableAdvertisementOnCategories:
            data['enableAdvertisementOnCategories'] as bool?,
        enableAdvertisementOnSubCategories:
            data['enableAdvertisementOnSubCategories'] as bool?,
        enableAdvertisementOnMarkets:
            data['enableAdvertisementOnMarkets'] as bool?,
        minAmountWalletTopup: castToType<double>(data['minAmountWalletTopup']),
        maxAmountWalletTopup: castToType<double>(data['maxAmountWalletTopup']),
        social: getStructList(
          data['social'],
          SocialStruct.fromMap,
        ),
        enableAdvertisementOnProductDetail:
            data['enableAdvertisementOnProductDetail'] as bool?,
      );

  static AppGeneralSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? AppGeneralSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'enableWalletAsPaymentOption': _enableWalletAsPaymentOption,
        'enableWalletTopup': _enableWalletTopup,
        'enableAdvertisement': _enableAdvertisement,
        'enableAdvertisementOnHome': _enableAdvertisementOnHome,
        'enableAdvertisementOnCategories': _enableAdvertisementOnCategories,
        'enableAdvertisementOnSubCategories':
            _enableAdvertisementOnSubCategories,
        'enableAdvertisementOnMarkets': _enableAdvertisementOnMarkets,
        'minAmountWalletTopup': _minAmountWalletTopup,
        'maxAmountWalletTopup': _maxAmountWalletTopup,
        'social': _social?.map((e) => e.toMap()).toList(),
        'enableAdvertisementOnProductDetail':
            _enableAdvertisementOnProductDetail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'enableWalletAsPaymentOption': serializeParam(
          _enableWalletAsPaymentOption,
          ParamType.bool,
        ),
        'enableWalletTopup': serializeParam(
          _enableWalletTopup,
          ParamType.bool,
        ),
        'enableAdvertisement': serializeParam(
          _enableAdvertisement,
          ParamType.bool,
        ),
        'enableAdvertisementOnHome': serializeParam(
          _enableAdvertisementOnHome,
          ParamType.bool,
        ),
        'enableAdvertisementOnCategories': serializeParam(
          _enableAdvertisementOnCategories,
          ParamType.bool,
        ),
        'enableAdvertisementOnSubCategories': serializeParam(
          _enableAdvertisementOnSubCategories,
          ParamType.bool,
        ),
        'enableAdvertisementOnMarkets': serializeParam(
          _enableAdvertisementOnMarkets,
          ParamType.bool,
        ),
        'minAmountWalletTopup': serializeParam(
          _minAmountWalletTopup,
          ParamType.double,
        ),
        'maxAmountWalletTopup': serializeParam(
          _maxAmountWalletTopup,
          ParamType.double,
        ),
        'social': serializeParam(
          _social,
          ParamType.DataStruct,
          isList: true,
        ),
        'enableAdvertisementOnProductDetail': serializeParam(
          _enableAdvertisementOnProductDetail,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AppGeneralSettingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AppGeneralSettingsStruct(
        enableWalletAsPaymentOption: deserializeParam(
          data['enableWalletAsPaymentOption'],
          ParamType.bool,
          false,
        ),
        enableWalletTopup: deserializeParam(
          data['enableWalletTopup'],
          ParamType.bool,
          false,
        ),
        enableAdvertisement: deserializeParam(
          data['enableAdvertisement'],
          ParamType.bool,
          false,
        ),
        enableAdvertisementOnHome: deserializeParam(
          data['enableAdvertisementOnHome'],
          ParamType.bool,
          false,
        ),
        enableAdvertisementOnCategories: deserializeParam(
          data['enableAdvertisementOnCategories'],
          ParamType.bool,
          false,
        ),
        enableAdvertisementOnSubCategories: deserializeParam(
          data['enableAdvertisementOnSubCategories'],
          ParamType.bool,
          false,
        ),
        enableAdvertisementOnMarkets: deserializeParam(
          data['enableAdvertisementOnMarkets'],
          ParamType.bool,
          false,
        ),
        minAmountWalletTopup: deserializeParam(
          data['minAmountWalletTopup'],
          ParamType.double,
          false,
        ),
        maxAmountWalletTopup: deserializeParam(
          data['maxAmountWalletTopup'],
          ParamType.double,
          false,
        ),
        social: deserializeStructParam<SocialStruct>(
          data['social'],
          ParamType.DataStruct,
          true,
          structBuilder: SocialStruct.fromSerializableMap,
        ),
        enableAdvertisementOnProductDetail: deserializeParam(
          data['enableAdvertisementOnProductDetail'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AppGeneralSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AppGeneralSettingsStruct &&
        enableWalletAsPaymentOption == other.enableWalletAsPaymentOption &&
        enableWalletTopup == other.enableWalletTopup &&
        enableAdvertisement == other.enableAdvertisement &&
        enableAdvertisementOnHome == other.enableAdvertisementOnHome &&
        enableAdvertisementOnCategories ==
            other.enableAdvertisementOnCategories &&
        enableAdvertisementOnSubCategories ==
            other.enableAdvertisementOnSubCategories &&
        enableAdvertisementOnMarkets == other.enableAdvertisementOnMarkets &&
        minAmountWalletTopup == other.minAmountWalletTopup &&
        maxAmountWalletTopup == other.maxAmountWalletTopup &&
        listEquality.equals(social, other.social) &&
        enableAdvertisementOnProductDetail ==
            other.enableAdvertisementOnProductDetail;
  }

  @override
  int get hashCode => const ListEquality().hash([
        enableWalletAsPaymentOption,
        enableWalletTopup,
        enableAdvertisement,
        enableAdvertisementOnHome,
        enableAdvertisementOnCategories,
        enableAdvertisementOnSubCategories,
        enableAdvertisementOnMarkets,
        minAmountWalletTopup,
        maxAmountWalletTopup,
        social,
        enableAdvertisementOnProductDetail
      ]);
}

AppGeneralSettingsStruct createAppGeneralSettingsStruct({
  bool? enableWalletAsPaymentOption,
  bool? enableWalletTopup,
  bool? enableAdvertisement,
  bool? enableAdvertisementOnHome,
  bool? enableAdvertisementOnCategories,
  bool? enableAdvertisementOnSubCategories,
  bool? enableAdvertisementOnMarkets,
  double? minAmountWalletTopup,
  double? maxAmountWalletTopup,
  bool? enableAdvertisementOnProductDetail,
}) =>
    AppGeneralSettingsStruct(
      enableWalletAsPaymentOption: enableWalletAsPaymentOption,
      enableWalletTopup: enableWalletTopup,
      enableAdvertisement: enableAdvertisement,
      enableAdvertisementOnHome: enableAdvertisementOnHome,
      enableAdvertisementOnCategories: enableAdvertisementOnCategories,
      enableAdvertisementOnSubCategories: enableAdvertisementOnSubCategories,
      enableAdvertisementOnMarkets: enableAdvertisementOnMarkets,
      minAmountWalletTopup: minAmountWalletTopup,
      maxAmountWalletTopup: maxAmountWalletTopup,
      enableAdvertisementOnProductDetail: enableAdvertisementOnProductDetail,
    );
