// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SampleProductOptionsStruct extends BaseStruct {
  SampleProductOptionsStruct({
    List<String>? sizes,
    List<String>? colors,
    List<String>? capacities,
  })  : _sizes = sizes,
        _colors = colors,
        _capacities = capacities;

  // "sizes" field.
  List<String>? _sizes;
  List<String> get sizes => _sizes ?? const [];
  set sizes(List<String>? val) => _sizes = val;

  void updateSizes(Function(List<String>) updateFn) {
    updateFn(_sizes ??= []);
  }

  bool hasSizes() => _sizes != null;

  // "colors" field.
  List<String>? _colors;
  List<String> get colors => _colors ?? const [];
  set colors(List<String>? val) => _colors = val;

  void updateColors(Function(List<String>) updateFn) {
    updateFn(_colors ??= []);
  }

  bool hasColors() => _colors != null;

  // "capacities" field.
  List<String>? _capacities;
  List<String> get capacities => _capacities ?? const [];
  set capacities(List<String>? val) => _capacities = val;

  void updateCapacities(Function(List<String>) updateFn) {
    updateFn(_capacities ??= []);
  }

  bool hasCapacities() => _capacities != null;

  static SampleProductOptionsStruct fromMap(Map<String, dynamic> data) =>
      SampleProductOptionsStruct(
        sizes: getDataList(data['sizes']),
        colors: getDataList(data['colors']),
        capacities: getDataList(data['capacities']),
      );

  static SampleProductOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? SampleProductOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sizes': _sizes,
        'colors': _colors,
        'capacities': _capacities,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sizes': serializeParam(
          _sizes,
          ParamType.String,
          isList: true,
        ),
        'colors': serializeParam(
          _colors,
          ParamType.String,
          isList: true,
        ),
        'capacities': serializeParam(
          _capacities,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SampleProductOptionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SampleProductOptionsStruct(
        sizes: deserializeParam<String>(
          data['sizes'],
          ParamType.String,
          true,
        ),
        colors: deserializeParam<String>(
          data['colors'],
          ParamType.String,
          true,
        ),
        capacities: deserializeParam<String>(
          data['capacities'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SampleProductOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SampleProductOptionsStruct &&
        listEquality.equals(sizes, other.sizes) &&
        listEquality.equals(colors, other.colors) &&
        listEquality.equals(capacities, other.capacities);
  }

  @override
  int get hashCode => const ListEquality().hash([sizes, colors, capacities]);
}

SampleProductOptionsStruct createSampleProductOptionsStruct() =>
    SampleProductOptionsStruct();
