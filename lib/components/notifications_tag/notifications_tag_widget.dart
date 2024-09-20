import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_tag_model.dart';
export 'notifications_tag_model.dart';

class NotificationsTagWidget extends StatefulWidget {
  const NotificationsTagWidget({
    super.key,
    String? tagName,
    required this.icon,
    Color? bgColor,
    String? activeTagInPage,
  })  : tagName = tagName ?? 'TagName',
        bgColor = bgColor ?? const Color(0xD9FFFFFF),
        activeTagInPage = activeTagInPage ?? 'ActiveTag';

  final String tagName;
  final Widget? icon;
  final Color bgColor;
  final String activeTagInPage;

  @override
  State<NotificationsTagWidget> createState() => _NotificationsTagWidgetState();
}

class _NotificationsTagWidgetState extends State<NotificationsTagWidget> {
  late NotificationsTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsTagModel());

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
        color: valueOrDefault<Color>(
          widget.tagName == widget.activeTagInPage
              ? widget.bgColor
              : Colors.transparent,
          Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: widget.bgColor,
                shape: BoxShape.circle,
              ),
              child: widget.icon!,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.tagName,
                    'TAG',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelSmallFamily,
                        color: valueOrDefault<Color>(
                          widget.tagName == widget.activeTagInPage
                              ? FlutterFlowTheme.of(context).white
                              : FlutterFlowTheme.of(context).primaryText,
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelSmallFamily),
                      ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
