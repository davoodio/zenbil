import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/cart_badge_widget.dart';
import '/components/empty_component_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/image_widget_widget.dart';
import '/components/loaders/loader_box_grid_product/loader_box_grid_product_widget.dart';
import '/components/market_type_badge_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/components/search_badge_widget.dart';
import '/components/share_badge_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'store_front_model.dart';
export 'store_front_model.dart';

class StoreFrontWidget extends StatefulWidget {
  const StoreFrontWidget({
    super.key,
    this.marketID,
    this.brandID,
  });

  final int? marketID;
  final int? brandID;

  @override
  State<StoreFrontWidget> createState() => _StoreFrontWidgetState();
}

class _StoreFrontWidgetState extends State<StoreFrontWidget> {
  late StoreFrontModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreFrontModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StoreFront'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STORE_FRONT_StoreFront_ON_INIT_STATE');
      if (widget.marketID != null) {
        // Fetch Markets
        logFirebaseEvent('StoreFront_FetchMarkets');
        _model.currentMarket = await MarketsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.marketID,
          ),
        );
        if (_model.currentMarket!.isNotEmpty) {
          logFirebaseEvent('StoreFront_update_page_state');
          _model.market = _model.currentMarket?.first;
          safeSetState(() {});
        }
      } else {
        // Fetch Brands
        logFirebaseEvent('StoreFront_FetchBrands');
        _model.currentBrand = await BrandsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.brandID,
          ),
        );
        if (_model.currentBrand!.isNotEmpty) {
          logFirebaseEvent('StoreFront_update_page_state');
          _model.brand = _model.currentBrand?.first;
          safeSetState(() {});
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SafeArea(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                borderWidth: 0.0,
                                buttonSize: 34.0,
                                icon: Icon(
                                  FFIcons.karrowLeft,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'STORE_FRONT_PAGE_arrowLeft_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                              if ((_model.market != null) ||
                                  (_model.brand != null))
                                Flexible(
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      _model.market != null
                                          ? FFLocalizations.of(context)
                                              .getVariableText(
                                              enText: _model.market?.name,
                                              arText: valueOrDefault<String>(
                                                _model.market?.nameArabic !=
                                                            null &&
                                                        _model.market
                                                                ?.nameArabic !=
                                                            ''
                                                    ? _model.market?.nameArabic
                                                    : _model.market?.name,
                                                '-',
                                              ),
                                              faText: valueOrDefault<String>(
                                                _model.market?.nameKurdish !=
                                                            null &&
                                                        _model.market
                                                                ?.nameKurdish !=
                                                            ''
                                                    ? _model.market?.nameKurdish
                                                    : _model.market?.name,
                                                '-',
                                              ),
                                            )
                                          : _model.brand?.name,
                                      '-',
                                    ),
                                    maxLines: 1,
                                    minFontSize: 12.0,
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily),
                                        ),
                                  ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (widget.marketID != null)
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'STORE_FRONT_Container_9uz8p28m_ON_TAP');
                                          logFirebaseEvent(
                                              'ShareBadge_custom_action');
                                          _model.generatedLink = await actions
                                              .generateProductStoreLink(
                                            widget.marketID!,
                                            _model.market!,
                                          );
                                          logFirebaseEvent('ShareBadge_share');
                                          await Share.share(
                                            _model.generatedLink!,
                                            sharePositionOrigin:
                                                getWidgetBoundingBox(context),
                                          );

                                          safeSetState(() {});
                                        },
                                        child: wrapWithModel(
                                          model: _model.shareBadgeModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ShareBadgeWidget(
                                            backColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            marketId: widget.marketID!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.marketID != null)
                                    wrapWithModel(
                                      model: _model.searchBadgeModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SearchBadgeWidget(
                                        backColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        goToSearchOnTap: true,
                                        tableName: 'view_market_product',
                                        fieldsToReturnFromTable:
                                            'market_product_market_id, market_product_is_active, \nmarket_product_product_id, \nproduct_name, product_description, product_default_image_url, product_name_arabic, product_name_kurdish, product_description_arabic, product_description_kurdish',
                                        fieldsToSearchIn:
                                            'product_name, product_description, product_name_arabic, product_name_kurdish, product_description_arabic, product_description_kurdish',
                                        searchTitle:
                                            'Products of ${_model.market?.name}',
                                        preDefineSearch:
                                            'market_product_is_active=${true.toString()},market_product_market_id=${widget.marketID?.toString()},quantity_in_inventory>0',
                                      ),
                                    ),
                                  wrapWithModel(
                                    model: _model.cartBadgeModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CartBadgeWidget(
                                      backColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      goToCartOnTap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (widget.marketID != null) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    child: Stack(
                                      children: [
                                        if (_model.market != null)
                                          SizedBox(
                                            width: double.infinity,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 230.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (_model.market
                                                                  ?.headerUrl !=
                                                              null &&
                                                          _model.market
                                                                  ?.headerUrl !=
                                                              '') {
                                                        return wrapWithModel(
                                                          model: _model
                                                              .imageWidgetModel1,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ImageWidgetWidget(
                                                            image: _model.market
                                                                ?.headerUrl,
                                                            isExpamdable: false,
                                                            radius: 0.0,
                                                            isAvatar: false,
                                                          ),
                                                        );
                                                      } else {
                                                        return wrapWithModel(
                                                          model: _model
                                                              .imageWidgetModel2,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ImageWidgetWidget(
                                                            image: _model.market
                                                                ?.logoUrl,
                                                            isExpamdable: false,
                                                            radius: 0.0,
                                                            isAvatar: false,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                if (MarketBannerBodyStruct
                                                            .maybeFromMap(_model
                                                                .market!
                                                                .marketBanner!)!
                                                        .marketBanner.isNotEmpty)
                                                  Container(
                                                    width: double.infinity,
                                                    height: 240.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 230.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final banner = MarketBannerBodyStruct.maybeFromMap(_model
                                                                            .market
                                                                            ?.marketBanner)
                                                                        ?.marketBanner
                                                                        .toList() ??
                                                                    [];

                                                                return SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  child: CarouselSlider
                                                                      .builder(
                                                                    itemCount:
                                                                        banner
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            bannerIndex,
                                                                            _) {
                                                                      final bannerItem =
                                                                          banner[
                                                                              bannerIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'STORE_FRONT_Container_2k5qxg2i_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Container_custom_action');
                                                                          await actions
                                                                              .printAction(
                                                                            bannerItem.url,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Container_launch_u_r_l');
                                                                          await launchURL(
                                                                              bannerItem.url);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              ImageWidgetWidget(
                                                                            key:
                                                                                Key('Keydsb_${bannerIndex}_of_${banner.length}'),
                                                                            image:
                                                                                bannerItem.imageUrl,
                                                                            isExpamdable:
                                                                                false,
                                                                            radius:
                                                                                0.0,
                                                                            isAvatar:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    carouselController:
                                                                        _model.carouselController ??=
                                                                            CarouselSliderController(),
                                                                    options:
                                                                        CarouselOptions(
                                                                      initialPage: max(
                                                                          0,
                                                                          min(1,
                                                                              banner.length - 1)),
                                                                      viewportFraction:
                                                                          1.0,
                                                                      disableCenter:
                                                                          true,
                                                                      enlargeCenterPage:
                                                                          false,
                                                                      enlargeFactor:
                                                                          0.0,
                                                                      enableInfiniteScroll:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      autoPlay:
                                                                          true,
                                                                      autoPlayAnimationDuration:
                                                                          const Duration(
                                                                              milliseconds: 700),
                                                                      autoPlayInterval:
                                                                          const Duration(
                                                                              milliseconds: (700 + 2000)),
                                                                      autoPlayCurve:
                                                                          Curves
                                                                              .linear,
                                                                      pauseAutoPlayInFiniteScroll:
                                                                          true,
                                                                      onPageChanged: (index,
                                                                              _) =>
                                                                          _model.carouselCurrentIndex =
                                                                              index,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model:
                                                  _model.marketTypeBadgeModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MarketTypeBadgeWidget(
                                                type: _model.market?.type,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 230.0,
                                    child: wrapWithModel(
                                      model: _model.imageWidgetModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ImageWidgetWidget(
                                        image: _model.brand?.logoUrl,
                                        isExpamdable: false,
                                        radius: 0.0,
                                        isAvatar: false,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Builder(
                              builder: (context) {
                                if (FFAppState()
                                        .AppSettings
                                        .enableAdvertisement &&
                                    FFAppState()
                                        .AppSettings
                                        .enableAdvertisementOnMarkets) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      FutureBuilder<List<AdvertisingRow>>(
                                        future: AdvertisingTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'status',
                                                'Active',
                                              )
                                              .contains(
                                                'ads_place',
                                                '{${AdvertisePlacesInMobileApp.Markets.name}}',
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return const SizedBox(
                                              width: double.infinity,
                                              height: 0.0,
                                              child: EmptyComponentWidget(),
                                            );
                                          }
                                          List<AdvertisingRow>
                                              containerAdvertisingRowList =
                                              snapshot.data!;

                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: valueOrDefault<double>(
                                                containerAdvertisingRowList.isNotEmpty
                                                    ? 160.0
                                                    : 0.0,
                                                160.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final containerVar =
                                                        containerAdvertisingRowList
                                                            .toList();

                                                    return SizedBox(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: PageView.builder(
                                                        controller: _model
                                                                .pageViewController ??=
                                                            PageController(
                                                                initialPage: max(
                                                                    0,
                                                                    min(
                                                                        0,
                                                                        containerVar.length -
                                                                            1))),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            containerVar.length,
                                                        itemBuilder: (context,
                                                            containerVarIndex) {
                                                          final containerVarItem =
                                                              containerVar[
                                                                  containerVarIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'STORE_FRONT_Container_pw9yln79_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'AdvertiseBanner_action_block');
                                                              await action_blocks
                                                                  .advertisementOnClick(
                                                                context,
                                                                advertisement:
                                                                    containerVarItem,
                                                              );
                                                            },
                                                            child:
                                                                AdvertiseBannerWidget(
                                                              key: Key(
                                                                  'Keypw9_${containerVarIndex}_of_${containerVar.length}'),
                                                              advertise:
                                                                  containerVarItem,
                                                              indexInList:
                                                                  containerVarIndex,
                                                              numberOfItems:
                                                                  containerAdvertisingRowList
                                                                      .length,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: const BoxDecoration(),
                                  );
                                }
                              },
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (widget.marketID != null) {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: FutureBuilder<
                                              List<ViewMarketProductRow>>(
                                            future: ViewMarketProductTable()
                                                .queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'market_product_market_id',
                                                    widget.marketID,
                                                  )
                                                  .eq(
                                                    'market_product_is_active',
                                                    true,
                                                  )
                                                  .gt(
                                                    'quantity_in_inventory',
                                                    0,
                                                  )
                                                  .eq(
                                                    'market_product_product_status',
                                                    ProductStatus
                                                        .Available.name,
                                                  ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return LoaderBoxGridProductWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shimmerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  numberOfItems: 4,
                                                );
                                              }
                                              List<ViewMarketProductRow>
                                                  marketProductsViewMarketProductRowList =
                                                  snapshot.data!;

                                              if (marketProductsViewMarketProductRowList
                                                  .isEmpty) {
                                                return EmptyStateWidget(
                                                  message: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'qeceyuw7' /* There is no product. */,
                                                  ),
                                                  actionButton: () async {},
                                                );
                                              }

                                              return MasonryGridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                ),
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                itemCount:
                                                    marketProductsViewMarketProductRowList
                                                        .length,
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  20.0,
                                                  0,
                                                  44.0,
                                                ),
                                                shrinkWrap: true,
                                                itemBuilder: (context,
                                                    marketProductsIndex) {
                                                  final marketProductsViewMarketProductRow =
                                                      marketProductsViewMarketProductRowList[
                                                          marketProductsIndex];
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: ProductCardWidget(
                                                      key: Key(
                                                          'Keyq5h_${marketProductsIndex}_of_${marketProductsViewMarketProductRowList.length}'),
                                                      image: marketProductsViewMarketProductRow
                                                          .productDefaultImageUrl!,
                                                      productName:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        enText:
                                                            marketProductsViewMarketProductRow
                                                                .productName,
                                                        arText: marketProductsViewMarketProductRow
                                                                        .productNameArabic !=
                                                                    null &&
                                                                marketProductsViewMarketProductRow
                                                                        .productNameArabic !=
                                                                    ''
                                                            ? marketProductsViewMarketProductRow
                                                                .productNameArabic
                                                            : marketProductsViewMarketProductRow
                                                                .productName,
                                                        faText: marketProductsViewMarketProductRow
                                                                        .productNameKurdish !=
                                                                    null &&
                                                                marketProductsViewMarketProductRow
                                                                        .productNameKurdish !=
                                                                    ''
                                                            ? marketProductsViewMarketProductRow
                                                                .productNameKurdish
                                                            : marketProductsViewMarketProductRow
                                                                .productName,
                                                      ),
                                                      price:
                                                          marketProductsViewMarketProductRow
                                                              .productPrice,
                                                      discount:
                                                          marketProductsViewMarketProductRow
                                                              .productDiscountPercent,
                                                      reviewRate:
                                                          marketProductsViewMarketProductRow
                                                              .productReviewRate,
                                                      numberOfReviews:
                                                          marketProductsViewMarketProductRow
                                                              .productNumberOfReviews,
                                                      productId:
                                                          marketProductsViewMarketProductRow
                                                              .marketProductProductId!,
                                                      marketID:
                                                          widget.marketID,
                                                      discountedPrice:
                                                          marketProductsViewMarketProductRow
                                                              .productDiscountedPrice,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child:
                                              FutureBuilder<List<ProductsRow>>(
                                            future: ProductsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'status',
                                                    ProductStatus
                                                        .Available.name,
                                                  )
                                                  .eq(
                                                    'brand_id',
                                                    widget.brandID,
                                                  ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return LoaderBoxGridProductWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shimmerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  numberOfItems: 4,
                                                );
                                              }
                                              List<ProductsRow>
                                                  brandProductsProductsRowList =
                                                  snapshot.data!;

                                              if (brandProductsProductsRowList
                                                  .isEmpty) {
                                                return EmptyStateWidget(
                                                  message: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '3ap39mgk' /* There is no product. */,
                                                  ),
                                                  actionButton: () async {},
                                                );
                                              }

                                              return MasonryGridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                ),
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                itemCount:
                                                    brandProductsProductsRowList
                                                        .length,
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  20.0,
                                                  0,
                                                  44.0,
                                                ),
                                                shrinkWrap: true,
                                                itemBuilder: (context,
                                                    brandProductsIndex) {
                                                  final brandProductsProductsRow =
                                                      brandProductsProductsRowList[
                                                          brandProductsIndex];
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FutureBuilder<
                                                        List<BusinessesRow>>(
                                                      future: BusinessesTable()
                                                          .querySingleRow(
                                                        queryFn: (q) => q.eq(
                                                          'id',
                                                          brandProductsProductsRow
                                                              .businessId,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const EmptyComponentWidget();
                                                        }
                                                        List<BusinessesRow>
                                                            productCardBusinessesRowList =
                                                            snapshot.data!;

                                                        final productCardBusinessesRow =
                                                            productCardBusinessesRowList
                                                                    .isNotEmpty
                                                                ? productCardBusinessesRowList
                                                                    .first
                                                                : null;

                                                        return wrapWithModel(
                                                          model: _model
                                                              .productCardModels2
                                                              .getModel(
                                                            brandProductsProductsRow
                                                                .id
                                                                .toString(),
                                                            brandProductsIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ProductCardWidget(
                                                            key: Key(
                                                              'Keyafn_${brandProductsProductsRow.id.toString()}',
                                                            ),
                                                            image: brandProductsProductsRow
                                                                .defaultImageUrl!,
                                                            productName:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText:
                                                                  brandProductsProductsRow
                                                                      .name,
                                                              arText: brandProductsProductsRow
                                                                              .nameArabic !=
                                                                          null &&
                                                                      brandProductsProductsRow
                                                                              .nameArabic !=
                                                                          ''
                                                                  ? brandProductsProductsRow
                                                                      .nameArabic
                                                                  : brandProductsProductsRow
                                                                      .name,
                                                              faText: brandProductsProductsRow
                                                                              .nameKurdish !=
                                                                          null &&
                                                                      brandProductsProductsRow
                                                                              .nameKurdish !=
                                                                          ''
                                                                  ? brandProductsProductsRow
                                                                      .nameKurdish
                                                                  : brandProductsProductsRow
                                                                      .name,
                                                            ),
                                                            price:
                                                                brandProductsProductsRow
                                                                    .price,
                                                            discount:
                                                                brandProductsProductsRow
                                                                    .discountPercent,
                                                            reviewRate:
                                                                brandProductsProductsRow
                                                                    .reviewRate,
                                                            numberOfReviews:
                                                                brandProductsProductsRow
                                                                    .numberOfReviews,
                                                            productId:
                                                                brandProductsProductsRow
                                                                    .id,
                                                            marketID:
                                                                productCardBusinessesRow
                                                                    ?.defaultMarketId,
                                                            discountedPrice:
                                                                brandProductsProductsRow
                                                                    .discountedPrice,
                                                            imagesUrl:
                                                                brandProductsProductsRow
                                                                    .imagesUrl,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: const NavBarWidget(
                          activePage: '-',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
