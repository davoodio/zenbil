import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pick_how_to_pay_model.dart';
export 'pick_how_to_pay_model.dart';

class PickHowToPayWidget extends StatefulWidget {
  const PickHowToPayWidget({
    super.key,
    this.activeItem,
    required this.item,
    required this.onSelectedCallback,
  });

  final PaymentTypesRow? activeItem;
  final PaymentTypesRow? item;
  final Future Function()? onSelectedCallback;

  @override
  State<PickHowToPayWidget> createState() => _PickHowToPayWidgetState();
}

class _PickHowToPayWidgetState extends State<PickHowToPayWidget> {
  late PickHowToPayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickHowToPayModel());

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
        logFirebaseEvent('PICK_HOW_TO_PAY_DeliveryContainer_ON_TAP');
        logFirebaseEvent('DeliveryContainer_execute_callback');
        await widget.onSelectedCallback?.call();
      },
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.item?.name,
                    '-',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                ),
              ].divide(const SizedBox(width: 16.0)),
            ),
            Stack(
              children: [
                if (widget.item?.id == widget.activeItem?.id ? false : true)
                  Icon(
                    FFIcons.kcircle,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                if (widget.item?.id != widget.activeItem?.id ? false : true)
                  Icon(
                    FFIcons.kcircleCheck,
                    color: FlutterFlowTheme.of(context).success,
                    size: 24.0,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
