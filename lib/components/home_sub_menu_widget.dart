import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_sub_menu_model.dart';
export 'home_sub_menu_model.dart';

class HomeSubMenuWidget extends StatefulWidget {
  const HomeSubMenuWidget({
    super.key,
    required this.actionCallBack,
    required this.categories,
  });

  final Future Function(String? selectedItem)? actionCallBack;
  final List<String>? categories;

  @override
  State<HomeSubMenuWidget> createState() => _HomeSubMenuWidgetState();
}

class _HomeSubMenuWidgetState extends State<HomeSubMenuWidget> {
  late HomeSubMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSubMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 140.0,
          maxWidth: 240.0,
          maxHeight: 300.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 15.0,
              color: Color(0x11000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Builder(
            builder: (context) {
              final category = widget.categories!.toList();

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(category.length, (categoryIndex) {
                    final categoryItem = category[categoryIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'HOME_SUB_MENU_Container_5pcud88v_ON_TAP');
                        logFirebaseEvent('Container_execute_callback');
                        await widget.actionCallBack?.call(
                          categoryItem,
                        );
                        logFirebaseEvent('Container_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 34.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                categoryItem,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 1.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily),
                                    ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: FlutterFlowTheme.of(context).lightBlack,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
