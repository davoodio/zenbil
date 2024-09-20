import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/cart_badge_widget.dart';
import '/components/cart_item/cart_item_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
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
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.cartBadgeModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CartBadgeWidget(
                                          backColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          goToCartOnTap: false,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        valueOrDefault<String>(
                                          '${FFAppState().Cart.products.length.toString()}${FFLocalizations.of(context).getVariableText(
                                            enText: ' Items in your cart',
                                            arText:
                                                ' العناصر الموجودة في سلة التسوق الخاصة بك',
                                            faText:
                                                ' اقلام موجود در سبد خرید شما',
                                          )}',
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
                                                      .secondaryText,
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
                                  ].divide(const SizedBox(width: 16.0)),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Semantics(
                                            label: 'Product cart details item',
                                            child: CartItemWidget(
                                              key: Key(
                                                  'Keyhv9_${productCartIndex}_of_${productCart.length}'),
                                              productCart: productCartItem,
                                              index: productCartIndex,
                                            ),
                                          ),
                                        );
                                      })
                                              .divide(const SizedBox(height: 16.0))
                                              .addToEnd(const SizedBox(height: 24.0)),
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
                                    if (FFAppState().Cart.products.isNotEmpty)
                                      Container(
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'd9mh8z15' /* Total */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily),
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    functions.applyCorrectNumberFormatting(
                                                        double.parse((functions.calculateCartTotalPrice(
                                                                    FFAppState()
                                                                        .Cart
                                                                        .products
                                                                        .toList()) *
                                                                FFAppState()
                                                                    .country
                                                                    .currencyExchangeRate)
                                                            .toStringAsFixed(
                                                                2)),
                                                        FFAppState()
                                                            .country
                                                            .currencyCode,
                                                        FFAppConstants
                                                            .useCurrencySymbol,
                                                        true),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily),
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Semantics(
                                              label: 'Checkout products',
                                              child: FFButtonWidget(
                                                onPressed: (FFAppState()
                                                            .Cart
                                                            .products.isEmpty)
                                                    ? null
                                                    : () async {
                                                        logFirebaseEvent(
                                                            'CART_PAGE_Checkoutting_ON_TAP');
                                                        if (FFAppState()
                                                            .CurrentUser
                                                            .isAnon) {
                                                          logFirebaseEvent(
                                                              'Checkoutting_navigate_to');

                                                          context.pushNamed(
                                                            'Signup',
                                                            queryParameters: {
                                                              'showBackButton':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          // FetchUserInfo
                                                          logFirebaseEvent(
                                                              'Checkoutting_FetchUserInfo');
                                                          _model.user =
                                                              await UsersTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Checkoutting_update_page_state');
                                                          _model.currentUser =
                                                              _model
                                                                  .user?.first;
                                                          // InsertOrder
                                                          logFirebaseEvent(
                                                              'Checkoutting_InsertOrder');
                                                          _model.order =
                                                              await OrdersTable()
                                                                  .insert({
                                                            'user_id':
                                                                currentUserUid,
                                                            'user_address_id':
                                                                _model
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
                                                                    .Draft.name,
                                                            'payment_status':
                                                                OrderPaymentStatus
                                                                    .Unpaid
                                                                    .name,
                                                            'user_shipping_address_id':
                                                                _model
                                                                    .currentUser
                                                                    ?.defaultAddressId,
                                                            'price_sub_total': functions
                                                                .calculateCartTotalPrice(
                                                                    FFAppState()
                                                                        .Cart
                                                                        .products
                                                                        .toList()),
                                                            'price_total': functions
                                                                .calculateCartTotalPrice(
                                                                    FFAppState()
                                                                        .Cart
                                                                        .products
                                                                        .toList()),
                                                            'price_taxes': 0.0,
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
                                                              'Checkoutting_update_page_state');
                                                          _model.uniqueBusinesses =
                                                              functions
                                                                  .uniqueIDs(FFAppState()
                                                                      .Cart
                                                                      .products
                                                                      .map((e) =>
                                                                          e.businessId)
                                                                      .toList())
                                                                  .toList()
                                                                  .cast<int>();
                                                          while (_model
                                                                  .uniqueBusinesses
                                                                  .length >
                                                              _model
                                                                  .counterOrderGroup) {
                                                            logFirebaseEvent(
                                                                'Checkoutting_backend_call');
                                                            _model.orderGroup =
                                                                await OrderGroupsTable()
                                                                    .insert({
                                                              'order_id': _model
                                                                  .order?.id,
                                                              'business_id': _model
                                                                      .uniqueBusinesses[
                                                                  _model
                                                                      .counterOrderGroup],
                                                              'status':
                                                                  OrderStatuses
                                                                      .Draft
                                                                      .name,
                                                              'price_sub_total': functions.calculateOrderGroupTotalInCart(
                                                                  FFAppState()
                                                                      .Cart
                                                                      .products
                                                                      .toList(),
                                                                  _model.uniqueBusinesses[
                                                                      _model
                                                                          .counterOrderGroup]),
                                                            });
                                                            logFirebaseEvent(
                                                                'Checkoutting_custom_action');
                                                            await actions
                                                                .printAction(
                                                              'Order group: ${_model.orderGroup?.id.toString()}',
                                                            );
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
                                                                    e.businessId ==
                                                                    _model.uniqueBusinesses[
                                                                        _model
                                                                            .counterOrderGroup])
                                                                .toList()
                                                                .map((e) =>
                                                                    e.productId)
                                                                .toList()
                                                                .cast<int>();
                                                            while (FFAppState()
                                                                    .Cart
                                                                    .products
                                                                    .where((e) =>
                                                                        e.businessId ==
                                                                        _model.uniqueBusinesses[_model
                                                                            .counterOrderGroup])
                                                                    .toList()
                                                                    .length >
                                                                _model
                                                                    .counterOrderProduct) {
                                                              logFirebaseEvent(
                                                                  'Checkoutting_update_page_state');
                                                              _model.currentCartProduct = FFAppState()
                                                                  .Cart
                                                                  .products
                                                                  .where((e) =>
                                                                      e.businessId ==
                                                                      _model.uniqueBusinesses[
                                                                          _model
                                                                              .counterOrderGroup])
                                                                  .toList()[_model.counterOrderProduct];
                                                              logFirebaseEvent(
                                                                  'Checkoutting_backend_call');
                                                              _model.orderProduct =
                                                                  await OrderProductsTable()
                                                                      .insert({
                                                                'order_group_id':
                                                                    _model
                                                                        .orderGroup
                                                                        ?.id,
                                                                'quantity': _model
                                                                    .currentCartProduct
                                                                    ?.quantity,
                                                                'price_total': _model
                                                                        .currentCartProduct!
                                                                        .discountedPrice *
                                                                    _model
                                                                        .currentCartProduct!
                                                                        .quantity,
                                                                'price_sub_total': _model
                                                                        .currentCartProduct!
                                                                        .discountedPrice *
                                                                    _model
                                                                        .currentCartProduct!
                                                                        .quantity,
                                                                'price_discounts': _model
                                                                    .currentCartProduct
                                                                    ?.discountPercent,
                                                                'price_taxes':
                                                                    _model
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
                                                                'product_image':
                                                                    _model
                                                                        .currentCartProduct
                                                                        ?.image,
                                                                'order_id':
                                                                    _model.order
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
                                                                  _model
                                                                      .orderProduct!);
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
                                                            _model.counterOrderProduct =
                                                                0;
                                                          }
                                                          logFirebaseEvent(
                                                              'Checkoutting_update_app_state');
                                                          FFAppState().Cart =
                                                              CartStruct();
                                                          logFirebaseEvent(
                                                              'Checkoutting_navigate_to');

                                                          context.goNamed(
                                                            'Checkout',
                                                            queryParameters: {
                                                              'order':
                                                                  serializeParam(
                                                                _model.order,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                              'orderGroups':
                                                                  serializeParam(
                                                                _model
                                                                    .orderGroups,
                                                                ParamType
                                                                    .SupabaseRow,
                                                                isList: true,
                                                              ),
                                                              'orderproducts':
                                                                  serializeParam(
                                                                _model
                                                                    .orderproducts,
                                                                ParamType
                                                                    .SupabaseRow,
                                                                isList: true,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dpqix3gq' /* CHECKOUT */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 48.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                          ]
                              .divide(const SizedBox(height: 16.0))
                              .addToStart(const SizedBox(height: 16.0)),
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
