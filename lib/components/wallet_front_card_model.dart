import '/backend/schema/structs/index.dart';
import '/components/line_colors_widget.dart';
import '/components/topup_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'wallet_front_card_widget.dart' show WalletFrontCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletFrontCardModel extends FlutterFlowModel<WalletFrontCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for LineColors component.
  late LineColorsModel lineColorsModel;

  @override
  void initState(BuildContext context) {
    lineColorsModel = createModel(context, () => LineColorsModel());
  }

  @override
  void dispose() {
    lineColorsModel.dispose();
  }
}
