import '/components/image_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'market_search_model.dart';
export 'market_search_model.dart';

class MarketSearchWidget extends StatefulWidget {
  const MarketSearchWidget({
    super.key,
    required this.marketName,
    required this.marketID,
    required this.marketmage,
  });

  final String? marketName;
  final int? marketID;
  final String? marketmage;

  @override
  State<MarketSearchWidget> createState() => _MarketSearchWidgetState();
}

class _MarketSearchWidgetState extends State<MarketSearchWidget> {
  late MarketSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketSearchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget!.marketID != null)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('MARKET_SEARCH_Container_h6e2t1yf_ON_TAP');
              logFirebaseEvent('Container_navigate_to');

              context.pushNamed(
                'StoreFront',
                queryParameters: {
                  'marketID': serializeParam(
                    widget!.marketID,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          width: 54.0,
                          height: 54.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: FlutterFlowTheme.of(context).boxShadow,
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: wrapWithModel(
                            model: _model.imageWidgetModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageWidgetWidget(
                              image: widget!.marketmage,
                              isExpamdable: false,
                              isAvatar: false,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.marketName,
                                      '-',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
