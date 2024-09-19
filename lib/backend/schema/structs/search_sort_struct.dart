// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchSortStruct extends BaseStruct {
  SearchSortStruct({
    List<String>? searchSortItems,
  }) : _searchSortItems = searchSortItems;

  // "searchSortItems" field.
  List<String>? _searchSortItems;
  List<String> get searchSortItems => _searchSortItems ?? const [];
  set searchSortItems(List<String>? val) => _searchSortItems = val;

  void updateSearchSortItems(Function(List<String>) updateFn) {
    updateFn(_searchSortItems ??= []);
  }

  bool hasSearchSortItems() => _searchSortItems != null;

  static SearchSortStruct fromMap(Map<String, dynamic> data) =>
      SearchSortStruct(
        searchSortItems: getDataList(data['searchSortItems']),
      );

  static SearchSortStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchSortStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'searchSortItems': _searchSortItems,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'searchSortItems': serializeParam(
          _searchSortItems,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SearchSortStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchSortStruct(
        searchSortItems: deserializeParam<String>(
          data['searchSortItems'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SearchSortStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SearchSortStruct &&
        listEquality.equals(searchSortItems, other.searchSortItems);
  }

  @override
  int get hashCode => const ListEquality().hash([searchSortItems]);
}

SearchSortStruct createSearchSortStruct() => SearchSortStruct();
