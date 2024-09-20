import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/order_history_item/order_history_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'successful_payment_widget.dart' show SuccessfulPaymentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SuccessfulPaymentModel extends FlutterFlowModel<SuccessfulPaymentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for OrderHistoryItem component.
  late OrderHistoryItemModel orderHistoryItemModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    orderHistoryItemModel = createModel(context, () => OrderHistoryItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    orderHistoryItemModel.dispose();
  }
}
