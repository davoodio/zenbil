import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/capacitytems_widget.dart';
import '/components/cart_badge_widget.dart';
import '/components/color_items_widget.dart';
import '/components/counter_product_widget.dart';
import '/components/empty_component_widget.dart';
import '/components/favorite_badge_widget.dart';
import '/components/info_modal_widget.dart';
import '/components/market_type_badge_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/components/product_fav_toggle_widget.dart';
import '/components/review_box_widget.dart';
import '/components/review_summary_section_widget.dart';
import '/components/share_badge_widget.dart';
import '/components/shimmer_page_detail_widget.dart';
import '/components/shimmer_reviews_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    required this.productId,
    this.marketID,
  });

  final int? productId;
  final int? marketID;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProductDetail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_DETAIL_ProductDetail_ON_INIT_STA');
      logFirebaseEvent('ProductDetail_update_page_state');
      _model.isPageLoading = true;
      safeSetState(() {});
      logFirebaseEvent('ProductDetail_update_page_state');
      _model.cartProducts =
          FFAppState().Cart.products.toList().cast<CartProductStruct>();
      if ((widget.marketID != null) && (widget.marketID != 0)) {
        logFirebaseEvent('ProductDetail_backend_call');
        _model.marketLoaded = await MarketsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.marketID,
          ),
        );
        if (_model.marketLoaded!.isNotEmpty) {
          logFirebaseEvent('ProductDetail_update_page_state');
          _model.marketData = _model.marketLoaded?.first;
          _model.defaultBusinessMarket = false;
        }
      } else {
        logFirebaseEvent('ProductDetail_backend_call');
        _model.productLoadedAction = await ProductsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.productId,
          ),
        );
        logFirebaseEvent('ProductDetail_backend_call');
        _model.businessLoadedFromProduct = await BusinessesTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            _model.productLoadedAction?.first.businessId,
          ),
        );
        logFirebaseEvent('ProductDetail_backend_call');
        _model.defaultMarketOfBusiness = await MarketsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            _model.businessLoadedFromProduct?.first.defaultMarketId,
          ),
        );
        logFirebaseEvent('ProductDetail_update_page_state');
        _model.marketData = _model.defaultMarketOfBusiness?.first;
        _model.defaultBusinessMarket = true;
      }

      logFirebaseEvent('ProductDetail_update_page_state');
      _model.isPageLoading = false;
      safeSetState(() {});
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

    return FutureBuilder<List<ProductsRow>>(
      future: ProductsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.productId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const ShimmerPageDetailWidget(),
          );
        }
        List<ProductsRow> productDetailProductsRowList = snapshot.data!;

        final productDetailProductsRow = productDetailProductsRowList.isNotEmpty
            ? productDetailProductsRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                if (!_model.isPageLoading)
                  SliverAppBar(
                    expandedHeight: 600.0,
                    pinned: false,
                    floating: false,
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Semantics(
                            label: 'back button',
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                FFIcons.karrowLeft,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 22.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PRODUCT_DETAIL_PAGE_arrowLeft_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PRODUCT_DETAIL_Container_x2ex9byr_ON_TAP');
                                logFirebaseEvent('ShareBadge_custom_action');
                                _model.generatedLink =
                                    await actions.generateProductDetailLink(
                                  widget.productId!,
                                  _model.marketData!.id,
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
                                updateCallback: () => safeSetState(() {}),
                                child: ShareBadgeWidget(
                                  backColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  marketId: valueOrDefault<int>(
                                    _model.marketData?.id,
                                    0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Semantics(
                            label:
                                'add to favorite list or remove from favorite list ',
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PRODUCT_DETAIL_Container_yc77aij8_ON_TAP');
                                logFirebaseEvent('FavoriteBadge_navigate_to');

                                context.pushNamed('Favorites');
                              },
                              child: wrapWithModel(
                                model: _model.favoriteBadgeModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: FavoriteBadgeWidget(
                                  backColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  productId: valueOrDefault<int>(
                                    widget.productId,
                                    0,
                                  ),
                                  marketId: valueOrDefault<int>(
                                    _model.marketData?.id,
                                    0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Semantics(
                              label: 'Cart Badge',
                              child: wrapWithModel(
                                model: _model.cartBadgeModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CartBadgeWidget(
                                  backColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  goToCartOnTap: true,
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                        child: SafeArea(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final imageVar = productDetailProductsRow
                                        ?.imagesUrl
                                        .toList() ??
                                    [];

                                return Semantics(
                                  label: 'Product images',
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 550.0,
                                    child: Stack(
                                      children: [
                                        PageView.builder(
                                          controller:
                                              _model.pageViewController1 ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              imageVar.length -
                                                                  1))),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: imageVar.length,
                                          itemBuilder:
                                              (context, imageVarIndex) {
                                            final imageVarItem =
                                                imageVar[imageVarIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PRODUCT_DETAIL_Image_uzw6r2sd_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_expand_image');
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          imageVarItem,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/9r58rfhytwms/image-placeholder-icon-5.jpeg',
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: valueOrDefault<
                                                          String>(
                                                        imageVarItem,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/9r58rfhytwms/image-placeholder-icon-5.jpeg' '$imageVarIndex',
                                                      ),
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: valueOrDefault<String>(
                                                  imageVarItem,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/9r58rfhytwms/image-placeholder-icon-5.jpeg' '$imageVarIndex',
                                                ),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      imageVarItem,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/9r58rfhytwms/image-placeholder-icon-5.jpeg',
                                                    ),
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _model
                                                      .pageViewController1 ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              imageVar.length -
                                                                  1))),
                                              count: imageVar.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model
                                                    .pageViewController1!
                                                    .animateToPage(
                                                  i,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                                safeSetState(() {});
                                              },
                                              effect: smooth_page_indicator
                                                  .SlideEffect(
                                                spacing: 8.0,
                                                radius: 16.0,
                                                dotWidth: 8.0,
                                                dotHeight: 8.0,
                                                dotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .lightBlack,
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    centerTitle: false,
                  )
              ],
              body: Builder(
                builder: (context) {
                  return Builder(
                    builder: (context) {
                      if (!_model.isPageLoading) {
                        return SizedBox(
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
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (false)
                                              SizedBox(
                                                height: 360.0,
                                                child: Stack(
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final imageVar =
                                                            productDetailProductsRow
                                                                    ?.imagesUrl
                                                                    .toList() ??
                                                                [];

                                                        return SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 360.0,
                                                          child: Stack(
                                                            children: [
                                                              PageView.builder(
                                                                controller: _model
                                                                        .pageViewController2 ??=
                                                                    PageController(
                                                                        initialPage: max(
                                                                            0,
                                                                            min(0,
                                                                                imageVar.length - 1))),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    imageVar
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        imageVarIndex) {
                                                                  final imageVarItem =
                                                                      imageVar[
                                                                          imageVarIndex];
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          const Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          const Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        imageVarItem,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/9r58rfhytwms/image-placeholder-icon-5.jpeg',
                                                                      ),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          240.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: smooth_page_indicator
                                                                      .SmoothPageIndicator(
                                                                    controller: _model
                                                                            .pageViewController2 ??=
                                                                        PageController(
                                                                            initialPage:
                                                                                max(0, min(0, imageVar.length - 1))),
                                                                    count: imageVar
                                                                        .length,
                                                                    axisDirection:
                                                                        Axis.horizontal,
                                                                    onDotClicked:
                                                                        (i) async {
                                                                      await _model
                                                                          .pageViewController2!
                                                                          .animateToPage(
                                                                        i,
                                                                        duration:
                                                                            const Duration(milliseconds: 500),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    effect: smooth_page_indicator
                                                                        .SlideEffect(
                                                                      spacing:
                                                                          8.0,
                                                                      radius:
                                                                          16.0,
                                                                      dotWidth:
                                                                          8.0,
                                                                      dotHeight:
                                                                          8.0,
                                                                      dotColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .lightBlack,
                                                                      activeDotColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      paintStyle:
                                                                          PaintingStyle
                                                                              .fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    20.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .productFavToggleModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ProductFavToggleWidget(
                                                            productId: widget
                                                                .productId!,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    productDetailProductsRow
                                                                        ?.name,
                                                                arText: productDetailProductsRow?.nameArabic !=
                                                                            null &&
                                                                        productDetailProductsRow?.nameArabic !=
                                                                            ''
                                                                    ? productDetailProductsRow
                                                                        ?.nameArabic
                                                                    : productDetailProductsRow
                                                                        ?.name,
                                                                faText: productDetailProductsRow?.nameKurdish !=
                                                                            null &&
                                                                        productDetailProductsRow?.nameKurdish !=
                                                                            ''
                                                                    ? productDetailProductsRow
                                                                        ?.nameKurdish
                                                                    : productDetailProductsRow
                                                                        ?.name,
                                                              ),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            functions.applyCorrectNumberFormatting(
                                                                (productDetailProductsRow!
                                                                        .discountedPrice!) *
                                                                    FFAppState()
                                                                        .country
                                                                        .currencyExchangeRate,
                                                                FFAppState()
                                                                    .country
                                                                    .currencyCode,
                                                                FFAppConstants
                                                                    .useCurrencySymbol,
                                                                true),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily),
                                                                ),
                                                          ),
                                                          if (productDetailProductsRow
                                                                  .discountPercent! >
                                                              0.0)
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  '${valueOrDefault<String>(
                                                                    formatNumber(
                                                                      productDetailProductsRow
                                                                          .discountPercent,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '###.0',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                    '0',
                                                                  )}% OFF',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  functions.applyCorrectNumberFormatting(
                                                                      (productDetailProductsRow
                                                                              .price!) *
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
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      if ((productDetailProductsRow
                                                                  .reviewRate !=
                                                              null) &&
                                                          (productDetailProductsRow
                                                                  .reviewRate !=
                                                              0.0))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RatingBarIndicator(
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                  ),
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  rating: productDetailProductsRow
                                                                      .reviewRate!,
                                                                  unratedColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .tfBg,
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      20.0,
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      productDetailProductsRow
                                                                          .reviewRate,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#.#',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '(${valueOrDefault<String>(
                                                                    formatNumber(
                                                                      productDetailProductsRow
                                                                          .numberOfReviews,
                                                                      formatType:
                                                                          FormatType
                                                                              .compact,
                                                                    ),
                                                                    '0',
                                                                  )})',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ],
                                                        ),
                                                    ].divide(
                                                        const SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                                if (false)
                                                  Container(
                                                    width: double.infinity,
                                                    height: 54.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Visibility(
                                                      visible:
                                                          _model.marketData !=
                                                              null,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '0gfc1ja9' /* Market */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .marketData
                                                                    ?.name,
                                                                'Market',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .marketTypeBadgeModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  MarketTypeBadgeWidget(
                                                                type:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .marketData
                                                                      ?.type,
                                                                  'Type',
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    if (productDetailProductsRow
                                                                .barcode !=
                                                            null &&
                                                        productDetailProductsRow
                                                                .barcode !=
                                                            '') {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Barcode: ${productDetailProductsRow.barcode}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      );
                                                    } else {
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ].divide(const SizedBox(height: 16.0)),
                                            ),
                                            if (false)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rzc0b1q4' /* Color: */,
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
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .colorItemsModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                ColorItemsWidget(
                                                              colors: FFAppState()
                                                                  .sampleProductproperties
                                                                  .colors,
                                                              initialColor:
                                                                  FFAppState()
                                                                      .sampleProductproperties
                                                                      .colors
                                                                      .first,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'khvf3jnc' /* Capacity: */,
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
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .capacitytemsModel1,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                CapacitytemsWidget(
                                                              options: FFAppState()
                                                                  .sampleProductproperties
                                                                  .capacities,
                                                              initalValue:
                                                                  FFAppState()
                                                                      .sampleProductproperties
                                                                      .capacities
                                                                      .first,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uq94dbua' /* Size: */,
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
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .capacitytemsModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                CapacitytemsWidget(
                                                              options: FFAppState()
                                                                  .sampleProductproperties
                                                                  .sizes,
                                                              initalValue:
                                                                  FFAppState()
                                                                      .sampleProductproperties
                                                                      .sizes
                                                                      .first,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 16.0)),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  // Description
                                                  // Detail
                                                  // Review
                                                  Container(
                                                    width: double.infinity,
                                                    height: 54.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Semantics(
                                                            label:
                                                                'Description Tab',
                                                            child: InkWell(
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
                                                                    'PRODUCT_DETAIL_Column_0hc30t49_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Column_update_page_state');
                                                                _model.activeTab =
                                                                    'Description';
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'gikaaf39' /* Description */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.activeTab == 'Description'
                                                                                ? FlutterFlowTheme.of(context).primaryText
                                                                                : FlutterFlowTheme.of(context).grayMiddle,
                                                                            FlutterFlowTheme.of(context).grayMiddle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width: 44.0,
                                                                    height: 3.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.activeTab ==
                                                                                'Description'
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          Semantics(
                                                            label: 'Review Tab',
                                                            child: InkWell(
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
                                                                    'PRODUCT_DETAIL_Column_ip1hbth6_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Column_update_page_state');
                                                                _model.activeTab =
                                                                    'Review';
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qfocognr' /* Reviews */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.activeTab == 'Review'
                                                                                ? FlutterFlowTheme.of(context).primaryText
                                                                                : FlutterFlowTheme.of(context).grayMiddle,
                                                                            FlutterFlowTheme.of(context).grayMiddle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width: 44.0,
                                                                    height: 3.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.activeTab ==
                                                                                'Review'
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 24.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.activeTab ==
                                                          'Description') {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                FFLocalizations.of(context).getVariableText(
                                                                                  enText: valueOrDefault<String>(
                                                                                    productDetailProductsRow.description,
                                                                                    '-',
                                                                                  ),
                                                                                  arText: valueOrDefault<String>(
                                                                                                productDetailProductsRow.descriptionArabic,
                                                                                                '-',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          productDetailProductsRow.descriptionArabic,
                                                                                          '-',
                                                                                        )
                                                                                      : valueOrDefault<String>(
                                                                                          productDetailProductsRow.description,
                                                                                          '-',
                                                                                        ),
                                                                                  faText: valueOrDefault<String>(
                                                                                                productDetailProductsRow.descriptionKurdish,
                                                                                                '-',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          productDetailProductsRow.descriptionKurdish,
                                                                                          '-',
                                                                                        )
                                                                                      : valueOrDefault<String>(
                                                                                          productDetailProductsRow.description,
                                                                                          '-',
                                                                                        ),
                                                                                ),
                                                                                '-',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                    lineHeight: 2.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'vigd3obx' /* Return Policy:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                        lineHeight: 2.0,
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
                                                                                  valueOrDefault<String>(
                                                                                    productDetailProductsRow.returnPolicy,
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                        lineHeight: 2.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(const SizedBox(height: 4.0)),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'f29zkzjt' /* Warranty:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                        lineHeight: 2.0,
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
                                                                                  valueOrDefault<String>(
                                                                                    productDetailProductsRow.warranty,
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                        lineHeight: 2.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(const SizedBox(height: 4.0)),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else if (_model
                                                              .activeTab ==
                                                          'Detail') {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '5xk4skg2' /* Fully Automatic Front Load Was... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                            lineHeight:
                                                                                2.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'oglekf60' /* Details */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    lineHeight: 2.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ec6wpmyv' /* Brand */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'p2b88x52' /* Long Sleeves */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'lnjo09ib' /* Model Name */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '8v93r4kf' /* WW60R20GLMA/TL */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'klc4ij4d' /* Function Type */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'xrf4j8ck' /* Fully Automatic Front */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '5k7joq9l' /* Enerjgy Rating */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'dhlza4zf' /* 5 */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'i4o31blr' /* Washing Capacity */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '0u9u34v8' /* 6 kg */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '6g1mb4no' /* Washing Method */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '45qg3ty9' /* Tumble */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'bxquf0fm' /* Color */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'svrfh56f' /* White */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'usmawiyi' /* Water Level Selector */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'agl10mr3' /* Regular */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '4698k8sv' /* Shade */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ncgixqeg' /* White */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'baydwfvr' /* Technology Used */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'gtgwndlo' /* Yes */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'j08zo9wl' /* In-built Heater
 */
                                                                                          ,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ihlc05p9' /* Digital Inverter */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'jicswwsm' /* Warranty Summary */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'qv24etj2' /* 3 Years  */,
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).tfBg,
                                                                                ),
                                                                              ].divide(const SizedBox(height: 2.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      12.0)),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 24.0)),
                                                        );
                                                      } else if (_model
                                                              .activeTab ==
                                                          'Review') {
                                                        return FutureBuilder<
                                                            List<
                                                                ViewOrderProductRow>>(
                                                          future:
                                                              ViewOrderProductTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eq(
                                                                  'order_product_product_id',
                                                                  widget
                                                                      .productId,
                                                                )
                                                                .eq(
                                                                  'order_user_id',
                                                                  currentUserUid,
                                                                ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const EmptyComponentWidget();
                                                            }
                                                            List<ViewOrderProductRow>
                                                                orderProductsViewOrderProductRowList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      ProductReviewsRow>>(
                                                                future:
                                                                    ProductReviewsTable()
                                                                        .queryRows(
                                                                  queryFn:
                                                                      (q) => q
                                                                          .eq(
                                                                            'product_id',
                                                                            widget.productId,
                                                                          )
                                                                          .eq(
                                                                            'status',
                                                                            ReviewStatus.Accepted.name,
                                                                          ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return const EmptyComponentWidget();
                                                                  }
                                                                  List<ProductReviewsRow>
                                                                      productReviewsProductReviewsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            UsersRow>>(
                                                                      future: UsersTable()
                                                                          .queryRows(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q.in_(
                                                                          'id',
                                                                          productReviewsProductReviewsRowList
                                                                              .map((e) => e.userSenderId)
                                                                              .withoutNulls
                                                                              .toList(),
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return const ShimmerReviewsWidget();
                                                                        }
                                                                        List<UsersRow>
                                                                            reviewingUsersUsersRowList =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '6cnzoi11' /* Ratings & Reviews */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        if (productReviewsProductReviewsRowList.length > 5)
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('PRODUCT_DETAIL_Container_1df3bakd_ON_TAP');
                                                                                              logFirebaseEvent('Container_navigate_to');

                                                                                              context.pushNamed(
                                                                                                'RatingsReviews',
                                                                                                queryParameters: {
                                                                                                  'product': serializeParam(
                                                                                                    productDetailProductsRow,
                                                                                                    ParamType.SupabaseRow,
                                                                                                  ),
                                                                                                  'marketId': serializeParam(
                                                                                                    widget.marketID,
                                                                                                    ParamType.int,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'j71dc4xr' /* View All */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if ((orderProductsViewOrderProductRowList.isNotEmpty) && (orderProductsViewOrderProductRowList.isNotEmpty)) {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Semantics(
                                                                                                label: 'Leave a review to the product',
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    logFirebaseEvent('PRODUCT_DETAIL_LEAVE_A_REVIEW_BTN_ON_TAP');
                                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                                    context.pushNamed(
                                                                                                      'FeedBack',
                                                                                                      queryParameters: {
                                                                                                        'product': serializeParam(
                                                                                                          productDetailProductsRow,
                                                                                                          ParamType.SupabaseRow,
                                                                                                        ),
                                                                                                        'marketId': serializeParam(
                                                                                                          _model.marketData?.id,
                                                                                                          ParamType.int,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                    'c3mufbxj' /* Leave a Review */,
                                                                                                  ),
                                                                                                  icon: const Icon(
                                                                                                    FFIcons.kstarFilled,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  options: FFButtonOptions(
                                                                                                    height: 48.0,
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                        ),
                                                                                                    elevation: 0.0,
                                                                                                    borderSide: const BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Container(
                                                                                          decoration: const BoxDecoration(),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                  wrapWithModel(
                                                                                    model: _model.reviewSummarySectionModel,
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: ReviewSummarySectionWidget(
                                                                                      product: productDetailProductsRow,
                                                                                      productReviews: productReviewsProductReviewsRowList,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(height: 16.0)),
                                                                              ),
                                                                              if (false)
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'mlcpxoet' /* Most Helpful */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: const CheckboxThemeData(
                                                                                              visualDensity: VisualDensity.compact,
                                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                            ),
                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          ),
                                                                                          child: CheckboxListTile(
                                                                                            value: _model.mostHelpfulCheckboxListTileValue ??= false,
                                                                                            onChanged: (newValue) async {
                                                                                              safeSetState(() => _model.mostHelpfulCheckboxListTileValue = newValue!);
                                                                                            },
                                                                                            title: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'o67vbor8' /* Only with photos */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                            checkColor: FlutterFlowTheme.of(context).info,
                                                                                            dense: true,
                                                                                            controlAffinity: ListTileControlAffinity.leading,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final review = productReviewsProductReviewsRowList.take(5).toList();

                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    primary: false,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: review.length,
                                                                                    itemBuilder: (context, reviewIndex) {
                                                                                      final reviewItem = review[reviewIndex];
                                                                                      return wrapWithModel(
                                                                                        model: _model.reviewBoxModels.getModel(
                                                                                          reviewItem.id.toString(),
                                                                                          reviewIndex,
                                                                                        ),
                                                                                        updateCallback: () => safeSetState(() {}),
                                                                                        child: ReviewBoxWidget(
                                                                                          key: Key(
                                                                                            'Keyelm_${reviewItem.id.toString()}',
                                                                                          ),
                                                                                          review: reviewItem,
                                                                                          user: reviewingUsersUsersRowList.where((e) => e.id == reviewItem.userSenderId).toList().first,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ].divide(const SizedBox(height: 16.0)),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return const Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [],
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  if (productDetailProductsRow
                                                          .subCategoryId !=
                                                      null)
                                                    FutureBuilder<
                                                        List<ProductsRow>>(
                                                      future: ProductsTable()
                                                          .queryRows(
                                                        queryFn: (q) => q
                                                            .eq(
                                                              'sub_category_id',
                                                              productDetailProductsRow
                                                                  .subCategoryId,
                                                            )
                                                            .neq(
                                                              'id',
                                                              productDetailProductsRow
                                                                  .id,
                                                            ),
                                                        limit: 5,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<ProductsRow>
                                                            relatedProductsAllProductsRowList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (relatedProductsAllProductsRowList.isNotEmpty) {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'tf1zvz8y' /* Related Products */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 270.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final relatedProduct = relatedProductsAllProductsRowList.toList();

                                                                                      return ListView.separated(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        itemCount: relatedProduct.length,
                                                                                        separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                                                                                        itemBuilder: (context, relatedProductIndex) {
                                                                                          final relatedProductItem = relatedProduct[relatedProductIndex];
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              wrapWithModel(
                                                                                                model: _model.productCardModels.getModel(
                                                                                                  relatedProductItem.id.toString(),
                                                                                                  relatedProductIndex,
                                                                                                ),
                                                                                                updateCallback: () => safeSetState(() {}),
                                                                                                child: ProductCardWidget(
                                                                                                  key: Key(
                                                                                                    'Keyur8_${relatedProductItem.id.toString()}',
                                                                                                  ),
                                                                                                  image: relatedProductItem.defaultImageUrl!,
                                                                                                  productName: FFLocalizations.of(context).getVariableText(
                                                                                                    enText: relatedProductItem.name,
                                                                                                    arText: relatedProductItem.nameArabic != null && relatedProductItem.nameArabic != '' ? relatedProductItem.nameArabic : relatedProductItem.name,
                                                                                                    faText: relatedProductItem.nameKurdish != null && relatedProductItem.nameKurdish != '' ? relatedProductItem.nameKurdish : relatedProductItem.name,
                                                                                                  ),
                                                                                                  price: relatedProductItem.price,
                                                                                                  discount: relatedProductItem.discountPercent,
                                                                                                  reviewRate: relatedProductItem.reviewRate,
                                                                                                  numberOfReviews: relatedProductItem.numberOfReviews,
                                                                                                  productId: relatedProductItem.id,
                                                                                                  marketID: widget.marketID,
                                                                                                  discountedPrice: relatedProductItem.discountedPrice,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 16.0)),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  FutureBuilder<
                                                      List<AdvertisingRow>>(
                                                    future: AdvertisingTable()
                                                        .queryRows(
                                                      queryFn: (q) => q
                                                          .eq(
                                                            'status',
                                                            'Active',
                                                          )
                                                          .contains(
                                                            'ads_place',
                                                            '{${AdvertisePlacesInMobileApp.ProductDetail.name}}',
                                                          ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<AdvertisingRow>
                                                          advertisingQueryAdvertisingRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (FFAppState().AppSettings.enableAdvertisement &&
                                                                FFAppState()
                                                                    .AppSettings
                                                                    .enableAdvertisementOnProductDetail &&
                                                                ((advertisingQueryAdvertisingRowList
                                                                        .isNotEmpty) &&
                                                                    (advertisingQueryAdvertisingRowList.isNotEmpty))) {
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'op1qfm50' /* Suggested Advertised Products */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: valueOrDefault<
                                                                          double>(
                                                                        advertisingQueryAdvertisingRowList.isNotEmpty
                                                                            ? 160.0
                                                                            : 0.0,
                                                                        160.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final advertisement =
                                                                                advertisingQueryAdvertisingRowList.toList();

                                                                            return CarouselSlider.builder(
                                                                              itemCount: advertisement.length,
                                                                              itemBuilder: (context, advertisementIndex, _) {
                                                                                final advertisementItem = advertisement[advertisementIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.advertiseBannerModels.getModel(
                                                                                    advertisementItem.id.toString(),
                                                                                    advertisementIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: AdvertiseBannerWidget(
                                                                                    key: Key(
                                                                                      'Keyqr8_${advertisementItem.id.toString()}',
                                                                                    ),
                                                                                    advertise: advertisementItem,
                                                                                    indexInList: advertisementIndex,
                                                                                    numberOfItems: advertisingQueryAdvertisingRowList.length,
                                                                                  ),
                                                                                );
                                                                              },
                                                                              carouselController: _model.carouselController ??= CarouselController(),
                                                                              options: CarouselOptions(
                                                                                initialPage: max(0, min(0, advertisement.length - 1)),
                                                                                viewportFraction: 1.0,
                                                                                disableCenter: true,
                                                                                enlargeCenterPage: true,
                                                                                enlargeFactor: 0.25,
                                                                                enableInfiniteScroll: false,
                                                                                scrollDirection: Axis.horizontal,
                                                                                autoPlay: true,
                                                                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                                                                autoPlayInterval: const Duration(milliseconds: (800 + 4000)),
                                                                                autoPlayCurve: Curves.linear,
                                                                                pauseAutoPlayInFiniteScroll: false,
                                                                                onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              );
                                                            } else {
                                                              return Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ]
                                              .divide(const SizedBox(height: 24.0))
                                              .addToStart(
                                                  const SizedBox(height: 16.0))
                                              .addToEnd(const SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        if (productDetailProductsRow
                                                .quantityInInventory! >
                                            0)
                                          Container(
                                            width: double.infinity,
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x14000000),
                                                  offset: Offset(
                                                    0.0,
                                                    -8.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  '${valueOrDefault<String>(
                                                                    _model
                                                                        .counterProductModel
                                                                        .counterNumber
                                                                        .toString(),
                                                                    '0',
                                                                  )} / ${functions.applyCorrectNumberFormatting((productDetailProductsRow.discountedPrice!) * FFAppState().country.currencyExchangeRate, FFAppState().country.currencyCode, FFAppConstants.useCurrencySymbol, false)}${FFAppConstants.defaultCurrencyCode}',
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (false)
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    functions.applyCorrectNumberFormatting(
                                                                        (productDetailProductsRow.discountedPrice!) *
                                                                            FFAppState()
                                                                                .country
                                                                                .currencyExchangeRate *
                                                                            _model
                                                                                .counterProductModel.counterNumber,
                                                                        FFAppState()
                                                                            .country
                                                                            .currencyCode,
                                                                        FFAppConstants
                                                                            .useCurrencySymbol,
                                                                        false),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFAppState()
                                                                        .country
                                                                        .currencyCode,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          fontSize:
                                                                              11.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        2.0)),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .counterProductModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          updateOnChange: true,
                                                          child:
                                                              CounterProductWidget(
                                                            initialNumber: _model
                                                                .numberOfItemsAdded,
                                                            maxNumber:
                                                                productDetailProductsRow
                                                                    .quantityInInventory,
                                                            minNumber: 1,
                                                            counterStep: 1,
                                                            height: 34.0,
                                                            removeIcon: Icon(
                                                              FFIcons.ktrash,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              size: 17.0,
                                                            ),
                                                            plusIcon: Icon(
                                                              FFIcons.kplus,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 17.0,
                                                            ),
                                                            plusAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PRODUCT_DETAIL_Container_wus2nsnf_CALLBA');
                                                              logFirebaseEvent(
                                                                  'CounterProduct_update_page_state');
                                                              _model.numberOfItemsAdded =
                                                                  _model.numberOfItemsAdded +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            removeAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PRODUCT_DETAIL_Container_wus2nsnf_CALLBA');
                                                              logFirebaseEvent(
                                                                  'CounterProduct_update_page_state');
                                                              _model.numberOfItemsAdded =
                                                                  _model.numberOfItemsAdded +
                                                                      -1;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Semantics(
                                                        label:
                                                            'Add product to cart',
                                                        child: FFButtonWidget(
                                                          onPressed: ((_model
                                                                          .counterProductModel
                                                                          .counterNumber ==
                                                                      0) ||
                                                                  ((FFAppState().Cart.products.where((e) => e.productId == widget.productId).toList().isNotEmpty
                                                                          ? FFAppState()
                                                                              .Cart
                                                                              .products
                                                                              .where((e) => e.productId == widget.productId)
                                                                              .toList()
                                                                              .first
                                                                              .quantity
                                                                          : 0) >=
                                                                      productDetailProductsRow.quantityInInventory!))
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'PRODUCT_DETAIL_PAGE_AddToCart_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'AddToCart_update_app_state');
                                                                  FFAppState()
                                                                      .updateCartStruct(
                                                                    (e) => e
                                                                      ..lastUpdates =
                                                                          getCurrentTimestamp,
                                                                  );
                                                                  if ((FFAppState()
                                                                              .Cart !=
                                                                          null) &&
                                                                      (FFAppState()
                                                                              .Cart
                                                                              .products.isNotEmpty)) {
                                                                    while (_model
                                                                            .cartProductCounter <
                                                                        FFAppState()
                                                                            .Cart
                                                                            .products
                                                                            .length) {
                                                                      if ((FFAppState().Cart.products[_model.cartProductCounter].productId ==
                                                                              widget
                                                                                  .productId) &&
                                                                          (FFAppState().Cart.products[_model.cartProductCounter].marketId ==
                                                                              _model.marketData?.id)) {
                                                                        logFirebaseEvent(
                                                                            'AddToCart_update_page_state');
                                                                        _model
                                                                            .updateCartProductsAtIndex(
                                                                          _model
                                                                              .cartProductCounter,
                                                                          (e) => e
                                                                            ..incrementQuantity(1),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'AddToCart_update_page_state');
                                                                        _model.isSameProductFound =
                                                                            true;
                                                                        break;
                                                                      }
                                                                      logFirebaseEvent(
                                                                          'AddToCart_update_page_state');
                                                                      _model.cartProductCounter =
                                                                          _model.cartProductCounter +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'AddToCart_update_page_state');
                                                                    _model.cartProductCounter =
                                                                        0;
                                                                    if (!_model
                                                                        .isSameProductFound) {
                                                                      logFirebaseEvent(
                                                                          'AddToCart_update_page_state');
                                                                      _model.addToCartProducts(
                                                                          CartProductStruct(
                                                                        productName:
                                                                            productDetailProductsRow.name,
                                                                        productDescription:
                                                                            productDetailProductsRow.description,
                                                                        price: productDetailProductsRow
                                                                            .price,
                                                                        isDiscounted:
                                                                            valueOrDefault<bool>(
                                                                          productDetailProductsRow.discountPercent! > 0.0
                                                                              ? true
                                                                              : false,
                                                                          false,
                                                                        ),
                                                                        discountPercent:
                                                                            productDetailProductsRow.discountPercent,
                                                                        quantity: _model
                                                                            .counterProductModel
                                                                            .counterNumber,
                                                                        image: productDetailProductsRow
                                                                            .defaultImageUrl,
                                                                        productId:
                                                                            widget.productId,
                                                                        businessId:
                                                                            productDetailProductsRow.businessId,
                                                                        deliveryMethodId:
                                                                            productDetailProductsRow.deliveryMethodId,
                                                                        marketId: _model
                                                                            .marketData
                                                                            ?.id,
                                                                        tax:
                                                                            0.0,
                                                                        weight:
                                                                            productDetailProductsRow.weight,
                                                                        size: productDetailProductsRow
                                                                            .size,
                                                                        priceSubTotal:
                                                                            (productDetailProductsRow.discountedPrice!) *
                                                                                _model.counterProductModel.counterNumber,
                                                                        deliveryMethodsAvailable:
                                                                            productDetailProductsRow.deliveryMethodsAvailableList,
                                                                        discountedPrice:
                                                                            productDetailProductsRow.discountedPrice,
                                                                      ));
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'AddToCart_update_page_state');
                                                                    _model.addToCartProducts(
                                                                        CartProductStruct(
                                                                      productName:
                                                                          productDetailProductsRow
                                                                              .name,
                                                                      productDescription:
                                                                          productDetailProductsRow
                                                                              .description,
                                                                      price: productDetailProductsRow
                                                                          .price,
                                                                      isDiscounted:
                                                                          valueOrDefault<
                                                                              bool>(
                                                                        productDetailProductsRow.discountPercent! >
                                                                                0.0
                                                                            ? true
                                                                            : false,
                                                                        false,
                                                                      ),
                                                                      discountPercent:
                                                                          productDetailProductsRow
                                                                              .discountPercent,
                                                                      quantity: _model
                                                                          .counterProductModel
                                                                          .counterNumber,
                                                                      image: productDetailProductsRow
                                                                          .defaultImageUrl,
                                                                      productId:
                                                                          widget
                                                                              .productId,
                                                                      businessId:
                                                                          productDetailProductsRow
                                                                              .businessId,
                                                                      deliveryMethodId:
                                                                          productDetailProductsRow
                                                                              .deliveryMethodId,
                                                                      marketId: _model
                                                                          .marketData
                                                                          ?.id,
                                                                      tax: 0.0,
                                                                      weight: productDetailProductsRow
                                                                          .weight,
                                                                      size: productDetailProductsRow
                                                                          .size,
                                                                      priceSubTotal: (productDetailProductsRow
                                                                              .discountedPrice!) *
                                                                          _model
                                                                              .counterProductModel
                                                                              .counterNumber,
                                                                      deliveryMethodsAvailable:
                                                                          productDetailProductsRow
                                                                              .deliveryMethodsAvailableList,
                                                                      discountedPrice:
                                                                          productDetailProductsRow
                                                                              .discountedPrice,
                                                                      quantityInInventory:
                                                                          productDetailProductsRow
                                                                              .quantityInInventory,
                                                                    ));
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'AddToCart_update_app_state');
                                                                  FFAppState()
                                                                      .updateCartStruct(
                                                                    (e) => e
                                                                      ..products = _model
                                                                          .cartProducts
                                                                          .toList(),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'AddToCart_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                InfoModalWidget(
                                                                              icon: Icon(
                                                                                FFIcons.kcircleCheckFilled,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 34.0,
                                                                              ),
                                                                              autoDismiss: true,
                                                                              title: FFLocalizations.of(context).getText(
                                                                                'foifxxua' /* Added! */,
                                                                              ),
                                                                              body: FFLocalizations.of(context).getText(
                                                                                'o90l5rna' /* Product is added to your cart. */,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  logFirebaseEvent(
                                                                      'AddToCart_navigate_back');
                                                                  context
                                                                      .safePop();
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'nqjp0yn7' /* ADD TO CART */,
                                                          ),
                                                          icon: Icon(
                                                            FFIcons.kplus,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 20.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 160.0,
                                                            height: 75.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      8.0),
                                                            ),
                                                            disabledColor:
                                                                const Color(
                                                                    0x7F191717),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        if (productDetailProductsRow
                                                .quantityInInventory! <=
                                            0)
                                          Container(
                                            width: double.infinity,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x14000000),
                                                  offset: Offset(
                                                    0.0,
                                                    -8.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'm101tp79' /* Sold Out */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
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
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.shimmerPageDetailModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const ShimmerPageDetailWidget(
                            showUpperSection: true,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
