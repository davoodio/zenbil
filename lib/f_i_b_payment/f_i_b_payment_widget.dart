import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/divider_text/divider_text_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_i_b_payment_model.dart';
export 'f_i_b_payment_model.dart';

class FIBPaymentWidget extends StatefulWidget {
  const FIBPaymentWidget({
    super.key,
    required this.transactionType,
    this.order,
    required this.paymentAmount,
    this.transaction,
    this.walletId,
  });

  final TransactionType? transactionType;
  final OrdersRow? order;
  final double? paymentAmount;
  final TransactionsRow? transaction;
  final int? walletId;

  @override
  State<FIBPaymentWidget> createState() => _FIBPaymentWidgetState();
}

class _FIBPaymentWidgetState extends State<FIBPaymentWidget> {
  late FIBPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FIBPaymentModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'FIBPayment'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('F_I_B_PAYMENT_FIBPayment_ON_INIT_STATE');
      if ((_model.fIBPaymentStarted?.succeeded ?? true)) {
        logFirebaseEvent('FIBPayment_custom_action');
        await actions.printAction(
          'Payment created!',
        );
        logFirebaseEvent('FIBPayment_custom_action');
        await actions.printAction(
          'payment id: ${FIBSupabaseGroup.paymentStartCall.paymentID(
            (_model.fIBPaymentStarted?.jsonBody ?? ''),
          )}',
        );
        if (widget!.transactionType == TransactionType.Order) {
          logFirebaseEvent('FIBPayment_start_periodic_action');
          _model.instantTimerOrder = InstantTimer.periodic(
            duration: Duration(milliseconds: 1000),
            callback: (timer) async {
              logFirebaseEvent('FIBPayment_backend_call');
              _model.orderQuery = await OrdersTable().queryRows(
                queryFn: (q) => q.eq(
                  'id',
                  widget!.order?.id,
                ),
              );
              if (_model.orderQuery?.first?.paymentStatus ==
                  OrderPaymentStatus.Paid.name) {
                logFirebaseEvent('FIBPayment_stop_periodic_action');
                _model.instantTimerOrder?.cancel();
                logFirebaseEvent('FIBPayment_backend_call');
                await OrdersTable().update(
                  data: {
                    'order_status': OrderStatuses.OrderReceived.name,
                  },
                  matchingRows: (rows) => rows.eq(
                    'id',
                    widget!.order?.id,
                  ),
                );
                logFirebaseEvent('FIBPayment_navigate_to');

                context.goNamed(
                  'OrderConfirmation',
                  pathParameters: {
                    'order': serializeParam(
                      widget!.order,
                      ParamType.SupabaseRow,
                    ),
                  }.withoutNulls,
                );
              }
            },
            startImmediately: true,
          );
        } else if (widget!.transactionType == TransactionType.Topup) {
          logFirebaseEvent('FIBPayment_start_periodic_action');
          _model.instantTimerTopup = InstantTimer.periodic(
            duration: Duration(milliseconds: 1000),
            callback: (timer) async {
              logFirebaseEvent('FIBPayment_backend_call');
              _model.transactionQuery = await TransactionsTable().queryRows(
                queryFn: (q) => q.eq(
                  'payment_transaction_id',
                  FIBSupabaseGroup.paymentStartCall.paymentID(
                    (_model.fIBPaymentStarted?.jsonBody ?? ''),
                  ),
                ),
              );
              if (_model.transactionQuery?.first?.paymentStatus ==
                  OrderPaymentStatus.Paid.name) {
                logFirebaseEvent('FIBPayment_stop_periodic_action');
                _model.instantTimerTopup?.cancel();
                logFirebaseEvent('FIBPayment_backend_call');
                _model.walletQuery = await WalletsTable().queryRows(
                  queryFn: (q) => q.eq(
                    'id',
                    widget!.walletId,
                  ),
                );
                logFirebaseEvent('FIBPayment_update_app_state');
                FFAppState().updateWalletStruct(
                  (e) => e..balance = _model.walletQuery?.first?.balance,
                );
                logFirebaseEvent('FIBPayment_navigate_to');

                context.goNamed('PaymentConfirmation');
              }
            },
            startImmediately: true,
          );
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              alignment: AlignmentDirectional(1.0, -1.0),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: HeaderWidget(
                          title: 'Payment',
                          showBackButton: true,
                          showCart: false,
                          goToCartOnClick: false,
                          showSearch: false,
                          searchTableName: 'markets',
                        ),
                      ),
                      Expanded(
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i9e05gg4' /* Please select the payment meth... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ai8yzttf' /* Payment */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      functions
                                                          .applyCorrectNumberFormatting(
                                                              widget!
                                                                  .paymentAmount!,
                                                              FFAppState()
                                                                  .country
                                                                  .currencyCode,
                                                              false,
                                                              true),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.paymentCreated)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 14.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/ehg5opy37g1h/loading-circle.gif',
                                                    width: 100.0,
                                                    height: 34.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.dividerTextModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: DividerTextWidget(
                                                    title:
                                                        'Pay With QR Code In Your FIB App',
                                                    titleInLeftSide: false,
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
                                                  height: 200.0,
                                                  child: custom_widgets
                                                      .Base64ImageViewer(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    base64String:
                                                        FIBSupabaseGroup
                                                            .paymentStartCall
                                                            .qRCode(
                                                      (_model.fIBPaymentStarted
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                wrapWithModel(
                                                  model:
                                                      _model.dividerTextModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: DividerTextWidget(
                                                    title:
                                                        'Or Select Your FIB Account Type',
                                                    titleInLeftSide: false,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Semantics(
                                                          label:
                                                              'FIB Personal Account',
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'F_I_B_PAYMENT_PAGE_PersonalButton_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'PersonalButton_launch_u_r_l');
                                                              await launchURL(
                                                                  FIBSupabaseGroup
                                                                      .paymentStartCall
                                                                      .personalAppLink(
                                                                (_model.fIBPaymentStarted
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!);
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'iyiilib6' /* Personal */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 48.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Semantics(
                                                          label:
                                                              'FIB Business Account',
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'F_I_B_PAYMENT_PAGE_BusinessButton_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'BusinessButton_launch_u_r_l');
                                                              await launchURL(
                                                                  FIBSupabaseGroup
                                                                      .paymentStartCall
                                                                      .businessAppLink(
                                                                (_model.fIBPaymentStarted
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!);
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'rrbk5tma' /* Business */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 48.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Semantics(
                                                          label:
                                                              'FIB Corporate Account',
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'F_I_B_PAYMENT_CorporateButton_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'CorporateButton_launch_u_r_l');
                                                              await launchURL(
                                                                  FIBSupabaseGroup
                                                                      .paymentStartCall
                                                                      .corporateAppLink(
                                                                (_model.fIBPaymentStarted
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!);
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'qs9s634f' /* Corporate */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 48.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 24.0)),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    if (!_model.paymentCreated)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'F_I_B_PAYMENT_PayWithFibButton_ON_TAP');
                                            logFirebaseEvent(
                                                'PayWithFibButton_backend_call');
                                            _model.fIBPaymentStarted =
                                                await FIBSupabaseGroup
                                                    .paymentStartCall
                                                    .call(
                                              paymentType:
                                                  widget!.transactionType?.name,
                                              recordId: () {
                                                if (widget!.transactionType ==
                                                    TransactionType.Order) {
                                                  return widget!.order?.id;
                                                } else if (widget!
                                                        .transactionType ==
                                                    TransactionType.Topup) {
                                                  return null;
                                                } else {
                                                  return null;
                                                }
                                              }(),
                                              amount: widget!.paymentAmount,
                                              currencyUnit: FFAppState()
                                                  .country
                                                  .currencyCode,
                                              jwt: currentJwtToken,
                                              walletId: () {
                                                if (widget!.transactionType ==
                                                    TransactionType.Order) {
                                                  return null;
                                                } else if (widget!
                                                        .transactionType ==
                                                    TransactionType.Topup) {
                                                  return widget!.walletId;
                                                } else {
                                                  return null;
                                                }
                                              }(),
                                            );

                                            logFirebaseEvent(
                                                'PayWithFibButton_custom_action');
                                            await actions.printAction(
                                              'Order Id: ${widget!.order?.id?.toString()}Amount: ${widget!.paymentAmount?.toString()}Type: ${widget!.transactionType?.name}',
                                            );
                                            if ((_model.fIBPaymentStarted
                                                    ?.succeeded ??
                                                true)) {
                                              logFirebaseEvent(
                                                  'PayWithFibButton_custom_action');
                                              await actions.printAction(
                                                (_model.fIBPaymentStarted
                                                            ?.jsonBody ??
                                                        '')
                                                    .toString(),
                                              );
                                              logFirebaseEvent(
                                                  'PayWithFibButton_update_page_state');
                                              _model.paymentCreated = true;
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'cf02xvsu' /* Pay With FIB */,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Semantics(
                                            label: 'Cancel Payment Process',
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'F_I_B_PAYMENT_PAGE_CancelButton_ON_TAP');
                                                logFirebaseEvent(
                                                    'CancelButton_navigate_to');

                                                context.goNamed('zenbil');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8ss28lvh' /* Cancel payment process */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Semantics(
                                          label: 'Pay Later',
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print(
                                                  'PayLaterButton pressed ...');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'wvjsui59' /* Pay Later */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToStart(SizedBox(height: 20.0))
                                  .addToEnd(SizedBox(height: 20.0)),
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
        ),
      ),
    );
  }
}
