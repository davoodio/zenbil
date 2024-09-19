import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delivery_history_widget.dart' show DeliveryHistoryWidget;
import 'package:flutter/material.dart';

class DeliveryHistoryModel extends FlutterFlowModel<DeliveryHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarDelivery component.
  late NavBarDeliveryModel navBarDeliveryModel;

  @override
  void initState(BuildContext context) {
    navBarDeliveryModel = createModel(context, () => NavBarDeliveryModel());
  }

  @override
  void dispose() {
    navBarDeliveryModel.dispose();
  }
}
