import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_focus_widget.dart' show SearchFocusWidget;
import 'package:flutter/material.dart';

class SearchFocusModel extends FlutterFlowModel<SearchFocusWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
