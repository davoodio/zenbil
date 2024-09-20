import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'capacitytems_model.dart';
export 'capacitytems_model.dart';

class CapacitytemsWidget extends StatefulWidget {
  const CapacitytemsWidget({
    super.key,
    required this.options,
    required this.initalValue,
  });

  final List<String>? options;
  final String? initalValue;

  @override
  State<CapacitytemsWidget> createState() => _CapacitytemsWidgetState();
}

class _CapacitytemsWidgetState extends State<CapacitytemsWidget> {
  late CapacitytemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CapacitytemsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CAPACITYTEMS_Capacitytems_ON_INIT_STATE');
      logFirebaseEvent('Capacitytems_update_component_state');
      _model.itemSelected = widget.initalValue;
      _model.updatePage(() {});
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
    return Builder(
      builder: (context) {
        final options = widget.options!.toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(options.length, (optionsIndex) {
              final optionsItem = options[optionsIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CAPACITYTEMS_Container_ze9hc46m_ON_TAP');
                  logFirebaseEvent('Container_update_component_state');
                  _model.itemSelected = optionsItem;
                  _model.updatePage(() {});
                },
                child: Container(
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.itemSelected == optionsItem
                          ? FlutterFlowTheme.of(context).tertiary
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        _model.itemSelected == optionsItem
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).lightBlack,
                        FlutterFlowTheme.of(context).lightBlack,
                      ),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            optionsItem,
                            'Opt',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: valueOrDefault<Color>(
                                  _model.itemSelected == optionsItem
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).divide(const SizedBox(width: 12.0)).addToEnd(const SizedBox(width: 20.0)),
          ),
        );
      },
    );
  }
}
