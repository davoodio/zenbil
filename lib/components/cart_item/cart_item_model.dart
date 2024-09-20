import '/backend/schema/structs/index.dart';
import '/components/counter_product_widget.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_item_widget.dart' show CartItemWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemModel extends FlutterFlowModel<CartItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CounterProduct component.
  late CounterProductModel counterProductModel;
  // Stores action output result for [Bottom Sheet - InfoModal] action in CounterProduct widget.
  bool? removeApproveCopy;
  // State field(s) for NoteSpecialRequestTextField widget.
  FocusNode? noteSpecialRequestTextFieldFocusNode;
  TextEditingController? noteSpecialRequestTextFieldTextController;
  String? Function(BuildContext, String?)?
      noteSpecialRequestTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    counterProductModel = createModel(context, () => CounterProductModel());
  }

  @override
  void dispose() {
    counterProductModel.dispose();
    noteSpecialRequestTextFieldFocusNode?.dispose();
    noteSpecialRequestTextFieldTextController?.dispose();
  }
}
