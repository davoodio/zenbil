import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_item_new_model.dart';
export 'categories_item_new_model.dart';

class CategoriesItemNewWidget extends StatefulWidget {
  const CategoriesItemNewWidget({
    super.key,
    String? photo,
    String? title,
    required this.categoryId,
  })  : this.photo = photo ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shopping-express-wrb1ci/assets/8vh31waah1r6/Woman.png',
        this.title = title ?? 'TITLE';

  final String photo;
  final String title;
  final int? categoryId;

  @override
  State<CategoriesItemNewWidget> createState() =>
      _CategoriesItemNewWidgetState();
}

class _CategoriesItemNewWidgetState extends State<CategoriesItemNewWidget> {
  late CategoriesItemNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesItemNewModel());

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
        logFirebaseEvent('CATEGORIES_ITEM_NEW_Container_cbgqcojl_O');
        logFirebaseEvent('Container_navigate_to');

        context.pushNamed(
          'ProductsCategory',
          queryParameters: {
            'categoryId': serializeParam(
              widget!.categoryId,
              ParamType.int,
            ),
            'categoryTitle': serializeParam(
              widget!.title,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        widget!.title,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120.0,
                height: double.infinity,
                child: Stack(
                  children: [
                    if (widget!.photo != null && widget!.photo != '')
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget!.photo,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (widget!.photo == null || widget!.photo == '')
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.klayoutGrid,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 28.0,
                        ),
                      ),
                  ],
                ),
              ),
              Icon(
                FFIcons.kchevronRight,
                color: FlutterFlowTheme.of(context).alternate,
                size: 40.0,
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
