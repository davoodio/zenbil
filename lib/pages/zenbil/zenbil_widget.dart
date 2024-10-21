import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/brand_item/brand_item_widget.dart';
import '/components/cart_badge_widget.dart';
import '/components/categories_item/categories_item_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/loaders/loader_box_grid/loader_box_grid_widget.dart';
import '/components/loaders/loader_box_row/loader_box_row_widget.dart';
import '/components/market_cover_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/notification_badge_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'zenbil_model.dart';
export 'zenbil_model.dart';

class ZenbilWidget extends StatefulWidget {
  const ZenbilWidget({super.key});

  @override
  State<ZenbilWidget> createState() => _ZenbilWidgetState();
}

class _ZenbilWidgetState extends State<ZenbilWidget> {
  late ZenbilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZenbilModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'zenbil'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ZENBIL_PAGE_zenbil_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('zenbil_wait__delay');
          await Future.delayed(const Duration(milliseconds: 1));
          logFirebaseEvent('zenbil_action_block');
          await _model.loadHomePageData(context);
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('zenbil_custom_action');
          await actions.oneSignalUpdateUserInfo(
            currentUserUid,
            currentUserEmail,
            currentPhoneNumber,
            FFLocalizations.of(context).languageCode,
            currentUserUid,
          );
        }),
      ]);
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (false)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                    child: Text(
                      valueOrDefault<String>(
                        FFAppConstants.BrandAppName,
                        'Zenbil',
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Montserrat'),
                          ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 500),
                      fadeOutDuration: const Duration(milliseconds: 500),
                      imageUrl: FFAppConstants.BrandLogo,
                      width: 90.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 44.0,
                      icon: Icon(
                        FFIcons.ksearch,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('ZENBIL_PAGE_search_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed(
                          'Search',
                          queryParameters: {
                            'tableName': serializeParam(
                              'products',
                              ParamType.String,
                            ),
                            'fieldsToReturnFromTable': serializeParam(
                              'id, name,description,price,default_image_url,name_arabic,name_kurdish,description_arabic,description_kurdish',
                              ParamType.String,
                            ),
                            'fieldsToSearchIn': serializeParam(
                              'name',
                              ParamType.String,
                            ),
                            'searchTitle': serializeParam(
                              'Products',
                              ParamType.String,
                            ),
                            'preDefineSearch': serializeParam(
                              'status=${ProductStatus.Available.name}',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      buttonSize: 44.0,
                      icon: Icon(
                        Icons.favorite_border_sharp,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ZENBIL_favorite_border_sharp_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('Favorites');
                      },
                    ),
                    if (false)
                      wrapWithModel(
                        model: _model.notificationBadgeModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NotificationBadgeWidget(
                          goToNotifOnClick: true,
                          backColor: const Color(0x00FFFFFF),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    wrapWithModel(
                      model: _model.cartBadgeModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CartBadgeWidget(
                        backColor: const Color(0x00FFFFFF),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        goToCartOnTap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
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
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 4.0),
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
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ZENBIL_PAGE_MenChip_ON_TAP');
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

                                                logFirebaseEvent(
                                                    'MenChip_action_block');
                                                await _model
                                                    .loadHomePageData(context);
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    _model.activeCategory ==
                                                            'Men'
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
                                                          '033rwxmc' /* Men */,
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
                                                                            'Men'
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryBackground
                                                                        : FlutterFlowTheme.of(context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ZENBIL_PAGE_WomenChip_ON_TAP');
                                                if (_model.activeCategory !=
                                                    'Women') {
                                                  logFirebaseEvent(
                                                      'WomenChip_update_page_state');
                                                  _model.activeCategory =
                                                      'Women';
                                                  safeSetState(() {});
                                                } else {
                                                  logFirebaseEvent(
                                                      'WomenChip_update_page_state');
                                                  _model.activeCategory = 'All';
                                                  safeSetState(() {});
                                                }

                                                logFirebaseEvent(
                                                    'WomenChip_action_block');
                                                await _model
                                                    .loadHomePageData(context);
                                                safeSetState(() {});
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
                                                          'oibnflf2' /* Women */,
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
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryBackground
                                                                        : FlutterFlowTheme.of(context)
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
                                    ],
                                  ),
                                ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (FFAppState()
                                                  .AppSettings
                                                  .enableAdvertisement &&
                                              FFAppState()
                                                  .AppSettings
                                                  .enableAdvertisementOnHome) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: valueOrDefault<double>(
                                                  _model.advertisements.isNotEmpty
                                                      ? 160.0
                                                      : 0.0,
                                                  160.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final advertisement =
                                                          _model.advertisements
                                                              .toList();

                                                      return CarouselSlider
                                                          .builder(
                                                        itemCount: advertisement
                                                            .length,
                                                        itemBuilder: (context,
                                                            advertisementIndex,
                                                            _) {
                                                          final advertisementItem =
                                                              advertisement[
                                                                  advertisementIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ZENBIL_PAGE_Container_jad0a9wf_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'AdvertiseBanner_action_block');
                                                              await action_blocks
                                                                  .advertisementOnClick(
                                                                context,
                                                                advertisement:
                                                                    advertisementItem,
                                                              );
                                                            },
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .advertiseBannerModels
                                                                  .getModel(
                                                                advertisementItem
                                                                    .id
                                                                    .toString(),
                                                                advertisementIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  AdvertiseBannerWidget(
                                                                key: Key(
                                                                  'Keyjad_${advertisementItem.id.toString()}',
                                                                ),
                                                                advertise:
                                                                    advertisementItem,
                                                                indexInList:
                                                                    advertisementIndex,
                                                                numberOfItems:
                                                                    _model
                                                                        .advertisements
                                                                        .length,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        carouselController: _model
                                                                .carouselController ??=
                                                            CarouselController(),
                                                        options:
                                                            CarouselOptions(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  advertisement
                                                                          .length -
                                                                      1)),
                                                          viewportFraction: 1.0,
                                                          disableCenter: true,
                                                          enlargeCenterPage:
                                                              true,
                                                          enlargeFactor: 0.25,
                                                          enableInfiniteScroll:
                                                              false,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          autoPlay: true,
                                                          autoPlayAnimationDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                          autoPlayInterval:
                                                              const Duration(
                                                                  milliseconds:
                                                                      (800 +
                                                                          4000)),
                                                          autoPlayCurve:
                                                              Curves.linear,
                                                          pauseAutoPlayInFiniteScroll:
                                                              false,
                                                          onPageChanged: (index,
                                                                  _) =>
                                                              _model.carouselCurrentIndex =
                                                                  index,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              decoration: const BoxDecoration(),
                                            );
                                          }
                                        },
                                      ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mfu72il2' /* Stars */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        shadows: [
                                                          const Shadow(
                                                            color: Color(
                                                                0x2503080C),
                                                            offset: Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 6.0,
                                                          )
                                                        ],
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ZENBIL_PAGE_MenChip_ON_TAP');
                                                            if (_model
                                                                    .activeCategory !=
                                                                'Men') {
                                                              logFirebaseEvent(
                                                                  'MenChip_update_page_state');
                                                              _model.activeCategory =
                                                                  'Men';
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'MenChip_update_page_state');
                                                              _model.activeCategory =
                                                                  'All';
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            logFirebaseEvent(
                                                                'MenChip_action_block');
                                                            await _model
                                                                .loadHomePageData(
                                                                    context);
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            height: 28.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .activeCategory ==
                                                                      'Men'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : const Color(
                                                                      0x00E4E9EA),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '24e6d594' /* Men */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.activeCategory == 'Men'
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        const BoxConstraints(
                                                                      minWidth:
                                                                          12.0,
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: _model
                                                                              .activeCategory ==
                                                                          'Men',
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kdismissDefault,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightBlack,
                                                                          size:
                                                                              12.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ZENBIL_PAGE_WomenChip_ON_TAP');
                                                            if (_model
                                                                    .activeCategory !=
                                                                'Women') {
                                                              logFirebaseEvent(
                                                                  'WomenChip_update_page_state');
                                                              _model.activeCategory =
                                                                  'Women';
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'WomenChip_update_page_state');
                                                              _model.activeCategory =
                                                                  'All';
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            logFirebaseEvent(
                                                                'WomenChip_action_block');
                                                            await _model
                                                                .loadHomePageData(
                                                                    context);
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            height: 28.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .activeCategory ==
                                                                      'Women'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : const Color(
                                                                      0x00E4E9EA),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd1vjcn7u' /* Women */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.activeCategory == 'Women'
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        const BoxConstraints(
                                                                      minWidth:
                                                                          12.0,
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: _model
                                                                              .activeCategory ==
                                                                          'Women',
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kdismissDefault,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightBlack,
                                                                          size:
                                                                              12.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                          .addToStart(const SizedBox(
                                                              width: 4.0))
                                                          .addToEnd(const SizedBox(
                                                              width: 4.0)),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ZENBIL_PAGE_store_ON_TAP');
                                                        logFirebaseEvent(
                                                            'store_navigate_to');

                                                        context.pushNamed(
                                                          'Stars',
                                                          queryParameters: {
                                                            'showBackButton':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3t0fwcyu' /* See All */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(const SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: double.infinity,
                                          height: 160.0,
                                          decoration: const BoxDecoration(),
                                          child:
                                              FutureBuilder<List<MarketsRow>>(
                                            future: MarketsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'type',
                                                    FFAppState()
                                                        .DataTypeEnums
                                                        .marketTypes
                                                        .influencer,
                                                  )
                                                  .eq(
                                                    'status',
                                                    FFAppState()
                                                        .DataTypeEnums
                                                        .marketStatuses
                                                        .active,
                                                  )
                                                  .in_(
                                                    'gender',
                                                    _model.activeCategory ==
                                                            'All'
                                                        ? Gender.values
                                                            .map((e) => e.name)
                                                            .toList()
                                                        : functions
                                                            .convertSingleStringIntoListString(
                                                                _model
                                                                    .activeCategory!),
                                                  ),
                                              limit: 200,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 16.0,
                                                          20.0, 16.0),
                                                  child: SizedBox(
                                                    height: 160.0,
                                                    child: LoaderBoxRowWidget(
                                                      borderRadius: 8.0,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shimmerColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MarketsRow>
                                                  marketMarketsRowList =
                                                  snapshot.data!;

                                              if (marketMarketsRowList
                                                  .isEmpty) {
                                                return EmptyStateWidget(
                                                  message: 'No influencer.',
                                                  actionButton: () async {},
                                                );
                                              }

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    marketMarketsRowList.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 8.0),
                                                itemBuilder:
                                                    (context, marketIndex) {
                                                  final marketMarketsRow =
                                                      marketMarketsRowList[
                                                          marketIndex];
                                                  return MarketCoverCardWidget(
                                                    key: Key(
                                                        'Key48z_${marketIndex}_of_${marketMarketsRowList.length}'),
                                                    image: marketMarketsRow
                                                        .logoUrl,
                                                    name:
                                                        valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: marketMarketsRow
                                                            .name,
                                                        arText: marketMarketsRow
                                                                        .nameArabic !=
                                                                    null &&
                                                                marketMarketsRow
                                                                        .nameArabic !=
                                                                    ''
                                                            ? marketMarketsRow
                                                                .nameArabic
                                                            : marketMarketsRow
                                                                .name,
                                                        faText: marketMarketsRow
                                                                        .nameKurdish !=
                                                                    null &&
                                                                marketMarketsRow
                                                                        .nameKurdish !=
                                                                    ''
                                                            ? marketMarketsRow
                                                                .nameKurdish
                                                            : marketMarketsRow
                                                                .name,
                                                      ),
                                                      'Market Name',
                                                    ),
                                                    marketId:
                                                        marketMarketsRow.id,
                                                    widthImage: 100.0,
                                                    heightImage: 120.0,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      if (FFAppState()
                                          .AppSettings
                                          .brandsEnabledInApp)
                                        StickyHeader(
                                          overlapHeaders: false,
                                          header: Container(
                                            width: double.infinity,
                                            height: 54.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7dbwetzu' /* Brands */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            shadows: [
                                                              const Shadow(
                                                                color: Color(
                                                                    0x2503080C),
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                                blurRadius: 6.0,
                                                              )
                                                            ],
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallFamily),
                                                          ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ZENBIL_PAGE_Brand_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Brand_navigate_to');

                                                      context.pushNamed(
                                                        'Stores',
                                                        queryParameters: {
                                                          'marketType':
                                                              serializeParam(
                                                            MarketType
                                                                .Brand.name,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xa42l19t' /* See All */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          content: Container(
                                            height: 120.0,
                                            decoration: const BoxDecoration(),
                                            child:
                                                FutureBuilder<List<BrandsRow>>(
                                              future: BrandsTable().queryRows(
                                                queryFn: (q) => q.eq(
                                                  'status',
                                                  BrandStatus.Active.name,
                                                ),
                                                limit: 100,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                16.0,
                                                                20.0,
                                                                16.0),
                                                    child: LoaderBoxRowWidget(
                                                      borderRadius: 6.0,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shimmerColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  );
                                                }
                                                List<BrandsRow>
                                                    listViewBrandsRowList =
                                                    snapshot.data!;

                                                if (listViewBrandsRowList
                                                    .isEmpty) {
                                                  return EmptyStateWidget(
                                                    message: 'No brand.',
                                                    actionButton: () async {},
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: const EdgeInsets.fromLTRB(
                                                    20.0,
                                                    0,
                                                    20.0,
                                                    0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      listViewBrandsRowList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(width: 10.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewBrandsRow =
                                                        listViewBrandsRowList[
                                                            listViewIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .brandItemModels
                                                          .getModel(
                                                        listViewBrandsRow.id
                                                            .toString(),
                                                        listViewIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: BrandItemWidget(
                                                        key: Key(
                                                          'Keyk65_${listViewBrandsRow.id.toString()}',
                                                        ),
                                                        photo: listViewBrandsRow
                                                            .logoUrl,
                                                        title: listViewBrandsRow
                                                            .name,
                                                        brandId:
                                                            listViewBrandsRow
                                                                .id,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'p3fjqw7b' /* Most Popular */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          shadows: [
                                                            const Shadow(
                                                              color: Color(
                                                                  0x2503080C),
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 6.0,
                                                            )
                                                          ],
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'v7qqd2pj' /* See All */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: double.infinity,
                                          height: 230.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child:
                                              FutureBuilder<List<ProductsRow>>(
                                            future: ProductsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'status',
                                                    ProductStatus
                                                        .Available.name,
                                                  )
                                                  .gt(
                                                    'quantity_in_inventory',
                                                    0,
                                                  )
                                                  .order('like_count'),
                                              limit: 24,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    child: LoaderBoxRowWidget(
                                                      height: 220.0,
                                                      borderRadius: 4.0,
                                                      numberOfItems: 2,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProductsRow>
                                                  productPopularsProductsRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    productPopularsProductsRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 8.0),
                                                itemBuilder: (context,
                                                    productPopularsIndex) {
                                                  final productPopularsProductsRow =
                                                      productPopularsProductsRowList[
                                                          productPopularsIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ProductCardWidget(
                                                        key: Key(
                                                            'Keywwr_${productPopularsIndex}_of_${productPopularsProductsRowList.length}'),
                                                        image:
                                                            productPopularsProductsRow
                                                                .defaultImageUrl!,
                                                        productName:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              productPopularsProductsRow
                                                                  .name,
                                                          arText: productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameArabic
                                                              : productPopularsProductsRow
                                                                  .name,
                                                          faText: productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameKurdish
                                                              : productPopularsProductsRow
                                                                  .name,
                                                        ),
                                                        price:
                                                            productPopularsProductsRow
                                                                .price,
                                                        discount:
                                                            productPopularsProductsRow
                                                                .discountPercent,
                                                        reviewRate:
                                                            productPopularsProductsRow
                                                                .reviewRate,
                                                        numberOfReviews:
                                                            productPopularsProductsRow
                                                                .numberOfReviews,
                                                        productId:
                                                            productPopularsProductsRow
                                                                .id,
                                                        discountedPrice:
                                                            productPopularsProductsRow
                                                                .discountedPrice,
                                                        imagesUrl:
                                                            productPopularsProductsRow
                                                                .imagesUrl,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q2sbun81' /* Highest Reviews */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          shadows: [
                                                            const Shadow(
                                                              color: Color(
                                                                  0x2503080C),
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 6.0,
                                                            )
                                                          ],
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ahwsve40' /* See All */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: double.infinity,
                                          height: 230.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child:
                                              FutureBuilder<List<ProductsRow>>(
                                            future: ProductsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'status',
                                                    ProductStatus
                                                        .Available.name,
                                                  )
                                                  .gt(
                                                    'quantity_in_inventory',
                                                    0,
                                                  )
                                                  .order('number_of_reviews'),
                                              limit: 24,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    child: LoaderBoxRowWidget(
                                                      height: 220.0,
                                                      borderRadius: 4.0,
                                                      numberOfItems: 2,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProductsRow>
                                                  productPopularsProductsRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    productPopularsProductsRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 20.0),
                                                itemBuilder: (context,
                                                    productPopularsIndex) {
                                                  final productPopularsProductsRow =
                                                      productPopularsProductsRowList[
                                                          productPopularsIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ProductCardWidget(
                                                        key: Key(
                                                            'Keywbp_${productPopularsIndex}_of_${productPopularsProductsRowList.length}'),
                                                        image:
                                                            productPopularsProductsRow
                                                                .defaultImageUrl!,
                                                        productName:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              productPopularsProductsRow
                                                                  .name,
                                                          arText: productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameArabic
                                                              : productPopularsProductsRow
                                                                  .name,
                                                          faText: productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameKurdish
                                                              : productPopularsProductsRow
                                                                  .name,
                                                        ),
                                                        price:
                                                            productPopularsProductsRow
                                                                .price,
                                                        discount:
                                                            productPopularsProductsRow
                                                                .discountPercent,
                                                        reviewRate:
                                                            productPopularsProductsRow
                                                                .reviewRate,
                                                        numberOfReviews:
                                                            productPopularsProductsRow
                                                                .numberOfReviews,
                                                        productId:
                                                            productPopularsProductsRow
                                                                .id,
                                                        discountedPrice:
                                                            productPopularsProductsRow
                                                                .discountedPrice,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'gg46154e' /* Hot Sales */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          shadows: [
                                                            const Shadow(
                                                              color: Color(
                                                                  0x2503080C),
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 6.0,
                                                            )
                                                          ],
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'cxpwi9dt' /* See All */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: double.infinity,
                                          height: 230.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child:
                                              FutureBuilder<List<ProductsRow>>(
                                            future: ProductsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'status',
                                                    ProductStatus
                                                        .Available.name,
                                                  )
                                                  .gt(
                                                    'quantity_in_inventory',
                                                    0,
                                                  )
                                                  .order('buy_count'),
                                              limit: 24,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    child: LoaderBoxRowWidget(
                                                      height: 220.0,
                                                      borderRadius: 4.0,
                                                      numberOfItems: 2,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProductsRow>
                                                  productPopularsProductsRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    productPopularsProductsRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 20.0),
                                                itemBuilder: (context,
                                                    productPopularsIndex) {
                                                  final productPopularsProductsRow =
                                                      productPopularsProductsRowList[
                                                          productPopularsIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ProductCardWidget(
                                                        key: Key(
                                                            'Key5a7_${productPopularsIndex}_of_${productPopularsProductsRowList.length}'),
                                                        image:
                                                            productPopularsProductsRow
                                                                .defaultImageUrl!,
                                                        productName:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              productPopularsProductsRow
                                                                  .name,
                                                          arText: productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameArabic
                                                              : productPopularsProductsRow
                                                                  .name,
                                                          faText: productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameKurdish
                                                              : productPopularsProductsRow
                                                                  .name,
                                                        ),
                                                        price:
                                                            productPopularsProductsRow
                                                                .price,
                                                        discount:
                                                            productPopularsProductsRow
                                                                .discountPercent,
                                                        reviewRate:
                                                            productPopularsProductsRow
                                                                .reviewRate,
                                                        numberOfReviews:
                                                            productPopularsProductsRow
                                                                .numberOfReviews,
                                                        productId:
                                                            productPopularsProductsRow
                                                                .id,
                                                        discountedPrice:
                                                            productPopularsProductsRow
                                                                .discountedPrice,
                                                        imagesUrl:
                                                            productPopularsProductsRow
                                                                .imagesUrl,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'chwhgv7e' /* Categories */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          shadows: [
                                                            const Shadow(
                                                              color: Color(
                                                                  0x2503080C),
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 6.0,
                                                            )
                                                          ],
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'ZENBIL_PAGE_categorie_ON_TAP');
                                                    logFirebaseEvent(
                                                        'categorie_navigate_to');

                                                    context.pushNamed(
                                                      'Categories',
                                                      queryParameters: {
                                                        'showBackButton':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'a7326y4y' /* See All */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          height: 75.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final category = _model
                                                  .mainCategoriesRows
                                                  .toList();

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: category.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 10.0),
                                                itemBuilder:
                                                    (context, categoryIndex) {
                                                  final categoryItem =
                                                      category[categoryIndex];
                                                  return CategoriesItemWidget(
                                                    key: Key(
                                                        'Key3b9_${categoryIndex}_of_${category.length}'),
                                                    photo:
                                                        categoryItem.imageUrl,
                                                    title: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      enText: categoryItem.name,
                                                      arText: categoryItem
                                                                      .nameArabic !=
                                                                  null &&
                                                              categoryItem
                                                                      .nameArabic !=
                                                                  ''
                                                          ? categoryItem
                                                              .nameArabic
                                                          : categoryItem.name,
                                                      faText: categoryItem
                                                                      .nameKurdish !=
                                                                  null &&
                                                              categoryItem
                                                                      .nameKurdish !=
                                                                  ''
                                                          ? categoryItem
                                                              .nameKurdish
                                                          : categoryItem.name,
                                                    ),
                                                    categoryId: categoryItem.id,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'iqcmjes6' /* Trending Now */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          shadows: [
                                                            const Shadow(
                                                              color: Color(
                                                                  0x2503080C),
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 6.0,
                                                            )
                                                          ],
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'm53k5l6u' /* See All */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: double.infinity,
                                          height: 230.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child:
                                              FutureBuilder<List<ProductsRow>>(
                                            future: ProductsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'status',
                                                    ProductStatus
                                                        .Available.name,
                                                  )
                                                  .gt(
                                                    'quantity_in_inventory',
                                                    0,
                                                  )
                                                  .order('like_count'),
                                              limit: 24,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    child: LoaderBoxRowWidget(
                                                      height: 220.0,
                                                      borderRadius: 4.0,
                                                      numberOfItems: 2,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProductsRow>
                                                  productPopularsProductsRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    productPopularsProductsRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 20.0),
                                                itemBuilder: (context,
                                                    productPopularsIndex) {
                                                  final productPopularsProductsRow =
                                                      productPopularsProductsRowList[
                                                          productPopularsIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ProductCardWidget(
                                                        key: Key(
                                                            'Key5ss_${productPopularsIndex}_of_${productPopularsProductsRowList.length}'),
                                                        image:
                                                            productPopularsProductsRow
                                                                .defaultImageUrl!,
                                                        productName:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              productPopularsProductsRow
                                                                  .name,
                                                          arText: productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameArabic !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameArabic
                                                              : productPopularsProductsRow
                                                                  .name,
                                                          faText: productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      null &&
                                                                  productPopularsProductsRow
                                                                          .nameKurdish !=
                                                                      ''
                                                              ? productPopularsProductsRow
                                                                  .nameKurdish
                                                              : productPopularsProductsRow
                                                                  .name,
                                                        ),
                                                        price:
                                                            productPopularsProductsRow
                                                                .price,
                                                        discount:
                                                            productPopularsProductsRow
                                                                .discountPercent,
                                                        reviewRate:
                                                            productPopularsProductsRow
                                                                .reviewRate,
                                                        numberOfReviews:
                                                            productPopularsProductsRow
                                                                .numberOfReviews,
                                                        productId:
                                                            productPopularsProductsRow
                                                                .id,
                                                        discountedPrice:
                                                            productPopularsProductsRow
                                                                .discountedPrice,
                                                        imagesUrl:
                                                            productPopularsProductsRow
                                                                .imagesUrl,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          width: double.infinity,
                                          height: 54.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'goehe4sk' /* Stores */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          shadows: [
                                                            const Shadow(
                                                              color: Color(
                                                                  0x2503080C),
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 6.0,
                                                            )
                                                          ],
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'ZENBIL_PAGE_store_ON_TAP');
                                                    logFirebaseEvent(
                                                        'store_navigate_to');

                                                    context.pushNamed(
                                                      'Stores',
                                                      queryParameters: {
                                                        'marketType':
                                                            serializeParam(
                                                          FFAppState()
                                                              .DataTypeEnums
                                                              .marketTypes
                                                              .business,
                                                          ParamType.String,
                                                        ),
                                                        'showBackButton':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'i4x9uaem' /* See All */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: double.infinity,
                                          height: 160.0,
                                          decoration: const BoxDecoration(),
                                          child:
                                              FutureBuilder<List<MarketsRow>>(
                                            future: MarketsTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'type',
                                                    MarketType.Business.name,
                                                  )
                                                  .eq(
                                                    'status',
                                                    MarketStatus.Active.name,
                                                  ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 16.0,
                                                          20.0, 16.0),
                                                  child: SizedBox(
                                                    height: 160.0,
                                                    child: LoaderBoxRowWidget(
                                                      borderRadius: 8.0,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shimmerColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MarketsRow>
                                                  marketMarketsRowList =
                                                  snapshot.data!;

                                              if (marketMarketsRowList
                                                  .isEmpty) {
                                                return EmptyStateWidget(
                                                  message: 'No Store.',
                                                  actionButton: () async {},
                                                );
                                              }

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  0,
                                                  20.0,
                                                  0,
                                                ),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    marketMarketsRowList.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 8.0),
                                                itemBuilder:
                                                    (context, marketIndex) {
                                                  final marketMarketsRow =
                                                      marketMarketsRowList[
                                                          marketIndex];
                                                  return MarketCoverCardWidget(
                                                    key: Key(
                                                        'Key8ky_${marketIndex}_of_${marketMarketsRowList.length}'),
                                                    image: marketMarketsRow
                                                        .logoUrl,
                                                    name:
                                                        valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: marketMarketsRow
                                                            .name,
                                                        arText: marketMarketsRow
                                                                        .nameArabic !=
                                                                    null &&
                                                                marketMarketsRow
                                                                        .nameArabic !=
                                                                    ''
                                                            ? marketMarketsRow
                                                                .nameArabic
                                                            : marketMarketsRow
                                                                .name,
                                                        faText: marketMarketsRow
                                                                        .nameKurdish !=
                                                                    null &&
                                                                marketMarketsRow
                                                                        .nameKurdish !=
                                                                    ''
                                                            ? marketMarketsRow
                                                                .nameKurdish
                                                            : marketMarketsRow
                                                                .name,
                                                      ),
                                                      'Market Name',
                                                    ),
                                                    marketId:
                                                        marketMarketsRow.id,
                                                    widthImage: 100.0,
                                                    heightImage: 120.0,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: FutureBuilder<List<ProductsRow>>(
                                          future: ProductsTable().queryRows(
                                            queryFn: (q) => q
                                                .eq(
                                                  'status',
                                                  ProductStatus.Available.name,
                                                )
                                                .gt(
                                                  'quantity_in_inventory',
                                                  0,
                                                )
                                                .order('created_at'),
                                            limit: 100,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return LoaderBoxGridWidget(
                                                numberOfItems: 4,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: 8.0,
                                                shimmerColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              );
                                            }
                                            List<ProductsRow>
                                                staggeredViewProductsRowList =
                                                snapshot.data!;

                                            if (staggeredViewProductsRowList
                                                .isEmpty) {
                                              return EmptyStateWidget(
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4cfi842k' /* No favorites yet! */,
                                                ),
                                                message:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4tdvzv32' /* You can add a favorite product... */,
                                                ),
                                                actionButton: () async {},
                                              );
                                            }

                                            return MasonryGridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              itemCount:
                                                  staggeredViewProductsRowList
                                                      .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context,
                                                  staggeredViewIndex) {
                                                final staggeredViewProductsRow =
                                                    staggeredViewProductsRowList[
                                                        staggeredViewIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .productCardModels5
                                                      .getModel(
                                                    staggeredViewProductsRow.id
                                                        .toString(),
                                                    staggeredViewIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: ProductCardWidget(
                                                    key: Key(
                                                      'Keyki7_${staggeredViewProductsRow.id.toString()}',
                                                    ),
                                                    image:
                                                        staggeredViewProductsRow
                                                            .defaultImageUrl!,
                                                    productName:
                                                        staggeredViewProductsRow
                                                            .name,
                                                    price:
                                                        staggeredViewProductsRow
                                                            .price,
                                                    discount:
                                                        staggeredViewProductsRow
                                                            .discountPercent,
                                                    reviewRate:
                                                        staggeredViewProductsRow
                                                            .reviewRate,
                                                    numberOfReviews:
                                                        staggeredViewProductsRow
                                                            .numberOfReviews,
                                                    productId:
                                                        staggeredViewProductsRow
                                                            .id,
                                                    discountedPrice:
                                                        staggeredViewProductsRow
                                                            .discountedPrice,
                                                    imagesUrl:
                                                        staggeredViewProductsRow
                                                            .imagesUrl,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ]
                                        .addToStart(const SizedBox(height: 16.0))
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
                            updateOnChange: true,
                            child: const NavBarWidget(
                              activePage: FFAppConstants.BrandAppName,
                            ),
                          ),
                        ),
                      ],
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
