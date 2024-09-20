import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'market_type_badge_model.dart';
export 'market_type_badge_model.dart';

class MarketTypeBadgeWidget extends StatefulWidget {
  const MarketTypeBadgeWidget({
    super.key,
    this.type,
  });

  final String? type;

  @override
  State<MarketTypeBadgeWidget> createState() => _MarketTypeBadgeWidgetState();
}

class _MarketTypeBadgeWidgetState extends State<MarketTypeBadgeWidget> {
  late MarketTypeBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketTypeBadgeModel());

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
        color: FlutterFlowTheme.of(context).primaryText,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 3.0, 8.0, 3.0),
        child: Text(
          valueOrDefault<String>(
            widget.type,
            '-',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ),
    );
  }
}
