import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_badge_model.dart';
export 'cart_badge_model.dart';

class CartBadgeWidget extends StatefulWidget {
  const CartBadgeWidget({
    super.key,
    this.backColor,
    Color? iconColor,
    bool? goToCartOnTap,
  })  : iconColor = iconColor ?? Colors.white,
        goToCartOnTap = goToCartOnTap ?? true;

  final Color? backColor;
  final Color iconColor;
  final bool goToCartOnTap;

  @override
  State<CartBadgeWidget> createState() => _CartBadgeWidgetState();
}

class _CartBadgeWidgetState extends State<CartBadgeWidget> {
  late CartBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartBadgeModel());

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
      label: 'Show cart details',
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('CART_BADGE_Container_qjtggfb5_ON_TAP');
          if (widget.goToCartOnTap) {
            logFirebaseEvent('Container_navigate_to');

            context.pushNamed('Cart');
          }
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                if (FFAppState().Cart.products.isEmpty)
                  Icon(
                    FFIcons.kshoppingBag,
                    color: widget.iconColor,
                    size: 25.0,
                  ),
                if (FFAppState().Cart.products.isNotEmpty)
                  Icon(
                    FFIcons.kshoppingBag,
                    color: widget.iconColor,
                    size: 25.0,
                  ),
                if (FFAppState().Cart.products.isNotEmpty)
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 2.0, 0.0),
                      child: ClipOval(
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().Cart.products.length.toString(),
                                '0',
                              ).maybeHandleOverflow(
                                maxChars: 2,
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
