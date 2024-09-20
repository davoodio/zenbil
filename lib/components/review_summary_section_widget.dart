import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'review_summary_section_model.dart';
export 'review_summary_section_model.dart';

class ReviewSummarySectionWidget extends StatefulWidget {
  const ReviewSummarySectionWidget({
    super.key,
    required this.product,
    required this.productReviews,
  });

  final ProductsRow? product;
  final List<ProductReviewsRow>? productReviews;

  @override
  State<ReviewSummarySectionWidget> createState() =>
      _ReviewSummarySectionWidgetState();
}

class _ReviewSummarySectionWidgetState
    extends State<ReviewSummarySectionWidget> {
  late ReviewSummarySectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewSummarySectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x25A2AAB8),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget!.product?.numberOfReviews != 0)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget!.product?.reviewRate,
                                formatType: FormatType.custom,
                                format: '#.#',
                                locale: '',
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        direction: Axis.horizontal,
                        rating: widget!.product!.reviewRate!,
                        unratedColor: FlutterFlowTheme.of(context).tfBg,
                        itemCount: 5,
                        itemSize: 16.0,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          '${widget!.productReviews?.length?.toString()} Ratings & ${widget!.productReviews?.where((e) => e.comment != null && e.comment != '').toList()?.length?.toString()} Reviews',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
            if (false)
              Container(
                width: 1.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lightBlack,
                ),
              ),
            if (false)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gno2ruga' /* 5 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Icon(
                          Icons.star_rate,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 12.0,
                        ),
                        LinearPercentIndicator(
                          percent: (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length) ==
                                  0
                              ? 0.0
                              : (widget!.productReviews!
                                      .where((e) => e.rate == 5)
                                      .toList()
                                      .length /
                                  (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length)),
                          width: 80.0,
                          lineHeight: 6.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).timeLine,
                          backgroundColor: FlutterFlowTheme.of(context).tfBg,
                          barRadius: Radius.circular(40.0),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.productReviews
                                ?.where((e) => e.rate == 5)
                                .toList()
                                ?.length
                                ?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 2.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '19o5pxwa' /* 4 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Icon(
                          Icons.star_rate,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 12.0,
                        ),
                        LinearPercentIndicator(
                          percent: (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length) ==
                                  0
                              ? 0.0
                              : (widget!.productReviews!
                                      .where((e) => e.rate == 4)
                                      .toList()
                                      .length /
                                  (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length)),
                          width: 80.0,
                          lineHeight: 6.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).timeLine,
                          backgroundColor: FlutterFlowTheme.of(context).tfBg,
                          barRadius: Radius.circular(40.0),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.productReviews
                                ?.where((e) => e.rate == 4)
                                .toList()
                                ?.length
                                ?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 2.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '3stis28j' /* 3 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Icon(
                          Icons.star_rate,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 12.0,
                        ),
                        LinearPercentIndicator(
                          percent: (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length) ==
                                  0
                              ? 0.0
                              : (widget!.productReviews!
                                      .where((e) => e.rate == 3)
                                      .toList()
                                      .length /
                                  (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length)),
                          width: 80.0,
                          lineHeight: 6.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor: FlutterFlowTheme.of(context).tfBg,
                          barRadius: Radius.circular(40.0),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.productReviews
                                ?.where((e) => e.rate == 3)
                                .toList()
                                ?.length
                                ?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 2.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'vk0ni0av' /* 2 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Icon(
                          Icons.star_rate,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 12.0,
                        ),
                        LinearPercentIndicator(
                          percent: (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length) ==
                                  0
                              ? 0.0
                              : (widget!.productReviews!
                                      .where((e) => e.rate == 2)
                                      .toList()
                                      .length /
                                  (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length)),
                          width: 80.0,
                          lineHeight: 6.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).googleBg,
                          backgroundColor: FlutterFlowTheme.of(context).tfBg,
                          barRadius: Radius.circular(40.0),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.productReviews
                                ?.where((e) => e.rate == 2)
                                .toList()
                                ?.length
                                ?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 2.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'vsqokq19' /* 1 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Icon(
                          Icons.star_rate,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 12.0,
                        ),
                        LinearPercentIndicator(
                          percent: (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length) ==
                                  0
                              ? 0.0
                              : (widget!.productReviews!
                                      .where((e) => e.rate == 1)
                                      .toList()
                                      .length /
                                  (widget!.productReviews!
                                          .where((e) => e.rate == 1)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 2)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 3)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 4)
                                          .toList()
                                          .length +
                                      widget!.productReviews!
                                          .where((e) => e.rate == 5)
                                          .toList()
                                          .length)),
                          width: 80.0,
                          lineHeight: 6.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).googleBg,
                          backgroundColor: FlutterFlowTheme.of(context).tfBg,
                          barRadius: Radius.circular(40.0),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.productReviews
                                ?.where((e) => e.rate == 1)
                                .toList()
                                ?.length
                                ?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 2.0)),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
