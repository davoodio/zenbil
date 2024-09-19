import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'search_sort_popup_widget.dart' show SearchSortPopupWidget;
import 'package:flutter/material.dart';

class SearchSortPopupModel extends FlutterFlowModel<SearchSortPopupWidget> {
  ///  Local state fields for this component.

  SearchSortStruct? selected;
  void updateSelectedStruct(Function(SearchSortStruct) updateFn) {
    updateFn(selected ??= SearchSortStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchSortRadioButton widget.
  FormFieldController<String>? searchSortRadioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get searchSortRadioButtonValue =>
      searchSortRadioButtonValueController?.value;
}
