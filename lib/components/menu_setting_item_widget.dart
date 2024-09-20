import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_setting_item_model.dart';
export 'menu_setting_item_model.dart';

class MenuSettingItemWidget extends StatefulWidget {
  const MenuSettingItemWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.showArrow,
    Color? color,
  }) : this.color = color ?? const Color(0x19000000);

  final Widget? icon;
  final String? text;
  final bool? showArrow;
  final Color color;

  @override
  State<MenuSettingItemWidget> createState() => _MenuSettingItemWidgetState();
}

class _MenuSettingItemWidgetState extends State<MenuSettingItemWidget> {
  late MenuSettingItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuSettingItemModel());

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
      width: double.infinity,
      height: 48.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget!.icon!,
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget!.text,
                      'Menu Text',
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          color: widget!.color,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelLargeFamily),
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ),
          if (widget!.showArrow ?? true)
            Icon(
              Icons.keyboard_arrow_right,
              color: widget!.color,
              size: 22.0,
            ),
        ].divide(SizedBox(width: 8.0)),
      ),
    );
  }
}
