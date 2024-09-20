import '/components/image_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_search_model.dart';
export 'category_search_model.dart';

class CategorySearchWidget extends StatefulWidget {
  const CategorySearchWidget({
    super.key,
    required this.categoryName,
    required this.categoryID,
    required this.categoryDescription,
    required this.categoryImage,
  });

  final String? categoryName;
  final int? categoryID;
  final String? categoryDescription;
  final String? categoryImage;

  @override
  State<CategorySearchWidget> createState() => _CategorySearchWidgetState();
}

class _CategorySearchWidgetState extends State<CategorySearchWidget> {
  late CategorySearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorySearchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.categoryID != null)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('CATEGORY_SEARCH_Container_lnps9ayj_ON_TA');
              logFirebaseEvent('Container_navigate_to');

              context.pushNamed(
                'ProductsCategory',
                queryParameters: {
                  'categoryId': serializeParam(
                    widget.categoryID,
                    ParamType.int,
                  ),
                  'categoryTitle': serializeParam(
                    widget.categoryName,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          width: 54.0,
                          height: 54.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: FlutterFlowTheme.of(context).boxShadow,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: wrapWithModel(
                            model: _model.imageWidgetModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageWidgetWidget(
                              image: widget.categoryImage,
                              isExpamdable: false,
                              isAvatar: false,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.categoryName,
                                      '-',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                            Builder(
                              builder: (context) {
                                if ((widget.categoryDescription != null &&
                                        widget.categoryDescription != '') &&
                                    (widget.categoryDescription != 'null')) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.categoryDescription,
                                            '-',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: const BoxDecoration(),
                                  );
                                }
                              },
                            ),
                          ].divide(const SizedBox(height: 4.0)),
                        ),
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
