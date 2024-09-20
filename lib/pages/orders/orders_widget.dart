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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_model.dart';
export 'orders_model.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  late OrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Orders'});
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            'oohpqxee' /* My Orders */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: false,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowChoiceChips(
                                      options: ((List<String> orderStatuses) {
                                        return ['All'] + orderStatuses;
                                      }(OrderStatuses.values
                                              .map((e) => e.name)
                                              .toList()))
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull);
                                        logFirebaseEvent(
                                            'ORDERS_ChoiceChips_48yymfp8_ON_FORM_WIDG');
                                        logFirebaseEvent(
                                            'ChoiceChips_update_page_state');
                                        _model.orderStatusActive =
                                            _model.choiceChipsValue!;
                                        safeSetState(() {});
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        iconColor:
                                            FlutterFlowTheme.of(context).white,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        [
                                          FFLocalizations.of(context).getText(
                                            '5hqcid9i' /* All */,
                                          )
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ]
                                      .addToStart(SizedBox(width: 20.0))
                                      .addToEnd(SizedBox(width: 20.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<OrdersRow>>(
                                future: OrdersTable().queryRows(
                                  queryFn: (q) => q.eq(
                                    'user_id',
                                    currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return ShimmerOrdersWidget(
                                      amountListItems: 4,
                                    );
                                  }
                                  List<OrdersRow> ordersQueryOrdersRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final order = (_model
                                                        .orderStatusActive !=
                                                    'All'
                                                ? ordersQueryOrdersRowList
                                                    .where((e) =>
                                                        (e.userId ==
                                                            currentUserUid) &&
                                                        (e.orderStatus ==
                                                            _model
                                                                .orderStatusActive))
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) =>
                                                            e.createdAt,
                                                        desc: true)
                                                : ordersQueryOrdersRowList
                                                    .where((e) =>
                                                        e.userId ==
                                                        currentUserUid)
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) =>
                                                            e.createdAt,
                                                        desc: true))
                                            .toList();
                                        if (order.isEmpty) {
                                          return EmptyStateWidget(
                                            message: FFLocalizations.of(context)
                                                .getText(
                                              '91ghekgh' /* You don't have any order yet. */,
                                            ),
                                            actionButton: () async {},
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            24.0,
                                            0,
                                            24.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: order.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 36.0),
                                          itemBuilder: (context, orderIndex) {
                                            final orderItem = order[orderIndex];
                                            return FutureBuilder<
                                                List<OrderProductsRow>>(
                                              future: OrderProductsTable()
                                                  .queryRows(
                                                queryFn: (q) => q.eq(
                                                  'order_id',
                                                  orderItem.id,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return EmptyComponentWidget();
                                                }
                                                List<OrderProductsRow>
                                                    orderProductsOrderProductsRowList =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .orderCardOrderHistoryModels
                                                          .getModel(
                                                        orderItem.id.toString(),
                                                        orderIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          OrderCardOrderHistoryWidget(
                                                        key: Key(
                                                          'Keylpj_${orderItem.id.toString()}',
                                                        ),
                                                        order: orderItem,
                                                        orderProducts:
                                                            orderProductsOrderProductsRowList,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
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
