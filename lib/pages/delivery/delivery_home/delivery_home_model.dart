import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'delivery_home_widget.dart' show DeliveryHomeWidget;
import 'package:flutter/material.dart';

class DeliveryHomeModel extends FlutterFlowModel<DeliveryHomeWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? LocationUpdater;
  // Model for NavBarDelivery component.
  late NavBarDeliveryModel navBarDeliveryModel;

  @override
  void initState(BuildContext context) {
    navBarDeliveryModel = createModel(context, () => NavBarDeliveryModel());
  }

  @override
  void dispose() {
    LocationUpdater?.cancel();
    navBarDeliveryModel.dispose();
  }
}
