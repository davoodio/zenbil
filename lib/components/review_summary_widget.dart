import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'review_summary_model.dart';
export 'review_summary_model.dart';

class ReviewSummaryWidget extends StatefulWidget {
  const ReviewSummaryWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
    this.parameter9,
    this.parameter10,
    this.parameter11,
    this.parameter12,
    this.parameter13,
    this.parameter14,
  });

  final String? parameter1;
  final double? parameter2;
  final int? parameter3;
  final int? parameter4;
  final int? parameter5;
  final int? parameter6;
  final int? parameter7;
  final int? parameter8;
  final int? parameter9;
  final int? parameter10;
  final int? parameter11;
  final int? parameter12;
  final int? parameter13;
  final int? parameter14;

  @override
  State<ReviewSummaryWidget> createState() => _ReviewSummaryWidgetState();
}

class _ReviewSummaryWidgetState extends State<ReviewSummaryWidget> {
  late ReviewSummaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewSummaryModel());

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
                  if (widget!.parameter2 != 0.0)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            widget!.parameter1!,
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
                        rating: widget!.parameter2!,
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
                          '${widget!.parameter3?.toString()} Ratings & ${widget!.parameter4?.toString()} Reviews',
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
                              '5qr7sgqh' /* 5 */,
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
                          percent: ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!)) ==
                                  0
                              ? 0.0
                              : ((widget!.parameter5!) /
                                  ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!))),
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
                          widget!.parameter10!.toString(),
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
                              'm2d7sv1b' /* 4 */,
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
                          percent: ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!)) ==
                                  0
                              ? 0.0
                              : ((widget!.parameter6!) /
                                  ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!))),
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
                          widget!.parameter11!.toString(),
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
                              'gidysjdk' /* 3 */,
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
                          percent: ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!)) ==
                                  0
                              ? 0.0
                              : ((widget!.parameter7!) /
                                  ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!))),
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
                          widget!.parameter12!.toString(),
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
                              'q4nyfjsq' /* 2 */,
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
                          percent: ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!)) ==
                                  0
                              ? 0.0
                              : ((widget!.parameter8!) /
                                  ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!))),
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
                          widget!.parameter13!.toString(),
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
                              '1gq7tqfr' /* 1 */,
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
                          percent: ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!)) ==
                                  0
                              ? 0.0
                              : ((widget!.parameter9!) /
                                  ((widget!.parameter9!) +
                                      (widget!.parameter8!) +
                                      (widget!.parameter7!) +
                                      (widget!.parameter6!) +
                                      (widget!.parameter5!))),
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
                          widget!.parameter14!.toString(),
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
