import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/address_insert_widget.dart';
import '/components/delivery_method_item_widget.dart';
import '/components/info_modal_widget.dart';
import '/components/order_history_item/order_history_item_widget.dart';
import '/components/pick_how_to_pay_widget.dart';
import '/components/shimmer_container_widget.dart';
import '/components/shimmer_orders_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({
    super.key,
    required this.order,
    required this.orderGroups,
    required this.orderproducts,
  });

  final OrdersRow? order;
  final List<OrderGroupsRow>? orderGroups;
  final List<OrderProductsRow>? orderproducts;

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Checkout'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECKOUT_PAGE_Checkout_ON_INIT_STATE');
      if ((widget.order != null) &&
          (widget.order?.userShippingAddressId != null)) {
        await Future.wait([
          Future(() async {
            logFirebaseEvent('Checkout_backend_call');
            _model.userAddressOnOrder = await UserAddressesTable().queryRows(
              queryFn: (q) => q.eq(
                'id',
                widget.order?.userShippingAddressId,
              ),
            );
            logFirebaseEvent('Checkout_update_page_state');
            _model.userAddress = _model.userAddressOnOrder?.first;
            safeSetState(() {});
          }),
          Future(() async {
            logFirebaseEvent('Checkout_update_app_state');
            FFAppState().dummyVariable = '';
            safeSetState(() {});
            logFirebaseEvent('Checkout_action_block');
            _model.groupedDeliveryMethodsForOrder =
                await _model.fetchDeliveryMethodsAvailableForOrderGroups(
              context,
              order: widget.order,
            );
            logFirebaseEvent('Checkout_update_app_state');
            FFAppState().dummyVariable = '';
            safeSetState(() {});
          }),
        ]);
      } else {
        logFirebaseEvent('Checkout_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: InfoModalWidget(
                  title: FFLocalizations.of(context).getText(
                    'vx5r4aub' /* No address! */,
                  ),
                  body: FFLocalizations.of(context).getText(
                    'vebm2tsp' /* You should select a shipping a... */,
                  ),
                  isConfirm: false,
                  autoDismiss: true,
                ),
              ),
            );
          },
        );
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

    return Builder(
      builder: (context) => GestureDetector(
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
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: 48.0,
                                  child: Stack(
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        borderWidth: 0.0,
                                        buttonSize: 48.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          FFIcons.kdismissDefault,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CHECKOUT_PAGE_dismissDefault_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: double.infinity,
                                                    child: InfoModalWidget(
                                                      title: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2lsmrcs6' /* Warning! */,
                                                      ),
                                                      body: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'l4rooo56' /* You want to cancel this order?... */,
                                                      ),
                                                      isConfirm: true,
                                                      actionButtonText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'mse50phj' /* Yes, Cancel */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .warning_amber_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 34.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.cancelConfirm = value));

                                          if (_model.cancelConfirm!) {
                                            logFirebaseEvent(
                                                'IconButton_backend_call');
                                            await OrdersTable().delete(
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.order?.id,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'IconButton_navigate_to');

                                            context.goNamed('zenbil');
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '3pd5h8pm' /* CHECKOUT */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: SizedBox(
                                      width: 48.0,
                                      child: Stack(
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    'You’re buying ${widget.orderproducts?.length.toString()} products',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final orderGroupItem = widget
                                                  .orderGroups!
                                                  .sortedList(
                                                      keyOf: (e) => e.id,
                                                      desc: false)
                                                  .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    orderGroupItem.length,
                                                    (orderGroupItemIndex) {
                                                  final orderGroupItemItem =
                                                      orderGroupItem[
                                                          orderGroupItemIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final orderproductItem = widget
                                                                .orderproducts!
                                                                .where((e) =>
                                                                    e.orderGroupId ==
                                                                    orderGroupItemItem
                                                                        .id)
                                                                .toList();

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                20.0,
                                                                0,
                                                                20.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  orderproductItem
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  const SizedBox(
                                                                      height:
                                                                          10.0),
                                                              itemBuilder: (context,
                                                                  orderproductItemIndex) {
                                                                final orderproductItemItem =
                                                                    orderproductItem[
                                                                        orderproductItemIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          OrderHistoryItemWidget(
                                                                        key: Key(
                                                                            'Keyvm0_${orderproductItemIndex}_of_${orderproductItem.length}'),
                                                                        photo: orderproductItemItem
                                                                            .productImage,
                                                                        productName:
                                                                            orderproductItemItem.name,
                                                                        price: (orderproductItemItem.priceTotal!) *
                                                                            FFAppState().country.currencyExchangeRate,
                                                                        showReview:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          if (!_model
                                                                  .isLoading &&
                                                              (_model.userAddress !=
                                                                  null) &&
                                                              (_model.deliveryOptions
                                                                      .where((e) =>
                                                                          e.orderGroupId ==
                                                                          orderGroupItemItem
                                                                              .id)
                                                                      .toList().isNotEmpty))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .deliveryMethodItemModels
                                                                    .getModel(
                                                                  orderGroupItemItem
                                                                      .id
                                                                      .toString(),
                                                                  orderGroupItemIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    DeliveryMethodItemWidget(
                                                                  key: Key(
                                                                    'Keynvr_${orderGroupItemItem.id.toString()}',
                                                                  ),
                                                                  orderGroupId:
                                                                      orderGroupItemItem
                                                                          .id,
                                                                  letChangeTheMethod:
                                                                      true,
                                                                  deliveryOrder: _model.deliveryOptions.where((e) => e.orderGroupId == orderGroupItemItem.id).toList().isNotEmpty
                                                                      ? _model
                                                                          .deliveryOptions
                                                                          .where((e) =>
                                                                              e.orderGroupId ==
                                                                              orderGroupItemItem.id)
                                                                          .toList()
                                                                          .first
                                                                      : null,
                                                                  indexInList:
                                                                      orderGroupItemIndex,
                                                                  onMethodChanged:
                                                                      (selectedMethod) async {
                                                                    logFirebaseEvent(
                                                                        'CHECKOUT_Container_nvr9jkeu_CALLBACK');
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_update_page_state');
                                                                    _model.isLoading =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_backend_call');
                                                                    await OrderGroupsTable()
                                                                        .update(
                                                                      data: {
                                                                        'onro_delivery_method_id':
                                                                            getJsonField(
                                                                          functions.returnJsonWithASpecificKeyValue(
                                                                              getJsonField(
                                                                                _model.groupedDeliveryMethodsForOrder!
                                                                                    .where((e) =>
                                                                                        orderGroupItemItem.id ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.id''',
                                                                                        ))
                                                                                    .toList()
                                                                                    .first,
                                                                                r'''$.grouped''',
                                                                                true,
                                                                              )!,
                                                                              selectedMethod,
                                                                              'method_type_name'),
                                                                          r'''$.method_type_id''',
                                                                        ),
                                                                        'delivery_method_id':
                                                                            getJsonField(
                                                                          functions.returnJsonWithASpecificKeyValue(
                                                                              getJsonField(
                                                                                _model.groupedDeliveryMethodsForOrder!
                                                                                    .where((e) =>
                                                                                        orderGroupItemItem.id ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.id''',
                                                                                        ))
                                                                                    .toList()
                                                                                    .first,
                                                                                r'''$.grouped''',
                                                                                true,
                                                                              )!,
                                                                              selectedMethod,
                                                                              'method_type_name'),
                                                                          r'''$.method_id''',
                                                                        ),
                                                                        'delivery_method_mapping_id':
                                                                            getJsonField(
                                                                          functions.returnJsonWithASpecificKeyValue(
                                                                              getJsonField(
                                                                                _model.groupedDeliveryMethodsForOrder!
                                                                                    .where((e) =>
                                                                                        orderGroupItemItem.id ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.id''',
                                                                                        ))
                                                                                    .toList()
                                                                                    .first,
                                                                                r'''$.grouped''',
                                                                                true,
                                                                              )!,
                                                                              selectedMethod,
                                                                              'method_type_name'),
                                                                          r'''$.method_mapping_id''',
                                                                        ),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id',
                                                                        orderGroupItemItem
                                                                            .id,
                                                                      ),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_action_block');
                                                                    _model.updatedCalculation =
                                                                        await _model
                                                                            .calculateDeliveryPricesForOrder(
                                                                      context,
                                                                      orderGroupId:
                                                                          orderGroupItemItem
                                                                              .id,
                                                                      deliveryAddressId: _model
                                                                          .userAddress
                                                                          ?.id,
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_custom_action');
                                                                    await actions
                                                                        .printAction(
                                                                      _model
                                                                          .updatedCalculation!
                                                                          .toString(),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_update_page_state');
                                                                    _model
                                                                        .updateDeliveryOptionsAtIndex(
                                                                      functions.findIndexOfDeliveryOrderForAnOrderGroupId(
                                                                          _model
                                                                              .deliveryOptions
                                                                              .toList(),
                                                                          orderGroupItemItem
                                                                              .id),
                                                                      (e) => e
                                                                        ..updateSelectedDeliveryMethodForOrderGroup(
                                                                          (e) => e
                                                                            ..methodId =
                                                                                getJsonField(
                                                                              functions.returnJsonWithASpecificKeyValue(
                                                                                  getJsonField(
                                                                                    _model.groupedDeliveryMethodsForOrder!
                                                                                        .where((e) =>
                                                                                            orderGroupItemItem.id ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
                                                                                    r'''$.grouped''',
                                                                                    true,
                                                                                  )!,
                                                                                  selectedMethod,
                                                                                  'method_type_name'),
                                                                              r'''$.method_id''',
                                                                            )
                                                                            ..methodTypeId =
                                                                                getJsonField(
                                                                              functions.returnJsonWithASpecificKeyValue(
                                                                                  getJsonField(
                                                                                    _model.groupedDeliveryMethodsForOrder!
                                                                                        .where((e) =>
                                                                                            orderGroupItemItem.id ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
                                                                                    r'''$.grouped''',
                                                                                    true,
                                                                                  )!,
                                                                                  selectedMethod,
                                                                                  'method_type_name'),
                                                                              r'''$.method_type_id''',
                                                                            )
                                                                            ..methodTypeName =
                                                                                getJsonField(
                                                                              functions.returnJsonWithASpecificKeyValue(
                                                                                  getJsonField(
                                                                                    _model.groupedDeliveryMethodsForOrder!
                                                                                        .where((e) =>
                                                                                            orderGroupItemItem.id ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
                                                                                    r'''$.grouped''',
                                                                                    true,
                                                                                  )!,
                                                                                  selectedMethod,
                                                                                  'method_type_name'),
                                                                              r'''$.method_type_name''',
                                                                            ).toString()
                                                                            ..methodMappingId =
                                                                                getJsonField(
                                                                              functions.returnJsonWithASpecificKeyValue(
                                                                                  getJsonField(
                                                                                    _model.groupedDeliveryMethodsForOrder!
                                                                                        .where((e) =>
                                                                                            orderGroupItemItem.id ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
                                                                                    r'''$.grouped''',
                                                                                    true,
                                                                                  )!,
                                                                                  selectedMethod,
                                                                                  'method_type_name'),
                                                                              r'''$.method_mapping_id''',
                                                                            )
                                                                            ..methodTypeNameArabic =
                                                                                getJsonField(
                                                                              functions.returnJsonWithASpecificKeyValue(
                                                                                  getJsonField(
                                                                                    _model.groupedDeliveryMethodsForOrder!
                                                                                        .where((e) =>
                                                                                            orderGroupItemItem.id ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
                                                                                    r'''$.grouped''',
                                                                                    true,
                                                                                  )!,
                                                                                  selectedMethod,
                                                                                  'method_type_name'),
                                                                              r'''$.method_type_name_arabic''',
                                                                            ).toString()
                                                                            ..methodTypeNameKurdish = getJsonField(
                                                                              functions.returnJsonWithASpecificKeyValue(
                                                                                  getJsonField(
                                                                                    _model.groupedDeliveryMethodsForOrder!
                                                                                        .where((e) =>
                                                                                            orderGroupItemItem.id ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
                                                                                    r'''$.grouped''',
                                                                                    true,
                                                                                  )!,
                                                                                  selectedMethod,
                                                                                  'method_type_name'),
                                                                              r'''$.method_type_name_kurdish''',
                                                                            ).toString(),
                                                                        )
                                                                        ..selectedOptionPrice =
                                                                            functions.roundToNearestDouble(getJsonField(
                                                                          _model
                                                                              .updatedCalculation,
                                                                          r'''$.calculation.price''',
                                                                        ))
                                                                        ..selectedOptionCurrencyCode =
                                                                            getJsonField(
                                                                          _model
                                                                              .updatedCalculation,
                                                                          r'''$.calculation.currencyCode''',
                                                                        ).toString(),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_update_page_state');
                                                                    _model.deliveryTotalFee =
                                                                        functions.calculateDeliveryTotalOnCheckout(_model
                                                                            .deliveryOptions
                                                                            .toList());
                                                                    logFirebaseEvent(
                                                                        'DeliveryMethodItem_update_page_state');
                                                                    _model.isLoading =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          if (_model.isLoading)
                                                            ShimmerOrdersWidget(
                                                              key: Key(
                                                                  'Key5lh_${orderGroupItemIndex}_of_${orderGroupItem.length}'),
                                                              amountListItems:
                                                                  1,
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }).divide(
                                                    const SizedBox(height: 24.0)),
                                              );
                                            },
                                          ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'u375a2u4' /* Billing & Delivery Address */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      if (!_model.isLoading)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'CHECKOUT_PAGE_ChanageAddress_ON_TAP');
                                                            logFirebaseEvent(
                                                                'ChanageAddress_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () =>
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const SizedBox(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          AddressInsertWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(() =>
                                                                    _model.addressReturned =
                                                                        value));

                                                            if (_model
                                                                    .addressReturned !=
                                                                null) {
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_update_page_state');
                                                              _model.deliveryOptions =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_update_page_state');
                                                              _model.userAddress =
                                                                  _model
                                                                      .addressReturned;
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_backend_call');
                                                              _model.orderAddressUpdated =
                                                                  await OrdersTable()
                                                                      .update(
                                                                data: {
                                                                  'user_shipping_address_id':
                                                                      _model
                                                                          .addressReturned
                                                                          ?.id,
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  widget.order
                                                                      ?.id,
                                                                ),
                                                                returnRows:
                                                                    true,
                                                              );
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_backend_call');
                                                              _model.updatedOrder =
                                                                  await OrdersTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.eq(
                                                                  'id',
                                                                  _model
                                                                      .orderAddressUpdated
                                                                      ?.first
                                                                      .id,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_update_app_state');
                                                              FFAppState()
                                                                  .dummyVariable = '';
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_action_block');
                                                              await _model
                                                                  .fetchDeliveryMethodsAvailableForOrderGroups(
                                                                context,
                                                                order: _model
                                                                    .orderAddressUpdated
                                                                    ?.first,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'ChanageAddress_update_app_state');
                                                              FFAppState()
                                                                  .dummyVariable = '';
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child:
                                                                  AutoSizeText(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'e8ptayyf' /* Change / Add New */,
                                                                ),
                                                                minFontSize:
                                                                    8.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model.userAddress
                                                                ?.address,
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zk91df73' /* Payment Method */,
                                                        ),
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
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
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: FutureBuilder<
                                                    List<PaymentTypesRow>>(
                                                  future: PaymentTypesTable()
                                                      .queryRows(
                                                    queryFn: (q) => q.eq(
                                                      'published',
                                                      true,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 38.0,
                                                          height: 38.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<PaymentTypesRow>
                                                        listViewPaymentTypesRowList =
                                                        snapshot.data!;

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewPaymentTypesRowList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewPaymentTypesRow =
                                                            listViewPaymentTypesRowList[
                                                                listViewIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .pickHowToPayModels
                                                              .getModel(
                                                            listViewPaymentTypesRow
                                                                .id
                                                                .toString(),
                                                            listViewIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              PickHowToPayWidget(
                                                            key: Key(
                                                              'Keywsf_${listViewPaymentTypesRow.id.toString()}',
                                                            ),
                                                            activeItem: _model
                                                                .selectedPaymentType,
                                                            item:
                                                                listViewPaymentTypesRow,
                                                            onSelectedCallback:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CHECKOUT_Container_wsfab9m0_CALLBACK');
                                                              logFirebaseEvent(
                                                                  'PickHowToPay_update_page_state');
                                                              _model.selectedPaymentType =
                                                                  listViewPaymentTypesRow;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '4gplc6gd' /* Cost */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'i3dz3t4g' /* Products Price */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                StyledDivider(
                                                                  height: 1.0,
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightBlack,
                                                                  lineStyle:
                                                                      DividerLineStyle
                                                                          .dashed,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                functions.applyCorrectNumberFormatting(
                                                                    (widget.order!
                                                                            .priceSubTotal!) *
                                                                        FFAppState()
                                                                            .country
                                                                            .currencyExchangeRate,
                                                                    FFAppState()
                                                                        .country
                                                                        .currencyCode,
                                                                    FFAppConstants
                                                                        .useCurrencySymbol,
                                                                    true),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'qubhbma1' /* Shipping Fees */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                StyledDivider(
                                                                  height: 1.0,
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightBlack,
                                                                  lineStyle:
                                                                      DividerLineStyle
                                                                          .dashed,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                children: [
                                                                  if (!_model
                                                                      .isLoading)
                                                                    Text(
                                                                      functions.applyCorrectNumberFormatting(
                                                                          _model.deliveryTotalFee != null
                                                                              ? _model
                                                                                  .deliveryTotalFee!
                                                                              : 0.0,
                                                                          FFAppState()
                                                                              .country
                                                                              .currencyCode,
                                                                          FFAppConstants
                                                                              .useCurrencySymbol,
                                                                          true),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                          ),
                                                                    ),
                                                                  if (_model
                                                                      .isLoading)
                                                                    Container(
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .shimmerContainerModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            const ShimmerContainerWidget(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'xm9edubi' /* Total */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                StyledDivider(
                                                                  height: 1.0,
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightBlack,
                                                                  lineStyle:
                                                                      DividerLineStyle
                                                                          .dashed,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                children: [
                                                                  if (!_model
                                                                      .isLoading)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.09,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.applyCorrectNumberFormatting(
                                                                            (widget.order!.priceSubTotal!) * FFAppState().country.currencyExchangeRate +
                                                                                (_model.deliveryTotalFee != null ? _model.deliveryTotalFee! : 0.0),
                                                                            FFAppState().country.currencyCode,
                                                                            FFAppConstants.useCurrencySymbol,
                                                                            true),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  if (_model
                                                                      .isLoading)
                                                                    Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .shimmerContainerModel2,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            const ShimmerContainerWidget(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 12.0)),
                                                  ),
                                                  if (false)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'v0wvsjkk' /* Add Coupon Code */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                ].divide(
                                                    const SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 32.0)),
                                      ),
                                    ].divide(const SizedBox(height: 40.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: (_model.isLoading ||
                                            (_model.selectedPaymentType ==
                                                null) ||
                                            _model.isApiCallUnsuccessful ||
                                            (_model.userAddress == null))
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'CHECKOUT_PAGE_CONFIRM_ORDER_BTN_ON_TAP');
                                            if (_model.userAddress != null) {
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await OrdersTable().update(
                                                data: {
                                                  'user_shipping_address_id':
                                                      _model.userAddress?.id,
                                                  'price_delivery':
                                                      _model.deliveryTotalFee,
                                                  'price_total': (widget.order!
                                                          .priceSubTotal!) +
                                                      (_model
                                                          .deliveryTotalFee!),
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.order?.id,
                                                ),
                                              );
                                              while (_model
                                                      .orderGroupsLoopCounter <
                                                  _model
                                                      .deliveryOptions.length) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                await OrderGroupsTable().update(
                                                  data: {
                                                    'price_delivery': _model
                                                        .deliveryOptions[_model
                                                            .orderGroupsLoopCounter]
                                                        .selectedOptionPrice
                                                        .roundToDouble(),
                                                    'price_total': (widget
                                                            .orderGroups!
                                                            .where((e) =>
                                                                e.id ==
                                                                _model
                                                                    .deliveryOptions[
                                                                        _model
                                                                            .orderGroupsLoopCounter]
                                                                    .orderGroupId)
                                                            .toList()
                                                            .first
                                                            .priceSubTotal!) +
                                                        _model
                                                            .deliveryOptions[_model
                                                                .orderGroupsLoopCounter]
                                                            .selectedOptionPrice
                                                            .roundToDouble(),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    _model
                                                        .deliveryOptions[_model
                                                            .orderGroupsLoopCounter]
                                                        .orderGroupId,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.orderGroupsLoopCounter =
                                                    _model.orderGroupsLoopCounter +
                                                        1;
                                                safeSetState(() {});
                                              }
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.orderGroupsLoopCounter = 0;
                                              safeSetState(() {});
                                              if (_model.selectedPaymentType
                                                      ?.type ==
                                                  PaymentTypes.FIB.name) {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'FIBPayment',
                                                  queryParameters: {
                                                    'transactionType':
                                                        serializeParam(
                                                      TransactionType.Order,
                                                      ParamType.Enum,
                                                    ),
                                                    'order': serializeParam(
                                                      widget.order,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'paymentAmount':
                                                        serializeParam(
                                                      (widget.order!
                                                                  .priceSubTotal!) *
                                                              FFAppState()
                                                                  .country
                                                                  .currencyExchangeRate +
                                                          (_model
                                                              .deliveryTotalFee!),
                                                      ParamType.double,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else if (_model
                                                      .selectedPaymentType
                                                      ?.type ==
                                                  PaymentTypes.Wallet.name) {
                                                if (FFAppState()
                                                        .Wallet
                                                        .balance >=
                                                    widget
                                                        .order!.priceTotal!) {
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.payWalletResponse =
                                                      await UserWalletCallsGroup
                                                          .payWalletCall
                                                          .call(
                                                    paymentType: TransactionType
                                                        .Order.name,
                                                    recordId: widget.order?.id,
                                                    walletId: FFAppState()
                                                        .Wallet
                                                        .walletId,
                                                    amount: (widget.order!
                                                                .priceSubTotal!) *
                                                            FFAppState()
                                                                .country
                                                                .currencyExchangeRate +
                                                        (_model
                                                            .deliveryTotalFee!),
                                                    currencyUnit: FFAppState()
                                                        .country
                                                        .currencyCode,
                                                    jwt: currentJwtToken,
                                                  );

                                                  if ((_model.payWalletResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    _model.walletQuery =
                                                        await WalletsTable()
                                                            .queryRows(
                                                      queryFn: (q) => q.eq(
                                                        'id',
                                                        FFAppState()
                                                            .Wallet
                                                            .walletId,
                                                      ),
                                                    );
                                                    if ((_model.walletQuery !=
                                                                null &&
                                                            (_model.walletQuery)!
                                                                .isNotEmpty) &&
                                                        (_model.walletQuery!.isNotEmpty)) {
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');
                                                      FFAppState()
                                                          .updateWalletStruct(
                                                        (e) => e
                                                          ..balance = _model
                                                              .walletQuery
                                                              ?.first
                                                              .balance,
                                                      );
                                                    }
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    await OrdersTable().update(
                                                      data: {
                                                        'order_status':
                                                            OrderStatuses
                                                                .OrderReceived
                                                                .name,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.order?.id,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.goNamed(
                                                      'OrderConfirmation',
                                                      pathParameters: {
                                                        'order': serializeParam(
                                                          widget.order,
                                                          ParamType.SupabaseRow,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child:
                                                                InfoModalWidget(
                                                              title: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'riemyto1' /* Sorry! */,
                                                              ),
                                                              body:
                                                                  'Error: ${(_model.payWalletResponse?.jsonBody ?? '').toString()}',
                                                              isConfirm: false,
                                                              autoDismiss: true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus(),
                                                          child:
                                                              InfoModalWidget(
                                                            title: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'a5bo9q99' /* Sorry! */,
                                                            ),
                                                            body: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'zax5th2r' /* Wallet amount is less than the... */,
                                                            ),
                                                            isConfirm: false,
                                                            autoDismiss: true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              } else if (_model
                                                      .selectedPaymentType
                                                      ?.type ==
                                                  PaymentTypes.Amwal.name) {
                                                logFirebaseEvent(
                                                    'Button_action_block');
                                                await action_blocks
                                                    .paymentExecution(
                                                  context,
                                                  transactionType:
                                                      TransactionType.Order,
                                                  currencyCode: FFAppState()
                                                      .country
                                                      .currencyCode,
                                                  order: widget.order,
                                                  paymentAmount: (widget.order!
                                                              .priceSubTotal!) *
                                                          FFAppState()
                                                              .country
                                                              .currencyExchangeRate +
                                                      (_model
                                                          .deliveryTotalFee!),
                                                  paymentMethod:
                                                      PaymentTypes.Amwal,
                                                  walletId: 0,
                                                );
                                              } else if (_model
                                                      .selectedPaymentType
                                                      ?.type ==
                                                  PaymentTypes
                                                      .CashOnDelivery.name) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                _model.paymentTypeCOD =
                                                    await PaymentTypesTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eq(
                                                    'type',
                                                    PaymentTypes
                                                        .CashOnDelivery.name,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                await OrdersTable().update(
                                                  data: {
                                                    'order_status':
                                                        OrderStatuses
                                                            .OrderReceived.name,
                                                    'payment_type_id': _model
                                                        .paymentTypeCOD
                                                        ?.first
                                                        .id,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.order?.id,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.goNamed(
                                                  'OrderConfirmation',
                                                  pathParameters: {
                                                    'order': serializeParam(
                                                      widget.order,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child: InfoModalWidget(
                                                        title:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '5374bxgy' /* No address! */,
                                                        ),
                                                        body:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '5n660yy3' /* You should select a shipping a... */,
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
                                      '9cbl9cmi' /* Confirm Order */,
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
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .lightBlack,
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
      ),
    );
  }
}
