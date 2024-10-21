import '/components/counter_product_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item_widget.dart' show CartItemWidget;
import 'package:flutter/material.dart';

class CartItemModel extends FlutterFlowModel<CartItemWidget> {
  ///  Local state fields for this component.

  bool showNote = false;

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
