import '/components/line_colors_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_front_card_widget.dart' show WalletFrontCardWidget;
import 'package:flutter/material.dart';

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
