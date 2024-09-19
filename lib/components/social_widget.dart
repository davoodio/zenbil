import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_model.dart';
export 'social_model.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({
    super.key,
    String? type,
    required this.url,
  }) : type = type ?? 'x';

  final String type;
  final String? url;

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  late SocialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialModel());

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
        logFirebaseEvent('SOCIAL_COMP_Container_boa4wkgu_ON_TAP');
        logFirebaseEvent('Container_launch_u_r_l');
        await launchURL(widget.url!);
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            if (widget.type == 'X')
              Icon(
                FFIcons.kx,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'YouTube')
              FaIcon(
                FontAwesomeIcons.youtube,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'Instagram')
              FaIcon(
                FontAwesomeIcons.instagram,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'TikTok')
              FaIcon(
                FontAwesomeIcons.tiktok,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'FaceBook')
              FaIcon(
                FontAwesomeIcons.facebookF,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'Linkedin')
              FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'WhatsApp')
              FaIcon(
                FontAwesomeIcons.whatsapp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'Reddit')
              FaIcon(
                FontAwesomeIcons.redditAlien,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'Telegram')
              FaIcon(
                FontAwesomeIcons.telegramPlane,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
            if (widget.type == 'Website')
              Icon(
                FFIcons.kglobe,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
          ],
        ),
      ),
    );
  }
}
