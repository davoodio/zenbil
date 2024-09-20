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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'track_order_model.dart';
export 'track_order_model.dart';

class TrackOrderWidget extends StatefulWidget {
  const TrackOrderWidget({
    super.key,
    required this.orderGroup,
  });

  final OrderGroupsRow? orderGroup;

  @override
  State<TrackOrderWidget> createState() => _TrackOrderWidgetState();
}

class _TrackOrderWidgetState extends State<TrackOrderWidget> {
  late TrackOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackOrderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TrackOrder'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            'ujpkfzxm' /* Track Order */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: false,
                        ),
                      ),
                      Expanded(
                        child:
                            FutureBuilder<List<OrderGroupDeliveryTimelineRow>>(
                          future: OrderGroupDeliveryTimelineTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'order_group_id',
                                  widget.orderGroup?.id,
                                )
                                .order('created_at'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const ShimmerOrdersWidget();
                            }
                            List<OrderGroupDeliveryTimelineRow>
                                deliveryTimelineRowsOrderGroupDeliveryTimelineRowList =
                                snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .OrderReceived.name))
                                                  wrapWithModel(
                                                    model:
                                                        _model.trackShowModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: TrackShowWidget(
                                                      titleIcon: Icon(
                                                        FFIcons.kboxCheck,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 32.0,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .OrderReceived.name))
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StyledDivider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          lineStyle:
                                                              DividerLineStyle
                                                                  .dotted,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .Preparing.name))
                                                  wrapWithModel(
                                                    model:
                                                        _model.trackShowModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: TrackShowWidget(
                                                      titleIcon: Icon(
                                                        FFIcons.kphotoSensor,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 32.0,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .Preparing.name))
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StyledDivider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          lineStyle:
                                                              DividerLineStyle
                                                                  .dotted,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .HasBeenShipped.name))
                                                  wrapWithModel(
                                                    model:
                                                        _model.trackShowModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: TrackShowWidget(
                                                      titleIcon: Icon(
                                                        FFIcons.ktruckDelivery,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 32.0,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .HasBeenShipped.name))
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StyledDivider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          lineStyle:
                                                              DividerLineStyle
                                                                  .dotted,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                    .map((e) => e.status)
                                                    .withoutNulls
                                                    .toList()
                                                    .contains(OrderStatuses
                                                        .Completed.name))
                                                  wrapWithModel(
                                                    model:
                                                        _model.trackShowModel4,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: TrackShowWidget(
                                                      titleIcon: Icon(
                                                        FFIcons.kchecks,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 32.0,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                              .map((e) => e.status)
                                              .withoutNulls
                                              .toList()
                                              .contains(OrderStatuses
                                                  .OrderReceived.name))
                                            wrapWithModel(
                                              model: _model.orderTimeLineModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: OrderTimeLineWidget(
                                                status: 'Order Placed',
                                                description:
                                                    'We have received your order.',
                                                position: true,
                                                endOfIndex: false,
                                                createdDate: dateTimeFormat(
                                                  "yMMMd",
                                                  widget.orderGroup?.createdAt,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                createdTime: dateTimeFormat(
                                                  "Hm",
                                                  widget.orderGroup?.createdAt,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                              ),
                                            ),
                                          if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                              .map((e) => e.status)
                                              .withoutNulls
                                              .toList()
                                              .contains(
                                                  OrderStatuses.Preparing.name))
                                            wrapWithModel(
                                              model: _model.orderTimeLineModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: OrderTimeLineWidget(
                                                status: 'Confirmed',
                                                description:
                                                    'Your order has been confirmed.',
                                                position: true,
                                                endOfIndex: false,
                                                createdDate:
                                                    deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    OrderStatuses
                                                                        .Preparing
                                                                        .name)
                                                                .toList().isNotEmpty
                                                        ? valueOrDefault<
                                                            String>(
                                                            dateTimeFormat(
                                                              "yMMMd",
                                                              deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      OrderStatuses
                                                                          .Preparing
                                                                          .name)
                                                                  .toList()
                                                                  .first
                                                                  .createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          )
                                                        : '-',
                                                createdTime:
                                                    deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    OrderStatuses
                                                                        .Preparing
                                                                        .name)
                                                                .toList().isNotEmpty
                                                        ? valueOrDefault<
                                                            String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      OrderStatuses
                                                                          .Preparing
                                                                          .name)
                                                                  .toList()
                                                                  .first
                                                                  .createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          )
                                                        : '-',
                                              ),
                                            ),
                                          if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                              .map((e) => e.status)
                                              .withoutNulls
                                              .toList()
                                              .contains(OrderStatuses
                                                  .HasBeenShipped.name))
                                            wrapWithModel(
                                              model: _model.orderTimeLineModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: OrderTimeLineWidget(
                                                status: 'Order Shipped',
                                                description:
                                                    'Your Package off for delivery.',
                                                position: true,
                                                endOfIndex: false,
                                                createdDate:
                                                    deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    OrderStatuses
                                                                        .HasBeenShipped
                                                                        .name)
                                                                .toList().isNotEmpty
                                                        ? valueOrDefault<
                                                            String>(
                                                            dateTimeFormat(
                                                              "yMMMd",
                                                              deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      OrderStatuses
                                                                          .HasBeenShipped
                                                                          .name)
                                                                  .toList()
                                                                  .first
                                                                  .createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          )
                                                        : '-',
                                                createdTime:
                                                    deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    OrderStatuses
                                                                        .HasBeenShipped
                                                                        .name)
                                                                .toList().isNotEmpty
                                                        ? valueOrDefault<
                                                            String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      OrderStatuses
                                                                          .HasBeenShipped
                                                                          .name)
                                                                  .toList()
                                                                  .first
                                                                  .createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          )
                                                        : '-',
                                              ),
                                            ),
                                          if (deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                              .map((e) => e.status)
                                              .withoutNulls
                                              .toList()
                                              .contains(
                                                  OrderStatuses.Completed.name))
                                            wrapWithModel(
                                              model: _model.orderTimeLineModel4,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: OrderTimeLineWidget(
                                                status: 'Delivered',
                                                description:
                                                    'This order is successfully delivered.',
                                                position: true,
                                                endOfIndex: true,
                                                createdDate:
                                                    deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    OrderStatuses
                                                                        .Completed
                                                                        .name)
                                                                .toList().isNotEmpty
                                                        ? valueOrDefault<
                                                            String>(
                                                            dateTimeFormat(
                                                              "yMMMd",
                                                              deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      OrderStatuses
                                                                          .Completed
                                                                          .name)
                                                                  .toList()
                                                                  .first
                                                                  .createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          )
                                                        : '-',
                                                createdTime:
                                                    deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    OrderStatuses
                                                                        .Completed
                                                                        .name)
                                                                .toList().isNotEmpty
                                                        ? valueOrDefault<
                                                            String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              deliveryTimelineRowsOrderGroupDeliveryTimelineRowList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      OrderStatuses
                                                                          .Completed
                                                                          .name)
                                                                  .toList()
                                                                  .first
                                                                  .createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          )
                                                        : '-',
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 36.0))
                                      .addToStart(const SizedBox(height: 24.0))
                                      .addToEnd(const SizedBox(height: 24.0)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((widget.orderGroup?.status ==
                                    OrderStatuses.HasBeenShipped.name) ||
                                (widget.orderGroup?.status ==
                                    OrderStatuses.Completed.name))
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'TRACK_ORDER_TRACK_SHIPMENT_DETAILS_BTN_O');
                                      logFirebaseEvent('Button_backend_call');
                                      _model.trackOrderResponse =
                                          await OnroSupabaseCallsGroup
                                              .getOrderDetailsCall
                                              .call(
                                        language: FFLocalizations.of(context)
                                            .languageCode,
                                        onroOrderId: widget.orderGroup?.onroId,
                                        jwt: currentJwtToken,
                                      );

                                      if (OnroSupabaseCallsGroup
                                          .getOrderDetailsCall
                                          .success(
                                        (_model.trackOrderResponse?.jsonBody ??
                                            ''),
                                      )!) {
                                        logFirebaseEvent('Button_launch_u_r_l');
                                        await launchURL(OnroSupabaseCallsGroup
                                            .getOrderDetailsCall
                                            .trackOrderLink(
                                          (_model.trackOrderResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!);
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(dialogContext)
                                                        .unfocus(),
                                                child: InfoModalWidget(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f97nesv4' /* Error! */,
                                                  ),
                                                  body: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'd3xw1g8y' /* Please try again. */,
                                                  ),
                                                  isConfirm: false,
                                                  autoDismiss: true,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'xx6ucazs' /* Track Shipment Details */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 48.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
