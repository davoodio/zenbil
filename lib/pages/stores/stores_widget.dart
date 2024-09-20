import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_box_grid/loader_box_grid_widget.dart';
import '/components/market_cover_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stores_model.dart';
export 'stores_model.dart';

class StoresWidget extends StatefulWidget {
  const StoresWidget({
    super.key,
    String? marketType,
    bool? showBackButton,
  })  : this.marketType = marketType ?? 'Business',
        this.showBackButton = showBackButton ?? false;

  final String marketType;
  final bool showBackButton;

  @override
  State<StoresWidget> createState() => _StoresWidgetState();
}

class _StoresWidgetState extends State<StoresWidget> {
  late StoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoresModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Stores'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STORES_PAGE_Stores_ON_INIT_STATE');
      logFirebaseEvent('Stores_update_page_state');
      _model.marketType = widget!.marketType;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                          title: () {
                            if (_model.marketType == MarketType.Brand.name) {
                              return FFLocalizations.of(context)
                                  .getVariableText(
                                enText: 'Brands',
                                arText: 'العلامات التجارية',
                                faText: 'برندها',
                              );
                            } else if (_model.isPage) {
                              return FFLocalizations.of(context)
                                  .getVariableText(
                                enText: 'Pages',
                                arText: 'الصفحات',
                                faText: 'صفحات',
                              );
                            } else {
                              return FFLocalizations.of(context)
                                  .getVariableText(
                                enText: 'Stores',
                                arText: 'متاجر',
                                faText: 'فروشگاه ها',
                              );
                            }
                          }(),
                          showBackButton: widget!.showBackButton,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: true,
                          searchTableName:
                              _model.marketType == MarketType.Brand.name
                                  ? 'brands'
                                  : 'markets',
                          fieldsToReturnFromSearchTable: _model.marketType ==
                                  MarketType.Brand.name
                              ? 'id, name, logo_url, status'
                              : 'id, name, description, type, logo_url, status, is_page',
                          fieldsToSearchIn: 'name',
                          searchTitle: () {
                            if (_model.marketType == MarketType.Brand.name) {
                              return FFLocalizations.of(context)
                                  .getVariableText(
                                enText: 'Brands',
                                arText: 'العلامات التجارية',
                                faText: 'برندها',
                              );
                            } else if (_model.isPage) {
                              return FFLocalizations.of(context)
                                  .getVariableText(
                                enText: 'Pages',
                                arText: 'الصفحات',
                                faText: 'صفحات',
                              );
                            } else {
                              return FFLocalizations.of(context)
                                  .getVariableText(
                                enText: 'Stores',
                                arText: 'متاجر',
                                faText: 'فروشگاه ها',
                              );
                            }
                          }(),
                          preDefineSearch: _model.marketType ==
                                  MarketType.Brand.name
                              ? 'status=${BrandStatus.Active.name}is_page=${_model.isPage.toString()}'
                              : 'status=${MarketStatus.Active.name},is_page=${_model.isPage.toString()},type=${_model.marketType}',
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tfBg,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'STORES_PAGE_Business_ON_TAP');
                                        logFirebaseEvent(
                                            'Business_update_page_state');
                                        _model.marketType = FFAppState()
                                            .DataTypeEnums
                                            .marketTypes
                                            .business;
                                        _model.isPage = false;
                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ojx6tkoy' /* Stores */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 32.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.marketType ==
                                                  FFAppState()
                                                      .DataTypeEnums
                                                      .marketTypes
                                                      .business
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .tfBg,
                                          FlutterFlowTheme.of(context).tfBg,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: valueOrDefault<Color>(
                                                _model.marketType ==
                                                        FFAppState()
                                                            .DataTypeEnums
                                                            .marketTypes
                                                            .business
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'STORES_PAGE_Brand_ON_TAP');
                                        logFirebaseEvent(
                                            'Brand_update_page_state');
                                        _model.marketType = FFAppState()
                                            .DataTypeEnums
                                            .marketTypes
                                            .brand;
                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'r729njxm' /* Brands */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 32.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.marketType ==
                                                  FFAppState()
                                                      .DataTypeEnums
                                                      .marketTypes
                                                      .brand
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .tfBg,
                                          FlutterFlowTheme.of(context).tfBg,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: valueOrDefault<Color>(
                                                _model.marketType ==
                                                        FFAppState()
                                                            .DataTypeEnums
                                                            .marketTypes
                                                            .brand
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    if (false)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'STORES_PAGE_Page_ON_TAP');
                                          logFirebaseEvent(
                                              'Page_update_page_state');
                                          _model.marketType =
                                              MarketType.Star.name;
                                          _model.isPage = true;
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '5nczj29i' /* Pages */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 32.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: valueOrDefault<Color>(
                                            _model.marketType ==
                                                    MarketType.Star.name
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .tfBg,
                                            FlutterFlowTheme.of(context).tfBg,
                                          ),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: valueOrDefault<Color>(
                                                  _model.marketType ==
                                                          MarketType.Star.name
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                  ]
                                      .addToStart(SizedBox(width: 4.0))
                                      .addToEnd(SizedBox(width: 4.0)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (_model.marketType ==
                                      MarketType.Brand.name) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: FutureBuilder<List<BrandsRow>>(
                                        future: BrandsTable().queryRows(
                                          queryFn: (q) => q.eq(
                                            'status',
                                            BrandStatus.Active.name,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: LoaderBoxGridWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius: 8.0,
                                                  shimmerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  numberOfItems: 24,
                                                ),
                                              ),
                                            );
                                          }
                                          List<BrandsRow>
                                              staggeredViewBrandsRowList =
                                              snapshot.data!;

                                          if (staggeredViewBrandsRowList
                                              .isEmpty) {
                                            return Center(
                                              child: EmptyStateWidget(
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'q2646ayz' /* Sorry! */,
                                                ),
                                                message:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'r1893h74' /* There is no available brand in... */,
                                                ),
                                                icon: Icon(
                                                  FFIcons.kflower,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightBlack,
                                                  size: 44.0,
                                                ),
                                                hasActionButton: false,
                                                isRow: false,
                                                actionButton: () async {},
                                              ),
                                            );
                                          }

                                          return MasonryGridView.builder(
                                            gridDelegate:
                                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                            ),
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            itemCount:
                                                staggeredViewBrandsRowList
                                                    .length,
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              100.0,
                                            ),
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, staggeredViewIndex) {
                                              final staggeredViewBrandsRow =
                                                  staggeredViewBrandsRowList[
                                                      staggeredViewIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .brandCoverCardModels
                                                    .getModel(
                                                  staggeredViewBrandsRow.id
                                                      .toString(),
                                                  staggeredViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MarketCoverCardWidget(
                                                  key: Key(
                                                    'Keyfsm_${staggeredViewBrandsRow.id.toString()}',
                                                  ),
                                                  image: staggeredViewBrandsRow
                                                      .logoUrl,
                                                  name: staggeredViewBrandsRow
                                                      .name!,
                                                  marketId: null,
                                                  widthImage: 100.0,
                                                  heightImage: 120.0,
                                                  brandId:
                                                      staggeredViewBrandsRow.id,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: FutureBuilder<List<MarketsRow>>(
                                        future: MarketsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'status',
                                                FFAppState()
                                                    .DataTypeEnums
                                                    .marketStatuses
                                                    .active,
                                              )
                                              .eq(
                                                'type',
                                                _model.marketType,
                                              )
                                              .eq(
                                                'is_page',
                                                _model.isPage,
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: LoaderBoxGridWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius: 8.0,
                                                  shimmerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  numberOfItems: 24,
                                                ),
                                              ),
                                            );
                                          }
                                          List<MarketsRow>
                                              staggeredViewMarketsRowList =
                                              snapshot.data!;

                                          if (staggeredViewMarketsRowList
                                              .isEmpty) {
                                            return Center(
                                              child: EmptyStateWidget(
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '1msumiqx' /* Sorry! */,
                                                ),
                                                message:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'm8lzvja7' /* There is no available market i... */,
                                                ),
                                                icon: Icon(
                                                  FFIcons.kflower,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightBlack,
                                                  size: 44.0,
                                                ),
                                                hasActionButton: false,
                                                isRow: false,
                                                actionButton: () async {},
                                              ),
                                            );
                                          }

                                          return MasonryGridView.builder(
                                            gridDelegate:
                                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                            ),
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            itemCount:
                                                staggeredViewMarketsRowList
                                                    .length,
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              100.0,
                                            ),
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, staggeredViewIndex) {
                                              final staggeredViewMarketsRow =
                                                  staggeredViewMarketsRowList[
                                                      staggeredViewIndex];
                                              return MarketCoverCardWidget(
                                                key: Key(
                                                    'Key6it_${staggeredViewIndex}_of_${staggeredViewMarketsRowList.length}'),
                                                image: staggeredViewMarketsRow
                                                    .logoUrl,
                                                name: valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        staggeredViewMarketsRow
                                                            .name,
                                                    arText: staggeredViewMarketsRow
                                                                    .nameArabic !=
                                                                null &&
                                                            staggeredViewMarketsRow
                                                                    .nameArabic !=
                                                                ''
                                                        ? staggeredViewMarketsRow
                                                            .nameArabic
                                                        : staggeredViewMarketsRow
                                                            .name,
                                                    faText: staggeredViewMarketsRow
                                                                    .nameKurdish !=
                                                                null &&
                                                            staggeredViewMarketsRow
                                                                    .nameKurdish !=
                                                                ''
                                                        ? staggeredViewMarketsRow
                                                            .nameKurdish
                                                        : staggeredViewMarketsRow
                                                            .name,
                                                  ),
                                                  'Market Name',
                                                ),
                                                marketId:
                                                    staggeredViewMarketsRow.id,
                                                widthImage: 100.0,
                                                heightImage: 120.0,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 16.0))
                              .addToStart(SizedBox(height: 16.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWidget(
                      activePage: FFLocalizations.of(context).getText(
                        'tih1eidp' /* Stores */,
                      ),
                    ),
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
