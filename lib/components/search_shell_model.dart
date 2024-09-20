import '/flutter_flow/flutter_flow_util.dart';
import 'search_shell_widget.dart' show SearchShellWidget;
import 'package:flutter/material.dart';

class SearchShellModel extends FlutterFlowModel<SearchShellWidget> {
  ///  Local state fields for this component.

  bool isTestMode = false;

  int? numberOfResults;

  bool hasResults = false;

  bool successButNoResult = false;

  dynamic searchResultBody;

  dynamic result;

  String? searchError;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchField widget.
  final searchFieldKey = GlobalKey();
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Custom Action - supabaseSearch] action in SearchField widget.
  dynamic searchResult;
  // Stores action output result for [Custom Action - supabaseSearch] action in SearchField widget.
  dynamic searchResultFocusChange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
  }
}
