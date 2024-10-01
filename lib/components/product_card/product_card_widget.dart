import '/components/product_fav_toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.image,
    this.productName,
    double? price,
    double? discount,
    double? reviewRate,
    int? numberOfReviews,
    required this.productId,
    int? marketID,
    this.discountedPrice,
    this.imagesUrl,
  })  : price = price ?? 320.0,
        discount = discount ?? 30.0,
        reviewRate = reviewRate ?? 0.0,
        numberOfReviews = numberOfReviews ?? 0,
        marketID = marketID ?? 0;

  final String? image;
  final String? productName;
  final double price;
  final double discount;
  final double reviewRate;
  final int numberOfReviews;
  final int? productId;
  final int marketID;
  final double? discountedPrice;
  final List<String>? imagesUrl;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late ProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('PRODUCT_CARD_Container_trv2tcv9_ON_TAP');
          logFirebaseEvent('Container_navigate_to');

          context.pushNamed(
            'ProductDetail',
            queryParameters: {
              'productId': serializeParam(
                widget.productId,
                ParamType.int,
              ),
              'marketID': serializeParam(
                widget.marketID,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: 180.0,
          height: 220.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!(widget.imagesUrl != null &&
                              (widget.imagesUrl)!.isNotEmpty) ||
                          (widget.imagesUrl?.length == 1))
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Container(
                            height: 120.0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl:
                                    functions.resizeImageForGivenWidthAndHeight(
                                        widget.image!,
                                        FFAppConstants.cardImageDefaultWidth,
                                        FFAppConstants.cardImageDefaultHeight),
                                width: double.infinity,
                                height: 120.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      if ((widget.imagesUrl != null &&
                              (widget.imagesUrl)!.isNotEmpty) &&
                          (widget.imagesUrl!.length > 1))
                        Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final imageVar =
                                  widget.imagesUrl?.toList() ?? [];

                              return Semantics(
                                label: 'Product images',
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 550.0,
                                  child: Stack(
                                    children: [
                                      PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(0,
                                                        imageVar.length - 1))),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: imageVar.length,
                                        itemBuilder: (context, imageVarIndex) {
                                          final imageVarItem =
                                              imageVar[imageVarIndex];
                                          return Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl: functions
                                                        .resizeImageForGivenWidthAndHeight(
                                                            imageVarItem,
                                                            FFAppConstants
                                                                .cardImageDefaultWidth,
                                                            FFAppConstants
                                                                .cardImageDefaultHeight),
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PRODUCT_CARD_Container_031h8yqu_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_page_view');
                                                      await _model
                                                          .pageViewController
                                                          ?.previousPage(
                                                        duration: const Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: double.infinity,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Icon(
                                                            FFIcons.kangleLeft,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayMiddle,
                                                            size: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PRODUCT_CARD_Container_yrqxkh7a_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_page_view');
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: const Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: double.infinity,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Icon(
                                                            FFIcons.kangleRight,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayMiddle,
                                                            size: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                                                    .pageViewController ??=
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
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    const Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .SlideEffect(
                                              spacing: 8.0,
                                              radius: 16.0,
                                              dotWidth: 4.0,
                                              dotHeight: 4.0,
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
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: wrapWithModel(
                      model: _model.productFavToggleModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: ProductFavToggleWidget(
                        productId: widget.productId!,
                        marketId: widget.marketID,
                      ),
                    ),
                  ),
                  if (widget.numberOfReviews > 0)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 14.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 2.0, 8.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                FFIcons.kstarFilled,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 12.0,
                              ),
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      widget.reviewRate,
                                      formatType: FormatType.custom,
                                      format: '#.#',
                                      locale: '',
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '(${valueOrDefault<String>(
                                    formatNumber(
                                      widget.numberOfReviews,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  )})',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              widget.productName,
                              'Samsung 4K LED Ultarafine Tv',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 4.0,
                            runSpacing: 4.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.center,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    functions.applyCorrectNumberFormatting(
                                        valueOrDefault<double>(
                                          (widget.discountedPrice!) *
                                              FFAppState()
                                                  .country
                                                  .currencyExchangeRate,
                                          0.0,
                                        ),
                                        FFAppState().country.currencyCode,
                                        FFAppConstants.useCurrencySymbol,
                                        false),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                  Text(
                                    FFAppConstants.defaultCurrencySymbol,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 1.0)),
                              ),
                              if (widget.discount > 0.0)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      functions.applyCorrectNumberFormatting(
                                          widget.price *
                                              FFAppState()
                                                  .country
                                                  .currencyExchangeRate,
                                          FFAppState().country.currencyCode,
                                          FFAppConstants.useCurrencySymbol,
                                          false),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Text(
                                      '-${valueOrDefault<String>(
                                        formatNumber(
                                          widget.discount,
                                          formatType: FormatType.custom,
                                          format: '###.0',
                                          locale: '',
                                        ),
                                        '0',
                                      )}%',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .timeLine,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 2.0)),
                                ),
                            ],
                          ),
                        ),
                      ].divide(const SizedBox(width: 2.0)),
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
