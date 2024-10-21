import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/cart_item/cart_item_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
export 'cart_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late CartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cart'});
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
                            'mv0lc2hi' /* Shopping Bag */,
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
                            if (FFAppState().Cart.products.isNotEmpty)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            FFAppState()
                                                .Cart
                                                .products
                                                .length
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  const Shadow(
                                                    color: Color(0x2503080C),
                                                    offset: Offset(2.0, 2.0),
                                                    blurRadius: 6.0,
                                                  )
                                                ],
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            '${valueOrDefault<int>(
                                                  FFAppState()
                                                      .Cart
                                                      .products
                                                      .length,
                                                  0,
                                                ) == 1 ? 'Item ' : 'Items '}in your cart',
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  const Shadow(
                                                    color: Color(0x2503080C),
                                                    offset: Offset(2.0, 2.0),
                                                    blurRadius: 6.0,
                                                  )
                                                ],
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ],
                                ),
                              ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final productCart =
                                      FFAppState().Cart.products.toList();
                                  if (productCart.isEmpty) {
                                    return EmptyStateWidget(
                                      icon: Icon(
                                        FFIcons.kshoppingCartOff,
                                        color: FlutterFlowTheme.of(context)
                                            .lightBlack,
                                        size: 34.0,
                                      ),
                                      title:
                                          FFLocalizations.of(context).getText(
                                        'b8xjdsfc' /* Cart Is Empty! */,
                                      ),
                                      message:
                                          FFLocalizations.of(context).getText(
                                        'kd0mpdxu' /* Your cart is empty try to add ... */,
                                      ),
                                      actionButton: () async {},
                                    );
                                  }

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children:
                                          List.generate(productCart.length,
                                              (productCartIndex) {
                                        final productCartItem =
                                            productCart[productCartIndex];
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground40,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 16.0, 10.0, 16.0),
                                              child: Semantics(
                                                label:
                                                    'Product cart details item',
                                                child: CartItemWidget(
                                                  key: Key(
                                                      'Keyhv9_${productCartIndex}_of_${productCart.length}'),
                                                  productCart: productCartItem,
                                                  index: productCartIndex,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).addToEnd(const SizedBox(height: 24.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (FFAppState().Cart.products.isNotEmpty)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(6.0),
                                                topRight: Radius.circular(6.0),
                                              ),
                                            ),
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'vd9zn8fs' /* Total */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            shadows: [
                                                                              const Shadow(
                                                                                color: Color(0x2503080C),
                                                                                offset: Offset(2.0, 2.0),
                                                                                blurRadius: 6.0,
                                                                              )
                                                                            ],
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      functions.applyCorrectNumberFormatting(
                                                                          double.parse((functions.calculateCartTotalPrice(FFAppState().Cart.products.toList()) * FFAppState().country.currencyExchangeRate).toStringAsFixed(
                                                                              2)),
                                                                          FFAppState()
                                                                              .country
                                                                              .currencyCode,
                                                                          FFAppConstants
                                                                              .useCurrencySymbol,
                                                                          true),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            shadows: [
                                                                              const Shadow(
                                                                                color: Color(0x2503080C),
                                                                                offset: Offset(2.0, 2.0),
                                                                                blurRadius: 6.0,
                                                                              )
                                                                            ],
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      '(${FFLocalizations.of(context).getVariableText(
                                                                        enText:
                                                                            'Min. Amount:',
                                                                        arText:
                                                                            'الحد الأدنى للمبلغ:',
                                                                        faText:
                                                                            'حداقل مقدار:',
                                                                      )} ${functions.applyCorrectNumberFormatting(FFAppState().AppSettings.minAmountForCheckout, FFAppConstants.defaultCurrencyCode, false, true)})',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayMiddle,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'amcff748' /* CHECKOUT */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelLargeFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      Semantics(
                                                    label: 'Checkout products',
                                                    child: FFButtonWidget(
                                                      onPressed: ((FFAppState()
                                                                      .Cart
                                                                      .products.isEmpty) ||
                                                              (functions.calculateCartTotalPrice(
                                                                      FFAppState()
                                                                          .Cart
                                                                          .products
                                                                          .toList()) <
                                                                  FFAppState()
                                                                      .AppSettings
                                                                      .minAmountForCheckout))
                                                          ? null
                                                          : () async {
                                                              logFirebaseEvent(
                                                                  'CART_PAGE_Checkoutting_ON_TAP');
                                                              if (FFAppState()
                                                                  .CurrentUser
                                                                  .isAnon) {
                                                                logFirebaseEvent(
                                                                    'Checkoutting_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Signup',
                                                                  queryParameters:
                                                                      {
                                                                    'showBackButton':
                                                                        serializeParam(
                                                                      true,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                if (functions.calculateCartTotalPrice(FFAppState()
                                                                        .Cart
                                                                        .products
                                                                        .toList()) >=
                                                                    FFAppState()
                                                                        .AppSettings
                                                                        .minAmountForCheckout) {
                                                                  // FetchUserInfo
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_FetchUserInfo');
                                                                  _model.user =
                                                                      await UsersTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) => q
                                                                            .eq(
                                                                      'id',
                                                                      currentUserUid,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_update_page_state');
                                                                  _model.currentUser =
                                                                      _model
                                                                          .user
                                                                          ?.first;
                                                                  // InsertOrder
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_InsertOrder');
                                                                  _model.order =
                                                                      await OrdersTable()
                                                                          .insert({
                                                                    'user_id':
                                                                        currentUserUid,
                                                                    'user_address_id': _model
                                                                        .currentUser
                                                                        ?.defaultAddressId,
                                                                    'order_number':
                                                                        random_data
                                                                            .randomString(
                                                                      8,
                                                                      16,
                                                                      true,
                                                                      true,
                                                                      true,
                                                                    ),
                                                                    'order_status':
                                                                        OrderStatuses
                                                                            .Draft
                                                                            .name,
                                                                    'payment_status':
                                                                        OrderPaymentStatus
                                                                            .Unpaid
                                                                            .name,
                                                                    'user_shipping_address_id': _model
                                                                        .currentUser
                                                                        ?.defaultAddressId,
                                                                    'price_sub_total': functions.calculateCartTotalPrice(FFAppState()
                                                                        .Cart
                                                                        .products
                                                                        .toList()),
                                                                    'price_total': functions.calculateCartTotalPrice(FFAppState()
                                                                        .Cart
                                                                        .products
                                                                        .toList()),
                                                                    'price_taxes':
                                                                        0.0,
                                                                    'price_delivery':
                                                                        0.0,
                                                                    'price_discounts':
                                                                        0.0,
                                                                    'country_id':
                                                                        FFAppState()
                                                                            .country
                                                                            .id,
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_backend_call');
                                                                  await OrdersTable()
                                                                      .update(
                                                                    data: {
                                                                      'order_number':
                                                                          (1000 + _model.order!.id)
                                                                              .toString(),
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'id',
                                                                      _model
                                                                          .order
                                                                          ?.id,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_update_page_state');
                                                                  _model.uniqueBusinesses = functions
                                                                      .uniqueIDs(FFAppState()
                                                                          .Cart
                                                                          .products
                                                                          .map((e) => e
                                                                              .businessId)
                                                                          .toList())
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                                  while (_model
                                                                          .uniqueBusinesses
                                                                          .length >
                                                                      _model
                                                                          .counterOrderGroup) {
                                                                    logFirebaseEvent(
                                                                        'Checkoutting_update_page_state');
                                                                    _model.uniqueBusinessWarehouses = functions
                                                                        .uniqueIDs(FFAppState()
                                                                            .Cart
                                                                            .products
                                                                            .where((e) =>
                                                                                e.businessId ==
                                                                                _model.uniqueBusinesses[_model.counterOrderGroup])
                                                                            .toList()
                                                                            .map((e) => e.warehouseId)
                                                                            .toList())
                                                                        .toList()
                                                                        .cast<int>();
                                                                    while (_model
                                                                            .uniqueBusinessWarehouses
                                                                            .length >
                                                                        _model
                                                                            .counterWarehouse) {
                                                                      logFirebaseEvent(
                                                                          'Checkoutting_backend_call');
                                                                      _model.orderGroup =
                                                                          await OrderGroupsTable()
                                                                              .insert({
                                                                        'order_id': _model
                                                                            .order
                                                                            ?.id,
                                                                        'business_id':
                                                                            _model.uniqueBusinesses[_model.counterOrderGroup],
                                                                        'status': OrderStatuses
                                                                            .Draft
                                                                            .name,
                                                                        'price_sub_total': functions.calculateOrderGroupTotalInCart(
                                                                            FFAppState().Cart.products.toList(),
                                                                            _model.uniqueBusinesses[_model.counterOrderGroup],
                                                                            _model.uniqueBusinessWarehouses[_model.counterWarehouse]),
                                                                        'business_warehouse_id':
                                                                            _model.uniqueBusinessWarehouses[_model.counterWarehouse],
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Checkoutting_update_page_state');
                                                                      _model.addToOrderGroups(
                                                                          _model
                                                                              .orderGroup!);
                                                                      logFirebaseEvent(
                                                                          'Checkoutting_update_page_state');
                                                                      _model.uniqueproducts = FFAppState()
                                                                          .Cart
                                                                          .products
                                                                          .where((e) =>
                                                                              (e.businessId == _model.uniqueBusinesses[_model.counterOrderGroup]) &&
                                                                              (e.warehouseId == _model.uniqueBusinessWarehouses[_model.counterWarehouse]))
                                                                          .toList()
                                                                          .map((e) => e.productId)
                                                                          .toList()
                                                                          .cast<int>();
                                                                      while (FFAppState()
                                                                              .Cart
                                                                              .products
                                                                              .where((e) => (e.businessId == _model.uniqueBusinesses[_model.counterOrderGroup]) && (e.warehouseId == _model.uniqueBusinessWarehouses[_model.counterWarehouse]))
                                                                              .toList()
                                                                              .length >
                                                                          _model.counterOrderProduct) {
                                                                        logFirebaseEvent(
                                                                            'Checkoutting_update_page_state');
                                                                        _model.currentCartProduct = FFAppState()
                                                                            .Cart
                                                                            .products
                                                                            .where((e) =>
                                                                                (e.businessId == _model.uniqueBusinesses[_model.counterOrderGroup]) &&
                                                                                (e.warehouseId == _model.uniqueBusinessWarehouses[_model.counterWarehouse]))
                                                                            .toList()[_model.counterOrderProduct];
                                                                        logFirebaseEvent(
                                                                            'Checkoutting_backend_call');
                                                                        _model.orderProduct =
                                                                            await OrderProductsTable().insert({
                                                                          'order_group_id': _model
                                                                              .orderGroup
                                                                              ?.id,
                                                                          'quantity': _model
                                                                              .currentCartProduct
                                                                              ?.quantity,
                                                                          'price_total':
                                                                              _model.currentCartProduct!.discountedPrice * _model.currentCartProduct!.quantity,
                                                                          'price_sub_total':
                                                                              _model.currentCartProduct!.discountedPrice * _model.currentCartProduct!.quantity,
                                                                          'price_discounts': _model
                                                                              .currentCartProduct
                                                                              ?.discountPercent,
                                                                          'price_taxes': _model
                                                                              .currentCartProduct
                                                                              ?.tax,
                                                                          'status':
                                                                              'Draft',
                                                                          'sum_weight': _model
                                                                              .currentCartProduct
                                                                              ?.weight,
                                                                          'sum_size': _model
                                                                              .currentCartProduct
                                                                              ?.size,
                                                                          'product_image': _model
                                                                              .currentCartProduct
                                                                              ?.image,
                                                                          'order_id': _model
                                                                              .order
                                                                              ?.id,
                                                                          'name': _model
                                                                              .currentCartProduct
                                                                              ?.productName,
                                                                          'description': _model
                                                                              .currentCartProduct
                                                                              ?.productDescription,
                                                                          'market_id': _model
                                                                              .currentCartProduct
                                                                              ?.marketId,
                                                                          'business_id': _model
                                                                              .currentCartProduct
                                                                              ?.businessId,
                                                                          'delivery_method_id': _model
                                                                              .currentCartProduct
                                                                              ?.deliveryMethodId,
                                                                          'delivery_methods_available_Ids': _model
                                                                              .currentCartProduct
                                                                              ?.deliveryMethodsAvailable,
                                                                          'product_id': _model
                                                                              .currentCartProduct
                                                                              ?.productId,
                                                                          'note': _model
                                                                              .currentCartProduct
                                                                              ?.note,
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Checkoutting_custom_action');
                                                                        await actions
                                                                            .printAction(
                                                                          'Order product: ${_model.orderProduct?.id.toString()}',
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Checkoutting_update_page_state');
                                                                        _model.addToOrderproducts(
                                                                            _model.orderProduct!);
                                                                        logFirebaseEvent(
                                                                            'Checkoutting_custom_action');
                                                                        await actions
                                                                            .printAction(
                                                                          _model
                                                                              .counterOrderProduct
                                                                              .toString(),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Checkoutting_update_page_state');
                                                                        _model.counterOrderProduct =
                                                                            _model.counterOrderProduct +
                                                                                1;
                                                                      }
                                                                      logFirebaseEvent(
                                                                          'Checkoutting_update_page_state');
                                                                      _model.counterOrderProduct =
                                                                          0;
                                                                      _model.counterWarehouse =
                                                                          _model.counterWarehouse +
                                                                              1;
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Checkoutting_custom_action');
                                                                    await actions
                                                                        .printAction(
                                                                      _model
                                                                          .counterOrderGroup
                                                                          .toString(),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Checkoutting_update_page_state');
                                                                    _model.counterOrderGroup =
                                                                        _model.counterOrderGroup +
                                                                            1;
                                                                    _model.counterWarehouse =
                                                                        0;
                                                                  }
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_update_app_state');
                                                                  FFAppState()
                                                                          .Cart =
                                                                      CartStruct();
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_navigate_to');

                                                                  context
                                                                      .goNamed(
                                                                    'Checkout',
                                                                    queryParameters:
                                                                        {
                                                                      'order':
                                                                          serializeParam(
                                                                        _model
                                                                            .order,
                                                                        ParamType
                                                                            .SupabaseRow,
                                                                      ),
                                                                      'orderGroups':
                                                                          serializeParam(
                                                                        _model
                                                                            .orderGroups,
                                                                        ParamType
                                                                            .SupabaseRow,
                                                                        isList:
                                                                            true,
                                                                      ),
                                                                      'orderproducts':
                                                                          serializeParam(
                                                                        _model
                                                                            .orderproducts,
                                                                        ParamType
                                                                            .SupabaseRow,
                                                                        isList:
                                                                            true,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Checkoutting_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () =>
                                                                              FocusScope.of(dialogContext).unfocus(),
                                                                          child:
                                                                              InfoModalWidget(
                                                                            title:
                                                                                FFLocalizations.of(context).getText(
                                                                              'n8aagpr3' /* Insufficient cart sum! */,
                                                                            ),
                                                                            body:
                                                                                FFLocalizations.of(context).getText(
                                                                              '2aauu3sh' /* The cart sum cannot be less th... */,
                                                                            ),
                                                                            isConfirm:
                                                                                false,
                                                                            autoDismiss:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'dpqix3gq' /*  */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 80.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0x00191717),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                  ],
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
