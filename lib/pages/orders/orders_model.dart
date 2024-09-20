import '/components/header/header_widget.dart';
import '/components/order_card_order_history_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'orders_widget.dart' show OrdersWidget;
import 'package:flutter/material.dart';

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
