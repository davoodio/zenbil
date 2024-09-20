import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control_model.dart';
export 'control_model.dart';

class ControlWidget extends StatefulWidget {
  const ControlWidget({super.key});

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget>
    with TickerProviderStateMixin {
  late ControlModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Control'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTROL_PAGE_Control_ON_INIT_STATE');
      logFirebaseEvent('Control_custom_action');
      await actions.handleDynamicLink(
        context,
      );
      if (FFAppState().storeID != 0) {
        logFirebaseEvent('Control_navigate_to');

        context.goNamed(
          'StoreFront',
          queryParameters: {
            'marketID': serializeParam(
              FFAppState().storeID,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      } else {
        await Future.wait([
          Future(() async {
            // FetchWallets
            logFirebaseEvent('Control_FetchWallets');
            _model.userWallet = await WalletsTable().queryRows(
              queryFn: (q) => q.eq(
                'user_id',
                (currentUserUid != '') &&
                        (currentUserUid != '')
                    ? currentUserUid
                    : '00000000-0000-0000-0000-000000000000',
              ),
            );
            if (_model.userWallet!.isNotEmpty) {
              logFirebaseEvent('Control_update_app_state');
              FFAppState().Wallet = WalletStruct(
                walletId: _model.userWallet?.first.id,
                createdAt: _model.userWallet?.first.createdAt,
                userId: _model.userWallet?.first.userId,
                currencyCode: _model.userWallet?.first.currencyCode,
                transactionSymbol: _model.userWallet?.first.transactionSymbol,
                balance: _model.userWallet?.first.balance,
              );
              safeSetState(() {});
            } else {
              if ((currentUserUid != '') &&
                  (currentUserUid != '')) {
                logFirebaseEvent('Control_backend_call');
                _model.walletCreatedForUser = await WalletsTable().insert({
                  'user_id': currentUserUid,
                  'balance': 0.0,
                  'currency_code': FFAppConstants.defaultCurrencyCode,
                  'transaction_symbol': FFAppConstants.defaultCurrencySymbol,
                });
                logFirebaseEvent('Control_update_app_state');
                FFAppState().Wallet = WalletStruct(
                  walletId: _model.walletCreatedForUser?.id,
                  createdAt: _model.walletCreatedForUser?.createdAt,
                  userId: _model.walletCreatedForUser?.userId,
                  currencyCode: _model.walletCreatedForUser?.currencyCode,
                  transactionSymbol:
                      _model.walletCreatedForUser?.transactionSymbol,
                  balance: _model.walletCreatedForUser?.balance,
                );
                safeSetState(() {});
              }
            }
          }),
          Future(() async {
            if (FFAppState().country.currencySymbol != '') {
              // FetchCurrencyExchangeRate
              logFirebaseEvent('Control_FetchCurrencyExchangeRate');
              _model.country = await CountriesTable().queryRows(
                queryFn: (q) => q.eq(
                  'currency_symbol',
                  FFAppState().country.currencySymbol,
                ),
              );
              if ((FFAppConstants.defaultCurrencySymbol == '') &&
                  (_model.country!.isNotEmpty)) {
                logFirebaseEvent('Control_update_app_state');
                FFAppState().updateCountryStruct(
                  (e) => e
                    ..currencyExchangeRate =
                        _model.country?.first.currencyExchangeRate,
                );
              } else {
                logFirebaseEvent('Control_update_app_state');
                FFAppState().updateCountryStruct(
                  (e) => e
                    ..currencyExchangeRate = 1.00
                    ..currencySymbol = FFAppConstants.defaultCurrencySymbol
                    ..currencyCode = FFAppConstants.defaultCurrencyCode
                    ..id = 1,
                );
              }
            } else {
              logFirebaseEvent('Control_backend_call');
              _model.defaultCountry = await CountriesTable().queryRows(
                queryFn: (q) => q.eq(
                  'code',
                  FFAppConstants.DefaultCountryCode,
                ),
              );
              if ((_model.defaultCountry != null &&
                      (_model.defaultCountry)!.isNotEmpty) &&
                  (_model.defaultCountry!.isNotEmpty)) {
                logFirebaseEvent('Control_action_block');
                await action_blocks.setCountry(
                  context,
                  country: _model.defaultCountry?.first,
                );
              }
            }

            logFirebaseEvent('Control_action_block');
            await action_blocks.userControl(context);
            safeSetState(() {});
          }),
          Future(() async {
            // FetchAppSettings
            logFirebaseEvent('Control_FetchAppSettings');
            _model.appSettings = await AppGeneralSettingsTable().queryRows(
              queryFn: (q) => q,
            );
            if (_model.appSettings != null &&
                (_model.appSettings)!.isNotEmpty) {
              logFirebaseEvent('Control_update_app_state');
              FFAppState().updateAppSettingsStruct(
                (e) => e
                  ..enableWalletAsPaymentOption = _model.appSettings?.first.enableWalletAsPaymentOption ?? FFAppState().AppSettings.enableWalletAsPaymentOption
                  ..enableWalletTopup =
                      _model.appSettings?.first.enableWalletTopup ?? FFAppState().AppSettings.enableWalletTopup
                  ..enableAdvertisement =
                      _model.appSettings?.first.enableAdvertisement ?? FFAppState().AppSettings.enableAdvertisement
                  ..enableAdvertisementOnHome =
                      _model.appSettings?.first.enableAdvertisementOnHome ?? FFAppState().AppSettings.enableAdvertisementOnHome
                  ..enableAdvertisementOnCategories = _model
                          .appSettings?.first.enableAdvertisementOnCategories ?? FFAppState().AppSettings.enableAdvertisementOnCategories
                  ..enableAdvertisementOnSubCategories = _model.appSettings?.first
                          .enableAdvertisementOnSubCategories ?? FFAppState()
                          .AppSettings
                          .enableAdvertisementOnSubCategories
                  ..enableAdvertisementOnMarkets = _model.appSettings?.first.enableAdvertisementOnMarkets ?? FFAppState().AppSettings.enableAdvertisementOnMarkets
                  ..minAmountWalletTopup =
                      _model.appSettings?.first.minAmountWalletTopup ?? FFAppState().AppSettings.minAmountWalletTopup
                  ..maxAmountWalletTopup =
                      _model.appSettings?.first.maxAmountWalletTopup ?? FFAppState().AppSettings.maxAmountWalletTopup
                  ..social = _model.appSettings?.first.social != null
                      ? (getJsonField(
                          functions.getItemAtIndexOfADynamicList(
                              _model.appSettings!
                                  .map((e) => e.social)
                                  .withoutNulls
                                  .toList()
                                  .toList(),
                              0),
                          r'''$.social''',
                          true,
                        )!
                              .toList()
                              .map<SocialStruct?>(SocialStruct.maybeFromMap)
                              .toList() as Iterable<SocialStruct?>)
                          .withoutNulls
                      : FFAppState().AppSettings.social.toList()
                  ..enableAdvertisementOnProductDetail = _model.appSettings?.first
                          .enableAdvertisementOnProductDetail ?? FFAppState()
                          .AppSettings
                          .enableAdvertisementOnProductDetail,
              );
            }
          }),
          Future(() async {
            if (!FFAppState().CurrentUser.isAnon) {
              // FetchUserFavorites
              logFirebaseEvent('Control_FetchUserFavorites');
              _model.userFavorites = await UserFavoritesTable().queryRows(
                queryFn: (q) => q.eq(
                  'user_id',
                  currentUserUid,
                ),
              );
              if ((_model.userFavorites != null &&
                      (_model.userFavorites)!.isNotEmpty) &&
                  (_model.userFavorites!.isNotEmpty)) {
                logFirebaseEvent('Control_update_app_state');
                FFAppState().UserFavorites = _model.userFavorites!
                    .map((e) => e.productId)
                    .withoutNulls
                    .toList()
                    .toList()
                    .cast<int>();
              }
            }
          }),
          Future(() async {
            if (!FFAppState().CurrentUser.isAnon) {
              if ((FFAppState().Cart != null) &&
                  (FFAppState().Cart.products.isNotEmpty)) {
                // FetchUserCartProducts
                logFirebaseEvent('Control_FetchUserCartProducts');
                _model.userCartProducts = await ProductsTable().queryRows(
                  queryFn: (q) => q.in_(
                    'id',
                    FFAppState().Cart.products.map((e) => e.productId).toList(),
                  ),
                );
                while (_model.cartProductsCounter <
                    FFAppState().Cart.products.length) {
                  if ((!_model.userCartProducts!
                          .map((e) => e.id)
                          .toList()
                          .toList()
                          .contains(FFAppState()
                              .Cart
                              .products[_model.cartProductsCounter]
                              .productId)) ||
                      (_model.userCartProducts
                              ?.where((e) =>
                                  e.id ==
                                  FFAppState()
                                      .Cart
                                      .products[_model.cartProductsCounter]
                                      .productId)
                              .toList()
                              .first
                              .status !=
                          ProductStatus.Available.name)) {
                    // IfDeletedAlsoRemoveFromCart
                    logFirebaseEvent('Control_IfDeletedAlsoRemoveFromCart');
                    FFAppState().updateCartStruct(
                      (e) => e
                        ..updateProducts(
                          (e) => e.removeAt(_model.cartProductsCounter),
                        ),
                    );
                  } else {
                    // IfNotDeletedUpdateProductInfo
                    logFirebaseEvent('Control_IfNotDeletedUpdateProductInfo');
                    FFAppState().updateCartStruct(
                      (e) => e
                        ..updateProducts(
                          (e) => e[_model.cartProductsCounter]
                            ..price = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .price
                            ..productName = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .name
                            ..productDescription = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .description
                            ..discountPercent = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .discountPercent
                            ..image = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .defaultImageUrl
                            ..deliveryMethodId = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .deliveryMethodId
                            ..weight = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .weight
                            ..size = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .size
                            ..deliveryMethodsAvailable = _model
                                .userCartProducts!
                                .where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .deliveryMethodsAvailableList
                                .toList()
                            ..discountedPrice = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .discountedPrice
                            ..quantity = _model.userCartProducts!
                                        .where((e) =>
                                            e.id ==
                                            FFAppState()
                                                .Cart
                                                .products[
                                                    _model.cartProductsCounter]
                                                .productId)
                                        .toList()
                                        .first
                                        .quantityInInventory! <
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .quantity
                                ? _model.userCartProducts
                                    ?.where((e) =>
                                        e.id ==
                                        FFAppState()
                                            .Cart
                                            .products[
                                                _model.cartProductsCounter]
                                            .productId)
                                    .toList()
                                    .first
                                    .quantityInInventory
                                : FFAppState()
                                    .Cart
                                    .products[_model.cartProductsCounter]
                                    .quantity
                            ..quantityInInventory = _model.userCartProducts
                                ?.where((e) =>
                                    e.id ==
                                    FFAppState()
                                        .Cart
                                        .products[_model.cartProductsCounter]
                                        .productId)
                                .toList()
                                .first
                                .quantityInInventory,
                        ),
                    );
                  }

                  logFirebaseEvent('Control_update_page_state');
                  _model.cartProductsCounter = _model.cartProductsCounter + 1;
                  safeSetState(() {});
                }
              }
            }
          }),
        ]);
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
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
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 500),
                          fadeOutDuration: const Duration(milliseconds: 500),
                          imageUrl: FFAppConstants.BrandLauncherIcon,
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                    ),
                  ].divide(const SizedBox(height: 34.0)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 180.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('CONTROL_PAGE_Text_r2tsrcu8_ON_TAP');
                          logFirebaseEvent('Text_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('Splash', context.mounted);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'nn5reus3' /* Loading Your Data ... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
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
      ),
    );
  }
}
