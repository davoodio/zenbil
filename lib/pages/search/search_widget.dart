import '/components/category_search_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/market_search_widget.dart';
import '/components/product_search_widget.dart';
import '/components/search_shell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.tableName,
    required this.fieldsToReturnFromTable,
    required this.fieldsToSearchIn,
    required this.searchTitle,
    required this.preDefineSearch,
  });

  final String? tableName;
  final String? fieldsToReturnFromTable;
  final String? fieldsToSearchIn;
  final String? searchTitle;
  final String? preDefineSearch;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Search'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            '3aze63c9' /* Search */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: false,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.searchShellModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: SearchShellWidget(
                                        tableName: widget!.tableName!,
                                        fieldsToReturnFromTable:
                                            widget!.fieldsToReturnFromTable!,
                                        fieldsToSearchIn:
                                            widget!.fieldsToSearchIn!,
                                        preDefineSearch:
                                            widget!.preDefineSearch,
                                        maxNumberOfResults: 100,
                                        autoCompleteOptions: _model
                                                    .searchShellModel.result !=
                                                null
                                            ? _model.searchShellModel.result
                                            : functions.returnEmptyJSONList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model
                                              .searchShellModel.hasResults)
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final searchResult = _model
                                                          .searchShellModel
                                                          .result
                                                          ?.toList() ??
                                                      [];

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      20.0,
                                                      0,
                                                      20.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        searchResult.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 16.0),
                                                    itemBuilder: (context,
                                                        searchResultIndex) {
                                                      final searchResultItem =
                                                          searchResult[
                                                              searchResultIndex];
                                                      return Builder(
                                                        builder: (context) {
                                                          if (widget!
                                                                  .tableName ==
                                                              'products') {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .productSearchModels1
                                                                    .getModel(
                                                                  getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  searchResultIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ProductSearchWidget(
                                                                  key: Key(
                                                                    'Keyosa_${getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.id''',
                                                                    ).toString()}',
                                                                  ),
                                                                  productName:
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    arText: (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.name_arabic''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.name_arabic''',
                                                                                ) !=
                                                                                functions.convertStringToJSON('null')) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.name_arabic''',
                                                                                ) !=
                                                                                functions.convertStringToJSON(''))
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name_arabic''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                    faText: getJsonField(
                                                                              searchResultItem,
                                                                              r'''$.name_kurdish''',
                                                                            ) !=
                                                                            null
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name_kurdish''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                  ),
                                                                  productID:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  productDescription:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  productImage:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.default_image_url''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (widget!
                                                                  .tableName ==
                                                              'markets') {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .marketSearchModels
                                                                    .getModel(
                                                                  getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  searchResultIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    MarketSearchWidget(
                                                                  key: Key(
                                                                    'Keynoe_${getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.id''',
                                                                    ).toString()}',
                                                                  ),
                                                                  marketName:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  marketID:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  marketmage:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.logo_url''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (widget!
                                                                  .tableName ==
                                                              'view_market_product') {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .productSearchModels2
                                                                    .getModel(
                                                                  getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.market_product_product_id''',
                                                                  ).toString(),
                                                                  searchResultIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ProductSearchWidget(
                                                                  key: Key(
                                                                    'Keyovy_${getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.market_product_product_id''',
                                                                    ).toString()}',
                                                                  ),
                                                                  productName:
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.product_name''',
                                                                    ).toString(),
                                                                    arText: (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_arabic''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_arabic''',
                                                                                ) !=
                                                                                functions.convertStringToJSON('null')) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_arabic''',
                                                                                ) !=
                                                                                functions.convertStringToJSON(''))
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.product_name_arabic''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.product_name''',
                                                                          ).toString(),
                                                                    faText: (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_kurdish''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_kurdish''',
                                                                                ) !=
                                                                                functions.convertStringToJSON('null')) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_kurdish''',
                                                                                ) !=
                                                                                functions.convertStringToJSON(''))
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.product_name_kurdish''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.product_name''',
                                                                          ).toString(),
                                                                  ),
                                                                  productID:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.market_product_product_id''',
                                                                  ),
                                                                  productDescription:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.product_description''',
                                                                  ).toString(),
                                                                  productImage:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.product_default_image_url''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (widget!
                                                                  .tableName ==
                                                              'view_products_categories') {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .productSearchModels3
                                                                    .getModel(
                                                                  getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.product_id''',
                                                                  ).toString(),
                                                                  searchResultIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ProductSearchWidget(
                                                                  key: Key(
                                                                    'Keyhpa_${getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.product_id''',
                                                                    ).toString()}',
                                                                  ),
                                                                  productName:
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.product_name''',
                                                                    ).toString(),
                                                                    arText: ((getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_arabic''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_arabic''',
                                                                                ) !=
                                                                                functions.convertStringToJSON('null')) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_arabic''',
                                                                                ) !=
                                                                                functions.convertStringToJSON('')))
                                                                        .toString(),
                                                                    faText: (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_kurdish''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_kurdish''',
                                                                                ) !=
                                                                                functions.convertStringToJSON('null')) &&
                                                                            (getJsonField(
                                                                                  searchResultItem,
                                                                                  r'''$.product_name_kurdish''',
                                                                                ) !=
                                                                                functions.convertStringToJSON(''))
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.product_name_kurdish''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.product_name''',
                                                                          ).toString(),
                                                                  ),
                                                                  productID:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.product_id''',
                                                                  ),
                                                                  productDescription:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.product_description''',
                                                                  ).toString(),
                                                                  productImage:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.product_default_image_url''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (widget!
                                                                  .tableName ==
                                                              'brands') {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .brandSearchModels
                                                                    .getModel(
                                                                  getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  searchResultIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    MarketSearchWidget(
                                                                  key: Key(
                                                                    'Keynzt_${getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.id''',
                                                                    ).toString()}',
                                                                  ),
                                                                  marketName:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  marketID:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  marketmage:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.logo_url''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .categorySearchModels
                                                                    .getModel(
                                                                  getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  searchResultIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    CategorySearchWidget(
                                                                  key: Key(
                                                                    'Key21i_${getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.id''',
                                                                    ).toString()}',
                                                                  ),
                                                                  categoryName:
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        getJsonField(
                                                                      searchResultItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    arText: getJsonField(
                                                                              searchResultItem,
                                                                              r'''$.name_arabic''',
                                                                            ) !=
                                                                            null
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name_arabic''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                    faText: getJsonField(
                                                                              searchResultItem,
                                                                              r'''$.name_kurdish''',
                                                                            ) !=
                                                                            null
                                                                        ? getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name_kurdish''',
                                                                          ).toString()
                                                                        : getJsonField(
                                                                            searchResultItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                  ),
                                                                  categoryID:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  categoryDescription:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  categoryImage:
                                                                      getJsonField(
                                                                    searchResultItem,
                                                                    r'''$.image_url''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (!_model.searchShellModel
                                                  .hasResults &&
                                              !_model.searchShellModel
                                                  .successButNoResult)
                                            Expanded(
                                              child: wrapWithModel(
                                                model:
                                                    _model.emptyStateStartModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EmptyStateWidget(
                                                  title:
                                                      '${widget!.searchTitle}.',
                                                  message:
                                                      'Start search for ${widget!.searchTitle}',
                                                  icon: Icon(
                                                    FFIcons.ksearch,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightBlack,
                                                    size: 32.0,
                                                  ),
                                                  hasActionButton: false,
                                                  actionButtonText: '',
                                                  isRow: false,
                                                  actionButton: () async {},
                                                ),
                                              ),
                                            ),
                                          if (_model.searchShellModel
                                              .successButNoResult)
                                            Expanded(
                                              child: wrapWithModel(
                                                model: _model
                                                    .emptyStateNoResultModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EmptyStateWidget(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '97qd905t' /* Sorry. */,
                                                  ),
                                                  message: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    't277na8q' /* Your search has no results! */,
                                                  ),
                                                  icon: Icon(
                                                    FFIcons.ksearch,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightBlack,
                                                    size: 32.0,
                                                  ),
                                                  hasActionButton: false,
                                                  actionButtonText: '',
                                                  isRow: false,
                                                  actionButton: () async {},
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
