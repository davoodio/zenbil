import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_item_model.dart';
export 'categories_item_model.dart';

class CategoriesItemWidget extends StatefulWidget {
  const CategoriesItemWidget({
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
  State<CategoriesItemWidget> createState() => _CategoriesItemWidgetState();
}

class _CategoriesItemWidgetState extends State<CategoriesItemWidget> {
  late CategoriesItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesItemModel());

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
        logFirebaseEvent('CATEGORIES_ITEM_Container_lxq9hfl1_ON_TA');
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
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional(0.0, -1.0),
                children: [
                  if (widget!.photo != null && widget!.photo != '')
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: widget!.photo,
                        width: 50.0,
                        height: 35.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  if (widget!.photo == null || widget!.photo == '')
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Icon(
                        FFIcons.klayoutGrid,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 28.0,
                      ),
                    ),
                ],
              ),
              Expanded(
                child: AutoSizeText(
                  widget!.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 8.0,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyLargeFamily),
                      ),
                ),
              ),
            ].divide(SizedBox(height: 6.0)),
          ),
        ),
      ),
    );
  }
}
