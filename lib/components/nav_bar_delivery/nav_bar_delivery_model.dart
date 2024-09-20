import '/components/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_delivery_widget.dart' show NavBarDeliveryWidget;
import 'package:flutter/material.dart';

class NavBarDeliveryModel extends FlutterFlowModel<NavBarDeliveryWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Market.
  late NavBarItemModel marketModel;
  // Model for Account.
  late NavBarItemModel accountModel1;
  // Model for Account.
  late NavBarItemModel accountModel2;

  @override
  void initState(BuildContext context) {
    marketModel = createModel(context, () => NavBarItemModel());
    accountModel1 = createModel(context, () => NavBarItemModel());
    accountModel2 = createModel(context, () => NavBarItemModel());
  }

  @override
  void dispose() {
    marketModel.dispose();
    accountModel1.dispose();
    accountModel2.dispose();
  }
}
