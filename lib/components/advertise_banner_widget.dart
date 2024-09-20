import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'advertise_banner_model.dart';
export 'advertise_banner_model.dart';

class AdvertiseBannerWidget extends StatefulWidget {
  const AdvertiseBannerWidget({
    super.key,
    required this.advertise,
    required this.indexInList,
    required this.numberOfItems,
  });

  final AdvertisingRow? advertise;
  final int? indexInList;
  final int? numberOfItems;

  @override
  State<AdvertiseBannerWidget> createState() => _AdvertiseBannerWidgetState();
}

class _AdvertiseBannerWidgetState extends State<AdvertiseBannerWidget> {
  late AdvertiseBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvertiseBannerModel());

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
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 500),
            imageUrl: widget.advertise!.bannerUrl!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 4.0),
            child: Container(
              width: 36.0,
              height: 22.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).appleBg,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Text(
                    '${((widget.indexInList!) + 1).toString()}/${widget.numberOfItems?.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                          lineHeight: 1.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
