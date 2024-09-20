import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choose_shipping_method_item_model.dart';
export 'choose_shipping_method_item_model.dart';

class ChooseShippingMethodItemWidget extends StatefulWidget {
  const ChooseShippingMethodItemWidget({
    super.key,
    String? title,
    this.icon,
    bool? isDefault,
  })  : title = title ?? 'TITLE',
        isDefault = isDefault ?? false;

  final String title;
  final Widget? icon;
  final bool isDefault;

  @override
  State<ChooseShippingMethodItemWidget> createState() =>
      _ChooseShippingMethodItemWidgetState();
}

class _ChooseShippingMethodItemWidgetState
    extends State<ChooseShippingMethodItemWidget> {
  late ChooseShippingMethodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseShippingMethodItemModel());

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
        color: FlutterFlowTheme.of(context).cartBg,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: widget.icon!,
                  ),
                  Text(
                    widget.title,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                  ),
                ].divide(const SizedBox(width: 20.0)),
              ),
            ),
            if (widget.isDefault)
              Icon(
                FFIcons.kcircleCheckFilled,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
