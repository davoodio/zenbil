import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brand_item_model.dart';
export 'brand_item_model.dart';

class BrandItemWidget extends StatefulWidget {
  const BrandItemWidget({
    super.key,
    this.photo,
    String? title,
    required this.brandId,
  }) : title = title ?? 'TITLE';

  final String? photo;
  final String title;
  final int? brandId;

  @override
  State<BrandItemWidget> createState() => _BrandItemWidgetState();
}

class _BrandItemWidgetState extends State<BrandItemWidget> {
  late BrandItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('BRAND_ITEM_Container_tyritnlf_ON_TAP');
        logFirebaseEvent('Container_navigate_to');

        context.pushNamed(
          'StoreFront',
          queryParameters: {
            'brandID': serializeParam(
              widget.brandId,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: 75.0,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageUrl: functions.resizeImageForGivenWidthAndHeight(
                        valueOrDefault<String>(
                          widget.photo,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/teams/Ng3pjnz11EXZuZaIgfKa/assets/9h1d3pusvgam/image_place_02.jpeg',
                        ),
                        FFAppConstants.cardImageDefaultWidth,
                        FFAppConstants.cardImageDefaultHeight),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                  ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
