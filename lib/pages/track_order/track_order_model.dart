import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/info_modal_widget.dart';
import '/components/order_time_line/order_time_line_widget.dart';
import '/components/shimmer_orders_widget.dart';
import '/components/track_show_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:styled_divider/styled_divider.dart';
import 'track_order_widget.dart' show TrackOrderWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackOrderModel extends FlutterFlowModel<TrackOrderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel1;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel2;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel3;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel4;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel1;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel2;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel3;
  // Model for OrderTimeLine component.
  late OrderTimeLineModel orderTimeLineModel4;
  // Stores action output result for [Backend Call - API (getOrderDetails)] action in Button widget.
  ApiCallResponse? trackOrderResponse;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    trackShowModel1 = createModel(context, () => TrackShowModel());
    trackShowModel2 = createModel(context, () => TrackShowModel());
    trackShowModel3 = createModel(context, () => TrackShowModel());
    trackShowModel4 = createModel(context, () => TrackShowModel());
    orderTimeLineModel1 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel2 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel3 = createModel(context, () => OrderTimeLineModel());
    orderTimeLineModel4 = createModel(context, () => OrderTimeLineModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    trackShowModel1.dispose();
    trackShowModel2.dispose();
    trackShowModel3.dispose();
    trackShowModel4.dispose();
    orderTimeLineModel1.dispose();
    orderTimeLineModel2.dispose();
    orderTimeLineModel3.dispose();
    orderTimeLineModel4.dispose();
  }
}
