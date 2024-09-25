import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_fav_toggle_model.dart';
export 'product_fav_toggle_model.dart';

class ProductFavToggleWidget extends StatefulWidget {
  const ProductFavToggleWidget({
    super.key,
    required this.productId,
    this.marketId,
  });

  final int? productId;
  final int? marketId;

  @override
  State<ProductFavToggleWidget> createState() => _ProductFavToggleWidgetState();
}

class _ProductFavToggleWidgetState extends State<ProductFavToggleWidget> {
  late ProductFavToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductFavToggleModel());

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

    return Semantics(
      label: 'Toggle to Add or remove favorite ',
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('PRODUCT_FAV_TOGGLE_Stack_zvj49ap7_ON_TAP');
          logFirebaseEvent('Stack_action_block');
          await action_blocks.likeProduct(
            context,
            productId: widget.productId,
            marketId: widget.marketId,
          );
        },
        child: SizedBox(
          width: 34.0,
          height: 34.0,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              if (!FFAppState().UserFavorites.contains(widget.productId))
                Icon(
                  Icons.favorite_border_sharp,
                  color: FlutterFlowTheme.of(context).grayMiddle,
                  size: 20.0,
                ),
              if (FFAppState().UserFavorites.contains(widget.productId))
                Icon(
                  Icons.favorite_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
