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
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stars_model.dart';
export 'stars_model.dart';

class StarsWidget extends StatefulWidget {
  const StarsWidget({
    super.key,
    bool? showBackButton,
  }) : showBackButton = showBackButton ?? false;

  final bool showBackButton;

  @override
  State<StarsWidget> createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  late StarsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Stars'});
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            '1cxeu42f' /* Stars */,
                          ),
                          showBackButton: widget.showBackButton,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: true,
                          searchTableName: 'markets',
                          fieldsToReturnFromSearchTable:
                              'id, name, description, type, logo_url, status',
                          fieldsToSearchIn: 'name',
                          searchTitle: 'Stars',
                          preDefineSearch:
                              'type=${MarketType.Star.name},status=${MarketStatus.Active.name}',
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).tfBg,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'STARS_PAGE_MenChip_ON_TAP');
                                              if (_model.activeCategory !=
                                                  'Men') {
                                                logFirebaseEvent(
                                                    'MenChip_update_page_state');
                                                _model.activeCategory = 'Men';
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'MenChip_update_page_state');
                                                _model.activeCategory = 'All';
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.activeCategory == 'Men'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .tfBg,
                                                  FlutterFlowTheme.of(context)
                                                      .tfBg,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'k32zbmon' /* Men */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.activeCategory == 'Men'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                    Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        minWidth: 12.0,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Visibility(
                                                        visible: _model
                                                                .activeCategory ==
                                                            'Men',
                                                        child: Icon(
                                                          FFIcons
                                                              .kdismissDefault,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightBlack,
                                                          size: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'STARS_PAGE_WomenChip_ON_TAP');
                                              if (_model.activeCategory !=
                                                  'Women') {
                                                logFirebaseEvent(
                                                    'WomenChip_update_page_state');
                                                _model.activeCategory = 'Women';
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'WomenChip_update_page_state');
                                                _model.activeCategory = 'All';
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.activeCategory ==
                                                          'Women'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .tfBg,
                                                  FlutterFlowTheme.of(context)
                                                      .tfBg,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'l504u95w' /* Women */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.activeCategory ==
                                                                          'Women'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                    Container(
                                                      width: 12.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Visibility(
                                                        visible: _model
                                                                .activeCategory ==
                                                            'Women',
                                                        child: Icon(
                                                          FFIcons
                                                              .kdismissDefault,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightBlack,
                                                          size: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .addToStart(const SizedBox(width: 4.0))
                                            .addToEnd(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                    if (false)
                                      Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(context).tfBg,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'STARS_PAGE_Business_ON_TAP');
                                                logFirebaseEvent(
                                                    'Business_update_page_state');
                                                _model.activeCategory = 'All';
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '3ed2ruqb' /* All */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 32.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  _model.activeCategory == 'All'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .tfBg,
                                                  FlutterFlowTheme.of(context)
                                                      .tfBg,
                                                ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activeCategory ==
                                                                    'All'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'STARS_PAGE_Business_ON_TAP');
                                                logFirebaseEvent(
                                                    'Business_update_page_state');
                                                _model.activeCategory = 'Men';
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'zwop1v6n' /* Men */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 32.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  _model.activeCategory == 'Men'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .tfBg,
                                                  FlutterFlowTheme.of(context)
                                                      .tfBg,
                                                ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activeCategory ==
                                                                    'Men'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'STARS_PAGE_Brand_ON_TAP');
                                                logFirebaseEvent(
                                                    'Brand_update_page_state');
                                                _model.activeCategory = 'Women';
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'niha6r6n' /* Women */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 32.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  _model.activeCategory ==
                                                          'Women'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .tfBg,
                                                  FlutterFlowTheme.of(context)
                                                      .tfBg,
                                                ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activeCategory ==
                                                                    'Women'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ]
                                              .addToStart(const SizedBox(width: 4.0))
                                              .addToEnd(const SizedBox(width: 4.0)),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          FFAppState()
                                              .DataTypeEnums
                                              .marketTypes
                                              .influencer,
                                        )
                                        .in_(
                                          'gender',
                                          _model.activeCategory == 'All'
                                              ? Gender.values
                                                  .map((e) => e.name)
                                                  .toList()
                                              : functions
                                                  .convertSingleStringIntoListString(
                                                      _model.activeCategory),
                                        ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: LoaderBoxGridWidget(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: 8.0,
                                            shimmerColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            numberOfItems: 24,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MarketsRow>
                                        filteredGenderMarketsRowList =
                                        snapshot.data!;

                                    if (filteredGenderMarketsRowList.isEmpty) {
                                      return Center(
                                        child: EmptyStateWidget(
                                          title: 'Sorry!',
                                          message:
                                              'There is no available market in your area!',
                                          icon: Icon(
                                            FFIcons.kflower,
                                            color: FlutterFlowTheme.of(context)
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      crossAxisSpacing: 20.0,
                                      mainAxisSpacing: 20.0,
                                      itemCount:
                                          filteredGenderMarketsRowList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, filteredGenderIndex) {
                                        final filteredGenderMarketsRow =
                                            filteredGenderMarketsRowList[
                                                filteredGenderIndex];
                                        return MarketCoverCardWidget(
                                          key: Key(
                                              'Keyi79_${filteredGenderIndex}_of_${filteredGenderMarketsRowList.length}'),
                                          image:
                                              filteredGenderMarketsRow.logoUrl,
                                          name: valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  filteredGenderMarketsRow.name,
                                              arText: filteredGenderMarketsRow
                                                              .nameArabic !=
                                                          null &&
                                                      filteredGenderMarketsRow
                                                              .nameArabic !=
                                                          ''
                                                  ? filteredGenderMarketsRow
                                                      .nameArabic
                                                  : filteredGenderMarketsRow
                                                      .name,
                                              faText: filteredGenderMarketsRow
                                                              .nameKurdish !=
                                                          null &&
                                                      filteredGenderMarketsRow
                                                              .nameKurdish !=
                                                          ''
                                                  ? filteredGenderMarketsRow
                                                      .nameKurdish
                                                  : filteredGenderMarketsRow
                                                      .name,
                                            ),
                                            'Market Name',
                                          ),
                                          marketId: filteredGenderMarketsRow.id,
                                          widthImage: 100.0,
                                          heightImage: 120.0,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ]
                                .divide(const SizedBox(height: 16.0))
                                .addToEnd(const SizedBox(height: 100.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const NavBarWidget(
                      activePage: 'Stars',
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
