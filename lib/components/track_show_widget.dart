import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'track_show_model.dart';
export 'track_show_model.dart';

class TrackShowWidget extends StatefulWidget {
  const TrackShowWidget({
    super.key,
    this.titleIcon,
    Color? color,
  }) : this.color = color ?? const Color(0xFFBAD3FB);

  final Widget? titleIcon;
  final Color color;

  @override
  State<TrackShowWidget> createState() => _TrackShowWidgetState();
}

class _TrackShowWidgetState extends State<TrackShowWidget> {
  late TrackShowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackShowModel());

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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget!.titleIcon!,
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Icon(
                FFIcons.kcircleCheckFilled,
                color: widget!.color,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
