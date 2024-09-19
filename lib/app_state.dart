import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _UserFavorites =
          prefs.getStringList('ff_UserFavorites')?.map(int.parse).toList() ??
              _UserFavorites;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Cart')) {
        try {
          final serializedData = prefs.getString('ff_Cart') ?? '{}';
          _Cart = CartStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_StorageBuckets')) {
        try {
          final serializedData = prefs.getString('ff_StorageBuckets') ?? '{}';
          _StorageBuckets = StorageBucketsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _OverwriteTheQueryCaches = prefs.getBool('ff_OverwriteTheQueryCaches') ??
          _OverwriteTheQueryCaches;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_country')) {
        try {
          final serializedData = prefs.getString('ff_country') ?? '{}';
          _country =
              CountryStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_LiveLocation')) {
        try {
          final serializedData = prefs.getString('ff_LiveLocation') ?? '{}';
          _LiveLocation = LiveLocationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  SampleProductOptionsStruct _sampleProductproperties =
      SampleProductOptionsStruct.fromSerializableMap(jsonDecode(
          '{\"sizes\":\"[\\\"S\\\",\\\"M\\\",\\\"L\\\",\\\"XL\\\"]\",\"colors\":\"[\\\"#FF7642\\\",\\\"#000000\\\",\\\"#2473F3\\\"]\",\"capacities\":\"[\\\"128 GB\\\",\\\"526 GB\\\"]\"}'));
  SampleProductOptionsStruct get sampleProductproperties =>
      _sampleProductproperties;
  set sampleProductproperties(SampleProductOptionsStruct value) {
    _sampleProductproperties = value;
  }

  void updateSampleProductpropertiesStruct(
      Function(SampleProductOptionsStruct) updateFn) {
    updateFn(_sampleProductproperties);
  }

  SearchSortStruct _searchSortItem = SearchSortStruct.fromSerializableMap(
      jsonDecode(
          '{\"searchSortItems\":\"[\\\"Best Match\\\",\\\"Popular Item\\\",\\\"Price Low To High\\\",\\\"Price High To Low\\\",\\\"Top Rated\\\",\\\"Newest Item\\\"]\"}'));
  SearchSortStruct get searchSortItem => _searchSortItem;
  set searchSortItem(SearchSortStruct value) {
    _searchSortItem = value;
  }

  void updateSearchSortItemStruct(Function(SearchSortStruct) updateFn) {
    updateFn(_searchSortItem);
  }

  String _PaymentMethod = 'CreaditCard';
  String get PaymentMethod => _PaymentMethod;
  set PaymentMethod(String value) {
    _PaymentMethod = value;
  }

  List<int> _UserFavorites = [];
  List<int> get UserFavorites => _UserFavorites;
  set UserFavorites(List<int> value) {
    _UserFavorites = value;
    prefs.setStringList(
        'ff_UserFavorites', value.map((x) => x.toString()).toList());
  }

  void addToUserFavorites(int value) {
    UserFavorites.add(value);
    prefs.setStringList(
        'ff_UserFavorites', _UserFavorites.map((x) => x.toString()).toList());
  }

  void removeFromUserFavorites(int value) {
    UserFavorites.remove(value);
    prefs.setStringList(
        'ff_UserFavorites', _UserFavorites.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromUserFavorites(int index) {
    UserFavorites.removeAt(index);
    prefs.setStringList(
        'ff_UserFavorites', _UserFavorites.map((x) => x.toString()).toList());
  }

  void updateUserFavoritesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    UserFavorites[index] = updateFn(_UserFavorites[index]);
    prefs.setStringList(
        'ff_UserFavorites', _UserFavorites.map((x) => x.toString()).toList());
  }

  void insertAtIndexInUserFavorites(int index, int value) {
    UserFavorites.insert(index, value);
    prefs.setStringList(
        'ff_UserFavorites', _UserFavorites.map((x) => x.toString()).toList());
  }

  CartStruct _Cart = CartStruct();
  CartStruct get Cart => _Cart;
  set Cart(CartStruct value) {
    _Cart = value;
    prefs.setString('ff_Cart', value.serialize());
  }

  void updateCartStruct(Function(CartStruct) updateFn) {
    updateFn(_Cart);
    prefs.setString('ff_Cart', _Cart.serialize());
  }

  StorageBucketsStruct _StorageBuckets =
      StorageBucketsStruct.fromSerializableMap(jsonDecode(
          '{\"publics\":\"publics\",\"privates\":\"privates\",\"shared\":\"shared\"}'));
  StorageBucketsStruct get StorageBuckets => _StorageBuckets;
  set StorageBuckets(StorageBucketsStruct value) {
    _StorageBuckets = value;
    prefs.setString('ff_StorageBuckets', value.serialize());
  }

  void updateStorageBucketsStruct(Function(StorageBucketsStruct) updateFn) {
    updateFn(_StorageBuckets);
    prefs.setString('ff_StorageBuckets', _StorageBuckets.serialize());
  }

  bool _OverwriteTheQueryCaches = false;
  bool get OverwriteTheQueryCaches => _OverwriteTheQueryCaches;
  set OverwriteTheQueryCaches(bool value) {
    _OverwriteTheQueryCaches = value;
    prefs.setBool('ff_OverwriteTheQueryCaches', value);
  }

  DataTypeEnumsStruct _DataTypeEnums = DataTypeEnumsStruct();
  DataTypeEnumsStruct get DataTypeEnums => _DataTypeEnums;
  set DataTypeEnums(DataTypeEnumsStruct value) {
    _DataTypeEnums = value;
  }

  void updateDataTypeEnumsStruct(Function(DataTypeEnumsStruct) updateFn) {
    updateFn(_DataTypeEnums);
  }

  int _loopCounter = 0;
  int get loopCounter => _loopCounter;
  set loopCounter(int value) {
    _loopCounter = value;
  }

  CountryStruct _country = CountryStruct();
  CountryStruct get country => _country;
  set country(CountryStruct value) {
    _country = value;
    prefs.setString('ff_country', value.serialize());
  }

  void updateCountryStruct(Function(CountryStruct) updateFn) {
    updateFn(_country);
    prefs.setString('ff_country', _country.serialize());
  }

  RoleStruct _Role = RoleStruct();
  RoleStruct get Role => _Role;
  set Role(RoleStruct value) {
    _Role = value;
  }

  void updateRoleStruct(Function(RoleStruct) updateFn) {
    updateFn(_Role);
  }

  LiveLocationStruct _LiveLocation = LiveLocationStruct();
  LiveLocationStruct get LiveLocation => _LiveLocation;
  set LiveLocation(LiveLocationStruct value) {
    _LiveLocation = value;
    prefs.setString('ff_LiveLocation', value.serialize());
  }

  void updateLiveLocationStruct(Function(LiveLocationStruct) updateFn) {
    updateFn(_LiveLocation);
    prefs.setString('ff_LiveLocation', _LiveLocation.serialize());
  }

  CurrentUserStruct _CurrentUser = CurrentUserStruct();
  CurrentUserStruct get CurrentUser => _CurrentUser;
  set CurrentUser(CurrentUserStruct value) {
    _CurrentUser = value;
  }

  void updateCurrentUserStruct(Function(CurrentUserStruct) updateFn) {
    updateFn(_CurrentUser);
  }

  WalletStruct _Wallet = WalletStruct();
  WalletStruct get Wallet => _Wallet;
  set Wallet(WalletStruct value) {
    _Wallet = value;
  }

  void updateWalletStruct(Function(WalletStruct) updateFn) {
    updateFn(_Wallet);
  }

  AppGeneralSettingsStruct _AppSettings = AppGeneralSettingsStruct();
  AppGeneralSettingsStruct get AppSettings => _AppSettings;
  set AppSettings(AppGeneralSettingsStruct value) {
    _AppSettings = value;
  }

  void updateAppSettingsStruct(Function(AppGeneralSettingsStruct) updateFn) {
    updateFn(_AppSettings);
  }

  List<SocialStruct> _Social = [
    SocialStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://instagram.com\",\"type\":\"Instagram\"}'))
  ];
  List<SocialStruct> get Social => _Social;
  set Social(List<SocialStruct> value) {
    _Social = value;
  }

  void addToSocial(SocialStruct value) {
    Social.add(value);
  }

  void removeFromSocial(SocialStruct value) {
    Social.remove(value);
  }

  void removeAtIndexFromSocial(int index) {
    Social.removeAt(index);
  }

  void updateSocialAtIndex(
    int index,
    SocialStruct Function(SocialStruct) updateFn,
  ) {
    Social[index] = updateFn(_Social[index]);
  }

  void insertAtIndexInSocial(int index, SocialStruct value) {
    Social.insert(index, value);
  }

  String _dummyVariable = '';
  String get dummyVariable => _dummyVariable;
  set dummyVariable(String value) {
    _dummyVariable = value;
  }

  LatLng? _MapCenterDefault = const LatLng(36.1877383, 44.0106983);
  LatLng? get MapCenterDefault => _MapCenterDefault;
  set MapCenterDefault(LatLng? value) {
    _MapCenterDefault = value;
  }

  final _countriesAllManager = FutureRequestManager<List<CountriesRow>>();
  Future<List<CountriesRow>> countriesAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CountriesRow>> Function() requestFn,
  }) =>
      _countriesAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCountriesAllCache() => _countriesAllManager.clear();
  void clearCountriesAllCacheKey(String? uniqueKey) =>
      _countriesAllManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
