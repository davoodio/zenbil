import '/components/header/header_widget.dart';
import '/components/order_time_line/order_time_line_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'track_order_on_map_widget.dart' show TrackOrderOnMapWidget;
import 'package:flutter/material.dart';

class TrackOrderOnMapModel extends FlutterFlowModel<TrackOrderOnMapWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel1;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel2;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel3;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel4;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel5;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    orderTimeLineModel1 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel2 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel3 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel4 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel5 = createModel(context, () => OrderTimeLineModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    orderTimeLineModel1.dispose();
    orderTimeLineModel2.dispose();
    orderTimeLineModel3.dispose();
    orderTimeLineModel4.dispose();
    orderTimeLineModel5.dispose();
  }
}
