import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/divider_text/divider_text_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'f_i_b_payment_widget.dart' show FIBPaymentWidget;
import 'package:flutter/material.dart';

class FIBPaymentModel extends FlutterFlowModel<FIBPaymentWidget> {
  ///  Local state fields for this page.

  bool paymentCreated = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimerOrder;
  // Stores action output result for [Backend Call - Query Rows] action in FIBPayment widget.
  List<OrdersRow>? orderQuery;
  InstantTimer? instantTimerTopup;
  // Stores action output result for [Backend Call - Query Rows] action in FIBPayment widget.
  List<TransactionsRow>? transactionQuery;
  // Stores action output result for [Backend Call - Query Rows] action in FIBPayment widget.
  List<WalletsRow>? walletQuery;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for DividerText component.
  late DividerTextModel dividerTextModel1;
  // Model for DividerText component.
  late DividerTextModel dividerTextModel2;
  // Stores action output result for [Backend Call - API (PaymentStart)] action in PayWithFibButton widget.
  ApiCallResponse? fIBPaymentStarted;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    dividerTextModel1 = createModel(context, () => DividerTextModel());
    dividerTextModel2 = createModel(context, () => DividerTextModel());
  }

  @override
  void dispose() {
    instantTimerOrder?.cancel();
    instantTimerTopup?.cancel();
    headerModel.dispose();
    dividerTextModel1.dispose();
    dividerTextModel2.dispose();
  }
}
