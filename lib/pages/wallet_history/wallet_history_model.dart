import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_query_inside/loader_query_inside_widget.dart';
import '/components/transaction_card_widget.dart';
import '/components/wallet_front_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'wallet_history_widget.dart' show WalletHistoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
