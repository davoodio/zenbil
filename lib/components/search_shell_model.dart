import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_shell_widget.dart' show SearchShellWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  dynamic? searchResult;
  // Stores action output result for [Custom Action - supabaseSearch] action in SearchField widget.
  dynamic? searchResultFocusChange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
  }
}
