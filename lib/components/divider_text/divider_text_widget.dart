import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'divider_text_model.dart';
export 'divider_text_model.dart';

class DividerTextWidget extends StatefulWidget {
  const DividerTextWidget({
    super.key,
    String? title,
    bool? titleInLeftSide,
  })  : title = title ?? '',
        titleInLeftSide = titleInLeftSide ?? false;

  final String title;
  final bool titleInLeftSide;

  @override
  State<DividerTextWidget> createState() => _DividerTextWidgetState();
}

class _DividerTextWidgetState extends State<DividerTextWidget> {
  late DividerTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DividerTextModel());

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
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!widget.titleInLeftSide)
            Expanded(
              child: Container(
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lightBlack,
                ),
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((widget.title != '') &&
                  !widget.titleInLeftSide)
                Container(
                  width: 16.0,
                  height: 1.0,
                  decoration: const BoxDecoration(),
                ),
              if (widget.title != '')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Container(
              height: 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lightBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
