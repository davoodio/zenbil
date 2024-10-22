import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_component_widget.dart';
import '/components/header/header_widget.dart';
import '/components/review_box_widget.dart';
import '/components/review_summary_section_widget.dart';
import '/components/shimmer_reviews_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ratings_reviews_model.dart';
export 'ratings_reviews_model.dart';

class RatingsReviewsWidget extends StatefulWidget {
  const RatingsReviewsWidget({
    super.key,
    required this.product,
    required this.marketId,
  });

  final ProductsRow? product;
  final int? marketId;

  @override
  State<RatingsReviewsWidget> createState() => _RatingsReviewsWidgetState();
}

class _RatingsReviewsWidgetState extends State<RatingsReviewsWidget> {
  late RatingsReviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingsReviewsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RatingsReviews'});
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
                            '91nvl6ii' /* Ratings & Reviews */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: false,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        widget.product?.name,
                                                    arText: widget.product
                                                                    ?.nameArabic !=
                                                                null &&
                                                            widget.product
                                                                    ?.nameArabic !=
                                                                ''
                                                        ? widget
                                                            .product?.nameArabic
                                                        : widget.product?.name,
                                                    faText: widget.product
                                                                    ?.nameKurdish !=
                                                                null &&
                                                            widget.product
                                                                    ?.nameKurdish !=
                                                                ''
                                                        ? widget.product
                                                            ?.nameKurdish
                                                        : widget.product?.name,
                                                  ),
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                '${formatNumber(
                                                  valueOrDefault<double>(
                                                        functions
                                                            .calculateDiscountedPriceWithQuantity(
                                                                widget.product!
                                                                    .price!,
                                                                1,
                                                                widget.product!
                                                                    .discountPercent!),
                                                        0.0,
                                                      ) *
                                                      FFAppState()
                                                          .country
                                                          .currencyExchangeRate,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                )} ${FFAppState().country.currencySymbol}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily),
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 5.0)),
                                          ),
                                          if (((widget.product?.reviewRate !=
                                                      null) &&
                                                  (widget.product
                                                          ?.reviewRate !=
                                                      0.0)) ||
                                              (widget.product!
                                                      .discountPercent! >
                                                  0.0))
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if ((widget.product
                                                                ?.reviewRate !=
                                                            null) &&
                                                        (widget.product
                                                                ?.reviewRate !=
                                                            0.0)) {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            rating: widget
                                                                .product!
                                                                .reviewRate!,
                                                            unratedColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tfBg,
                                                            itemCount: 5,
                                                            itemSize: 20.0,
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                widget.product
                                                                    ?.reviewRate,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#.#',
                                                                locale: '',
                                                              ),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                          ),
                                                          Text(
                                                            '(${widget.product?.numberOfReviews?.toString()})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      );
                                                    } else {
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                      );
                                                    }
                                                  },
                                                ),
                                                if (widget.product!
                                                        .discountPercent! >
                                                    0.0)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '${widget.product?.discountPercent?.toString()}% OFF',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        '${((widget.product!.price!) * FFAppState().country.currencyExchangeRate).toString()} ${FFAppState().country.currencySymbol}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                              ],
                                            ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ),
                                    FutureBuilder<List<ViewOrderProductRow>>(
                                      future: ViewOrderProductTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'order_product_product_id',
                                              widget.product?.id,
                                            )
                                            .eq(
                                              'order_user_id',
                                              currentUserUid,
                                            ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const EmptyComponentWidget();
                                        }
                                        List<ViewOrderProductRow>
                                            orderProductsViewOrderProductRowList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: FutureBuilder<
                                              List<ProductReviewsRow>>(
                                            future:
                                                ProductReviewsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'product_id',
                                                    widget.product?.id,
                                                  )
                                                  .eq(
                                                    'status',
                                                    ReviewStatus.Accepted.name,
                                                  ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const EmptyComponentWidget();
                                              }
                                              List<ProductReviewsRow>
                                                  productReviewsProductReviewsRowList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: FutureBuilder<
                                                    List<UsersRow>>(
                                                  future:
                                                      UsersTable().queryRows(
                                                    queryFn: (q) => q.in_(
                                                      'id',
                                                      productReviewsProductReviewsRowList
                                                          .map((e) =>
                                                              e.userSenderId)
                                                          .withoutNulls
                                                          .toList(),
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return const ShimmerReviewsWidget();
                                                    }
                                                    List<UsersRow>
                                                        reviewingUsersUsersRowList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'qldrbdrx' /* Ratings & Reviews */,
                                                                        ),
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if ((orderProductsViewOrderProductRowList
                                                                          .isNotEmpty) &&
                                                                      (orderProductsViewOrderProductRowList.isNotEmpty)) {
                                                                    return Padding(
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
                                                                          Semantics(
                                                                            label:
                                                                                'Leave a review to the product',
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('RATINGS_REVIEWS_LEAVE_A_REVIEW_BTN_ON_TA');
                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                context.pushNamed(
                                                                                  'FeedBack',
                                                                                  queryParameters: {
                                                                                    'product': serializeParam(
                                                                                      widget.product,
                                                                                      ParamType.SupabaseRow,
                                                                                    ),
                                                                                    'marketId': serializeParam(
                                                                                      widget.marketId,
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '1q1dii4w' /* Leave a Review */,
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
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .reviewSummarySectionModel,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ReviewSummarySectionWidget(
                                                                  product: widget
                                                                      .product!,
                                                                  productReviews:
                                                                      productReviewsProductReviewsRowList,
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                          if (false)
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'h3bjl2p8' /* Most Helpful */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Theme(
                                                                        data:
                                                                            ThemeData(
                                                                          checkboxTheme:
                                                                              const CheckboxThemeData(
                                                                            visualDensity:
                                                                                VisualDensity.compact,
                                                                            materialTapTargetSize:
                                                                                MaterialTapTargetSize.shrinkWrap,
                                                                          ),
                                                                          unselectedWidgetColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: _model.mostHelpfulCheckboxListTileValue ??=
                                                                              false,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.mostHelpfulCheckboxListTileValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'vx64qejh' /* Only with photos */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          checkColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
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
                                                              final review =
                                                                  productReviewsProductReviewsRowList
                                                                      .toList();

                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    review
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        reviewIndex) {
                                                                  final reviewItem =
                                                                      review[
                                                                          reviewIndex];
                                                                  return wrapWithModel(
                                                                    model: _model
                                                                        .reviewBoxModels
                                                                        .getModel(
                                                                      reviewItem
                                                                          .id
                                                                          .toString(),
                                                                      reviewIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ReviewBoxWidget(
                                                                      key: Key(
                                                                        'Keyr4l_${reviewItem.id.toString()}',
                                                                      ),
                                                                      review:
                                                                          reviewItem,
                                                                      user: reviewingUsersUsersRowList
                                                                          .where((e) =>
                                                                              e.id ==
                                                                              reviewItem.userSenderId)
                                                                          .toList()
                                                                          .first,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 24.0))
                                      .addToStart(const SizedBox(height: 24.0))
                                      .addToEnd(const SizedBox(height: 24.0)),
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
