import '/components/header/header_widget.dart';
import '/components/order_time_line/order_time_line_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'track_order_on_map_model.dart';
export 'track_order_on_map_model.dart';

class TrackOrderOnMapWidget extends StatefulWidget {
  const TrackOrderOnMapWidget({super.key});

  @override
  State<TrackOrderOnMapWidget> createState() => _TrackOrderOnMapWidgetState();
}

class _TrackOrderOnMapWidgetState extends State<TrackOrderOnMapWidget> {
  late TrackOrderOnMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackOrderOnMapModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrackOrderOnMap'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            'g03v8in6' /* Track Order On Map */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: false,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Group_74.png',
                                  width: double.infinity,
                                  height: 450.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 400.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 25.0,
                                        color: Color(0x0D000000),
                                        offset: Offset(
                                          0.0,
                                          -8.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(32.0),
                                      topRight: Radius.circular(32.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 30.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.orderTimeLineModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: OrderTimeLineWidget(
                                            status: 'Oreder Placed',
                                            description:
                                                'We have received your order',
                                            position: true,
                                            endOfIndex: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.orderTimeLineModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: OrderTimeLineWidget(
                                            status: 'Confirmed',
                                            description:
                                                'Your order has been confirmed',
                                            position: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.orderTimeLineModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: OrderTimeLineWidget(
                                            status: 'Order Shipped',
                                            description:
                                                'Your Package off for delivery ',
                                            position: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.orderTimeLineModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: OrderTimeLineWidget(
                                            status: 'Out for Delivery',
                                            description:
                                                'Estimated for 13 Feb, 2024',
                                            position: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.orderTimeLineModel5,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: OrderTimeLineWidget(
                                            status: 'Delivered',
                                            description:
                                                'Estimated for 13 Feb, 2024',
                                            position: false,
                                            endOfIndex: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
