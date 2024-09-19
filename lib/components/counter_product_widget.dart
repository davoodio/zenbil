import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'counter_product_model.dart';
export 'counter_product_model.dart';

class CounterProductWidget extends StatefulWidget {
  const CounterProductWidget({
    super.key,
    int? initialNumber,
    int? maxNumber,
    int? minNumber,
    int? counterStep,
    double? height,
    this.plusAction,
    this.removeAction,
    required this.removeIcon,
    required this.plusIcon,
    double? borderRadius,
  })  : initialNumber = initialNumber ?? 0,
        maxNumber = maxNumber ?? 10,
        minNumber = minNumber ?? 0,
        counterStep = counterStep ?? 1,
        height = height ?? 40.0,
        borderRadius = borderRadius ?? 4.0;

  final int initialNumber;
  final int maxNumber;
  final int minNumber;
  final int counterStep;
  final double height;
  final Future Function()? plusAction;
  final Future Function()? removeAction;
  final Widget? removeIcon;
  final Widget? plusIcon;
  final double borderRadius;

  @override
  State<CounterProductWidget> createState() => _CounterProductWidgetState();
}

class _CounterProductWidgetState extends State<CounterProductWidget> {
  late CounterProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterProductModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COUNTER_PRODUCT_CounterProduct_ON_INIT_S');
      logFirebaseEvent('CounterProduct_update_component_state');
      _model.counterNumber = widget.initialNumber;
      safeSetState(() {});
    });

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
      height: widget.height + 4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          widget.borderRadius,
          0.0,
        )),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: widget.borderRadius,
            borderWidth: 1.0,
            buttonSize: widget.height,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            disabledIconColor: const Color(0x80FF5963),
            icon: widget.removeIcon!,
            onPressed: (_model.counterNumber == widget.minNumber)
                ? null
                : () async {
                    logFirebaseEvent('COUNTER_PRODUCT_COMP_reduce_ON_TAP');
                    logFirebaseEvent('reduce_execute_callback');
                    await widget.removeAction?.call();
                    logFirebaseEvent('reduce_wait__delay');
                    await Future.delayed(const Duration(milliseconds: 100));
                    logFirebaseEvent('reduce_update_component_state');
                    _model.counterNumber = widget.initialNumber;
                    _model.updatePage(() {});
                  },
          ),
          Container(
            height: widget.height,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    valueOrDefault<String>(
                      _model.counterNumber.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: valueOrDefault<double>(
                            widget.height >= 40.0 ? 20.0 : 16.0,
                            14.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: widget.borderRadius,
            borderWidth: 1.0,
            buttonSize: widget.height,
            fillColor: FlutterFlowTheme.of(context).primaryText,
            disabledIconColor: const Color(0x80FFFFFF),
            icon: widget.plusIcon!,
            onPressed: (_model.counterNumber == widget.maxNumber)
                ? null
                : () async {
                    logFirebaseEvent('COUNTER_PRODUCT_COMP_add_ON_TAP');
                    logFirebaseEvent('add_execute_callback');
                    await widget.plusAction?.call();
                    logFirebaseEvent('add_wait__delay');
                    await Future.delayed(const Duration(milliseconds: 100));
                    logFirebaseEvent('add_update_component_state');
                    _model.counterNumber = widget.initialNumber;
                    _model.updatePage(() {});
                  },
          ),
        ],
      ),
    );
  }
}
