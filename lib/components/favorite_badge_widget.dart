import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_badge_model.dart';
export 'favorite_badge_model.dart';

class FavoriteBadgeWidget extends StatefulWidget {
  const FavoriteBadgeWidget({
    super.key,
    this.backColor,
    Color? iconColor,
    required this.productId,
    required this.marketId,
  }) : iconColor = iconColor ?? Colors.white;

  final Color? backColor;
  final Color iconColor;
  final int? productId;
  final int? marketId;

  @override
  State<FavoriteBadgeWidget> createState() => _FavoriteBadgeWidgetState();
}

class _FavoriteBadgeWidgetState extends State<FavoriteBadgeWidget> {
  late FavoriteBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteBadgeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('FAVORITE_BADGE_Container_l5v4ggsb_ON_TAP');
        logFirebaseEvent('Container_action_block');
        await action_blocks.likeProduct(
          context,
          productId: widget.productId,
          marketId: widget.marketId,
        );
      },
      child: Container(
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
                if (!FFAppState().UserFavorites.contains(widget.productId))
                  Icon(
                    Icons.favorite_border_sharp,
                    color: widget.iconColor,
                    size: 25.0,
                  ),
                if (FFAppState().UserFavorites.contains(widget.productId))
                  Icon(
                    Icons.favorite_outlined,
                    color: FlutterFlowTheme.of(context).liked,
                    size: 25.0,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
