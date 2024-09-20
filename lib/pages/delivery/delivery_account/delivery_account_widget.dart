import '/auth/supabase_auth/auth_util.dart';
import '/components/menu_setting_item_widget.dart';
import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/components/user_info_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'delivery_account_model.dart';
export 'delivery_account_model.dart';

class DeliveryAccountWidget extends StatefulWidget {
  const DeliveryAccountWidget({super.key});

  @override
  State<DeliveryAccountWidget> createState() => _DeliveryAccountWidgetState();
}

class _DeliveryAccountWidgetState extends State<DeliveryAccountWidget> {
  late DeliveryAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryAccountModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DeliveryAccount'});
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
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.userInfoCardModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: UserInfoCardWidget(
                                              currentUser:
                                                  FFAppState().CurrentUser,
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 16.0)),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DELIVERY_ACCOUNT_PAGE_support_ON_TAP');
                                              logFirebaseEvent(
                                                  'support_navigate_to');

                                              context.pushNamed('Support');
                                            },
                                            child: wrapWithModel(
                                              model: _model.supportModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MenuSettingItemWidget(
                                                icon: Icon(
                                                  FFIcons.kbrandHipchat,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 22.0,
                                                ),
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'uaybgmt2' /* Customer Support */,
                                                ),
                                                showArrow: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (!FFAppState().CurrentUser.isAnon)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DELIVERY_ACCOUNT_PAGE_editprofile_ON_TAP');
                                                logFirebaseEvent(
                                                    'editprofile_navigate_to');

                                                context.pushNamed(
                                                  'EditProfile',
                                                  queryParameters: {
                                                    'isOnBoarding':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.editprofileModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MenuSettingItemWidget(
                                                  icon: Icon(
                                                    FFIcons.kuserEdit,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'uusmmf1x' /* Edit Profile */,
                                                  ),
                                                  showArrow: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model.paymenmethodModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MenuSettingItemWidget(
                                                icon: Icon(
                                                  FFIcons.kcreditCard,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 22.0,
                                                ),
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'pyxffg8q' /* Payment Methods */,
                                                ),
                                                showArrow: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DELIVERY_ACCOUNT_NotifiationSetting_ON_T');
                                                logFirebaseEvent(
                                                    'NotifiationSetting_navigate_to');

                                                context.pushNamed(
                                                    'NotificatinSetting');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .notifiationSettingModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MenuSettingItemWidget(
                                                  icon: Icon(
                                                    FFIcons.knotification,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '9kc6rtvp' /* Notification Setting */,
                                                  ),
                                                  showArrow: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kmap,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'sn0el9uy' /* Country */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${FFAppState().country.name} ( ${FFAppState().country.currencySymbol} )',
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
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 22.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DELIVERY_ACCOUNT_LanguageContainer_ON_TA');
                                              logFirebaseEvent(
                                                  'LanguageContainer_navigate_to');

                                              context.pushNamed('Language');
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          FFIcons.klanguage,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mgczheqz' /* Language */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'g71uj0xb' /* English (US) */,
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
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .dark_mode_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'vljnxi2b' /* Dark Mode */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Switch.adaptive(
                                                  value: _model.switchValue ??=
                                                      Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.switchValue =
                                                            newValue);
                                                    if (newValue) {
                                                      logFirebaseEvent(
                                                          'DELIVERY_ACCOUNT_Switch_xnus0rnc_ON_TOGG');
                                                      logFirebaseEvent(
                                                          'Switch_set_dark_mode_settings');
                                                      setDarkModeSetting(
                                                          context,
                                                          ThemeMode.dark);
                                                    } else {
                                                      logFirebaseEvent(
                                                          'DELIVERY_ACCOUNT_Switch_xnus0rnc_ON_TOGG');
                                                      logFirebaseEvent(
                                                          'Switch_set_dark_mode_settings');
                                                      setDarkModeSetting(
                                                          context,
                                                          ThemeMode.light);
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DELIVERY_ACCOUNT_PAGE_Privac_ON_TAP');
                                              logFirebaseEvent(
                                                  'Privac_navigate_to');

                                              context.pushNamed('Privacy');
                                            },
                                            child: wrapWithModel(
                                              model: _model.privacModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MenuSettingItemWidget(
                                                icon: Icon(
                                                  FFIcons.klock,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 22.0,
                                                ),
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'f2eut7i0' /* Privacy Policy */,
                                                ),
                                                showArrow: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DELIVERY_ACCOUNT_PAGE_Help_ON_TAP');
                                              logFirebaseEvent(
                                                  'Help_navigate_to');

                                              context.pushNamed('HelpCenter');
                                            },
                                            child: wrapWithModel(
                                              model: _model.helpModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MenuSettingItemWidget(
                                                icon: Icon(
                                                  FFIcons.khelp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 22.0,
                                                ),
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ieilcjqs' /* Help Center */,
                                                ),
                                                showArrow: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DELIVERY_ACCOUNT_PAGE_Share_ON_TAP');
                                                logFirebaseEvent('Share_share');
                                                await Share.share(
                                                  '${FFAppConstants.BrandAppName}: ${FFAppConstants.BrandTagLine}  AppStore: ${FFAppConstants.AppStoreLink} PlayStore: ${FFAppConstants.PlayStoreLink}',
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.shareModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MenuSettingItemWidget(
                                                  icon: Icon(
                                                    FFIcons.kuserPlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ta3wf7mr' /* Share With Friends */,
                                                  ),
                                                  showArrow: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DELIVERY_ACCOUNT_Container_vnqb3r4i_ON_T');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.goNamed('zenbil');
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 64.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cartBg,
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model.shareModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: MenuSettingItemWidget(
                                                    icon: Icon(
                                                      FFIcons.kstar,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 22.0,
                                                    ),
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'xgzeu57x' /* Consumer Application */,
                                                    ),
                                                    showArrow: false,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (!FFAppState().CurrentUser.isAnon)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: InkWell(
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
                                                        'DELIVERY_ACCOUNT_PAGE_logout_ON_TAP');
                                                    logFirebaseEvent(
                                                        'logout_auth');
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signOut();
                                                    GoRouter.of(context)
                                                        .clearRedirectLocation();

                                                    context.goNamedAuth(
                                                        'Splash',
                                                        context.mounted);
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.logoutModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MenuSettingItemWidget(
                                                      icon: Icon(
                                                        FFIcons.kdoorExit,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 22.0,
                                                      ),
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9ax0bmyv' /* Logout */,
                                                      ),
                                                      showArrow: true,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          '${FFAppConstants.BrandAppName} ${FFAppConstants.appVersion}',
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
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
                                    ),
                                  ],
                                ),
                              ]
                                  .divide(const SizedBox(height: 24.0))
                                  .addToStart(const SizedBox(height: 24.0))
                                  .addToEnd(const SizedBox(height: 98.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarDeliveryModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: NavBarDeliveryWidget(
                      activePage: FFLocalizations.of(context).getText(
                        'ccve1mpx' /* Account */,
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
