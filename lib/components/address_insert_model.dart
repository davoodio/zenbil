import '/backend/schema/structs/index.dart';
import '/components/address_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'address_insert_widget.dart' show AddressInsertWidget;
import 'package:flutter/material.dart';

class AddressInsertModel extends FlutterFlowModel<AddressInsertWidget> {
  ///  Local state fields for this component.

  SearchSortStruct? selected;
  void updateSelectedStruct(Function(SearchSortStruct) updateFn) {
    updateFn(selected ??= SearchSortStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Models for AddressCard dynamic component.
  late FlutterFlowDynamicModels<AddressCardModel> addressCardModels;

  @override
  void initState(BuildContext context) {
    addressCardModels = FlutterFlowDynamicModels(() => AddressCardModel());
  }

  @override
  void dispose() {
    addressCardModels.dispose();
  }
}
