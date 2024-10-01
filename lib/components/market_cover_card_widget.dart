import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'market_cover_card_model.dart';
export 'market_cover_card_model.dart';

class MarketCoverCardWidget extends StatefulWidget {
  const MarketCoverCardWidget({
    super.key,
    String? image,
    required this.name,
    this.marketId,
    double? widthImage,
    double? heightImage,
    this.brandId,
  })  : image = image ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dashboard-ztguqr/assets/9r58rfhytwms/image-placeholder-icon-5.jpeg',
        widthImage = widthImage ?? 100.0,
        heightImage = heightImage ?? 120.0;

  final String image;
  final String? name;
  final int? marketId;
  final double widthImage;
  final double heightImage;
  final int? brandId;

  @override
  State<MarketCoverCardWidget> createState() => _MarketCoverCardWidgetState();
}

class _MarketCoverCardWidgetState extends State<MarketCoverCardWidget> {
  late MarketCoverCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketCoverCardModel());

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
      width: widget.widthImage,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('MARKET_COVER_CARD_Container_etdxts24_ON_');
              logFirebaseEvent('Container_navigate_to');

              context.pushNamed(
                'StoreFront',
                queryParameters: {
                  'marketID': serializeParam(
                    widget.marketId,
                    ParamType.int,
                  ),
                  'brandID': serializeParam(
                    widget.brandId,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: widget.widthImage,
                height: widget.heightImage,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? FlutterFlowTheme.of(context).white
                      : const Color(0x00000000),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 500),
                          fadeOutDuration: const Duration(milliseconds: 500),
                          imageUrl: functions.resizeImageForGivenWidthAndHeight(
                              valueOrDefault<String>(
                                widget.image,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/teams/Ng3pjnz11EXZuZaIgfKa/assets/9h1d3pusvgam/image_place_02.jpeg',
                              ),
                              FFAppConstants.cardImageDefaultWidth,
                              FFAppConstants.cardImageDefaultHeight),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.name,
                        'Market Name',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10.0,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
