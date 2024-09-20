import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/info_modal_widget.dart';
import '/components/payment_method_select_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'topup_modal_widget.dart' show TopupModalWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopupModalModel extends FlutterFlowModel<TopupModalWidget> {
  ///  Local state fields for this component.

  SearchSortStruct? selected;
  void updateSelectedStruct(Function(SearchSortStruct) updateFn) {
    updateFn(selected ??= SearchSortStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vgkrbpsq' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
  }

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
