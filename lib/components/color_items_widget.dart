import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_items_model.dart';
export 'color_items_model.dart';

class ColorItemsWidget extends StatefulWidget {
  const ColorItemsWidget({
    super.key,
    required this.colors,
    required this.initialColor,
  });

  final List<String>? colors;
  final String? initialColor;

  @override
  State<ColorItemsWidget> createState() => _ColorItemsWidgetState();
}

class _ColorItemsWidgetState extends State<ColorItemsWidget> {
  late ColorItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorItemsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COLOR_ITEMS_ColorItems_ON_INIT_STATE');
      logFirebaseEvent('ColorItems_update_component_state');
      _model.colorSelected = widget!.initialColor;
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
        final colors = widget!.colors!.toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(colors.length, (colorsIndex) {
              final colorsItem = colors[colorsIndex];
              return Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('COLOR_ITEMS_Container_xv86xozz_ON_TAP');
                    logFirebaseEvent('Container_update_component_state');
                    _model.colorSelected = colorsItem;
                    _model.updatePage(() {});
                  },
                  child: Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: valueOrDefault<Color>(
                          _model.colorSelected == colorsItem
                              ? FlutterFlowTheme.of(context).tertiary
                              : FlutterFlowTheme.of(context).lightBlack,
                          FlutterFlowTheme.of(context).lightBlack,
                        ),
                        width: 2.0,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: colorFromCssString(
                              colorsItem,
                              defaultColor:
                                  FlutterFlowTheme.of(context).accent4,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Visibility(
                            visible: _model.colorSelected == colorsItem,
                            child: Icon(
                              FFIcons.kcheck,
                              color: FlutterFlowTheme.of(context).white,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).divide(SizedBox(width: 12.0)).addToEnd(SizedBox(width: 20.0)),
          ),
        );
      },
    );
  }
}
