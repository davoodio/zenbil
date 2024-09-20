import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'share_badge_model.dart';
export 'share_badge_model.dart';

class ShareBadgeWidget extends StatefulWidget {
  const ShareBadgeWidget({
    super.key,
    this.backColor,
    Color? iconColor,
    required this.marketId,
  }) : iconColor = iconColor ?? Colors.white;

  final Color? backColor;
  final Color iconColor;
  final int? marketId;

  @override
  State<ShareBadgeWidget> createState() => _ShareBadgeWidgetState();
}

class _ShareBadgeWidgetState extends State<ShareBadgeWidget> {
  late ShareBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareBadgeModel());

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
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.backColor,
          FlutterFlowTheme.of(context).primaryBackground,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Semantics(
        label: 'Add or remove favorite ',
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Icon(
                FFIcons.kshareAndroid,
                color: widget.iconColor,
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
