import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_component_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/order_card_order_history_widget.dart';
import '/components/shimmer_orders_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'orders_widget.dart' show OrdersWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersModel extends FlutterFlowModel<OrdersWidget> {
  ///  Local state fields for this page.

  String orderStatusActive = 'InProgress';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for OrderCardOrderHistory dynamic component.
  late FlutterFlowDynamicModels<OrderCardOrderHistoryModel>
      orderCardOrderHistoryModels;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    orderCardOrderHistoryModels =
        FlutterFlowDynamicModels(() => OrderCardOrderHistoryModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    orderCardOrderHistoryModels.dispose();
  }
}
