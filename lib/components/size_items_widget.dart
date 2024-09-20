import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'size_items_model.dart';
export 'size_items_model.dart';

class SizeItemsWidget extends StatefulWidget {
  const SizeItemsWidget({super.key});

  @override
  State<SizeItemsWidget> createState() => _SizeItemsWidgetState();
}

class _SizeItemsWidgetState extends State<SizeItemsWidget> {
  late SizeItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SizeItemsModel());

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

    return Builder(
      builder: (context) {
        final sizes = FFAppState().sampleProductproperties.sizes.toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(sizes.length, (sizesIndex) {
              final sizesItem = sizes[sizesIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SIZE_ITEMS_Container_xvdr0mqr_ON_TAP');
                  logFirebaseEvent('Container_update_component_state');
                  _model.sizeSelected = _model.sizeSelected ? false : true;
                  safeSetState(() {});
                },
                child: Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.sizeSelected
                          ? FlutterFlowTheme.of(context).tertiary
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        _model.sizeSelected
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).lightBlack,
                        FlutterFlowTheme.of(context).lightBlack,
                      ),
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          sizesItem,
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: valueOrDefault<Color>(
                                  _model.sizeSelected
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
                      ),
                    ],
                  ),
                ),
              );
            }).divide(SizedBox(width: 12.0)),
          ),
        );
      },
    );
  }
}
