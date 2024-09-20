import '/components/header/header_widget.dart';
import '/components/wallet_front_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_history_widget.dart' show WalletHistoryWidget;
import 'package:flutter/material.dart';

class WalletHistoryModel extends FlutterFlowModel<WalletHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for WalletFrontCard component.
  late WalletFrontCardModel walletFrontCardModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    walletFrontCardModel = createModel(context, () => WalletFrontCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    walletFrontCardModel.dispose();
  }
}
