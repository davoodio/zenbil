import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_media_item_model.dart';
export 'social_media_item_model.dart';

class SocialMediaItemWidget extends StatefulWidget {
  const SocialMediaItemWidget({
    super.key,
    this.type,
    this.url,
  });

  final String? type;
  final String? url;

  @override
  State<SocialMediaItemWidget> createState() => _SocialMediaItemWidgetState();
}

class _SocialMediaItemWidgetState extends State<SocialMediaItemWidget> {
  late SocialMediaItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialMediaItemModel());

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
        logFirebaseEvent('SOCIAL_MEDIA_ITEM_Container_69qnp8ia_ON_');
        logFirebaseEvent('Container_launch_u_r_l');
        await launchURL(widget!.url!);
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.facebookF,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
