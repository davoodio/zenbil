import '/auth/supabase_auth/auth_util.dart';
import '/components/anon_user_card_widget.dart';
import '/components/info_modal_widget.dart';
import '/components/menu_setting_item_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/social_widget.dart';
import '/components/terms_texts_widget.dart';
import '/components/user_info_card_widget.dart';
import '/components/wallet_front_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'setting_model.dart';
export 'setting_model.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late SettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Setting'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SETTING_PAGE_Setting_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('Setting_custom_action');
          _model.appVersion = await actions.appVersion();
          logFirebaseEvent('Setting_update_page_state');
          _model.appversion = '${getJsonField(
            _model.appVersion,
            r'''$.version''',
          ).toString().toString()} ${getJsonField(
            _model.appVersion,
            r'''$.build''',
          ).toString().toString()}';
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('Setting_action_block');
          await action_blocks.walletSetter(context);
        }),
        Future(() async {
          logFirebaseEvent('Setting_action_block');
          await action_blocks.setCurrentUserInAppState(context);
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
                                    if (FFAppState().CurrentUser.isAnon)
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
                                              model: _model.anonUserCardModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const AnonUserCardWidget(),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    if (!FFAppState().CurrentUser.isAnon)
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
                                          if (FFAppState()
                                              .AppSettings
                                              .enableWalletAsPaymentOption)
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .walletFrontCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: WalletFrontCardWidget(
                                                    showHistory: true,
                                                    wallet: FFAppState().Wallet,
                                                  ),
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
                                        if (FFAppState().CurrentUser.isAnon)
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
                                                        'SETTING_PAGE_Login_btn_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Login_btn_navigate_to');

                                                    context.pushNamed(
                                                      'Signup',
                                                      queryParameters: {
                                                        'showBackButton':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.loginBtnModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MenuSettingItemWidget(
                                                      icon: Icon(
                                                        FFIcons.klogout,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'akr23z23' /* Login */,
                                                      ),
                                                      showArrow: true,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                                        'SETTING_PAGE_signupBtn_ON_TAP');
                                                    logFirebaseEvent(
                                                        'signupBtn_navigate_to');

                                                    context.pushNamed(
                                                      'Signup',
                                                      queryParameters: {
                                                        'showBackButton':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.signupBtnModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MenuSettingItemWidget(
                                                      icon: Icon(
                                                        FFIcons.kuserPlus,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 22.0,
                                                      ),
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'k63e1xs9' /* Signup */,
                                                      ),
                                                      showArrow: true,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                                  'SETTING_PAGE_support_ON_TAP');
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
                                                  '4qjpya8h' /* Customer Support */,
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
                                                    'SETTING_PAGE_editprofile_ON_TAP');
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
                                                    'lv7ivg2j' /* Edit Profile */,
                                                  ),
                                                  showArrow: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                    'SETTING_PAGE_manageaddress_ON_TAP');
                                                logFirebaseEvent(
                                                    'manageaddress_navigate_to');

                                                context.pushNamed('Orders');
                                              },
                                              child: wrapWithModel(
                                                model:
                                                    _model.manageaddressModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MenuSettingItemWidget(
                                                  icon: Icon(
                                                    FFIcons.kreceiptBag,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0u3lq928' /* Orders */,
                                                  ),
                                                  showArrow: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                    'SETTING_PAGE_manageaddress_ON_TAP');
                                                logFirebaseEvent(
                                                    'manageaddress_navigate_to');

                                                context.pushNamed('Addresses');
                                              },
                                              child: wrapWithModel(
                                                model:
                                                    _model.manageaddressModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MenuSettingItemWidget(
                                                  icon: Icon(
                                                    FFIcons.klocation,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'gjyxrm8i' /* Manage Address */,
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
                                                  'm857msi9' /* Payment Methods */,
                                                ),
                                                showArrow: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        if (!FFAppState().CurrentUser.isAnon &&
                                            false)
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
                                                    'SETTING_PAGE_Shippingmetho_ON_TAP');
                                                logFirebaseEvent(
                                                    'Shippingmetho_navigate_to');

                                                context.pushNamed(
                                                    'ShippingMethod');
                                              },
                                              child: wrapWithModel(
                                                model:
                                                    _model.shippingmethoModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MenuSettingItemWidget(
                                                  icon: Icon(
                                                    FFIcons.ktruckDelivery,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '8ne2iv94' /* Shipping Methods */,
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
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SETTING_PAGE_NotifiationSetting_ON_TAP');
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
                                                    'ane006qe' /* Notification Setting */,
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
                                                              '9nyt7q34' /* Country */,
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
                                                  'SETTING_PAGE_LanguageContainer_ON_TAP');
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
                                                                'nks8i0bm' /* Language */,
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
                                                          'm12vb62i' /* English (US) */,
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
                                        if (false)
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
                                                                'swdcz12e' /* Dark Mode */,
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
                                                  Switch.adaptive(
                                                    value: _model
                                                            .switchValue ??=
                                                        Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() =>
                                                          _model.switchValue =
                                                              newValue);
                                                      if (newValue) {
                                                        logFirebaseEvent(
                                                            'SETTING_Switch_egidl29y_ON_TOGGLE_ON');
                                                        logFirebaseEvent(
                                                            'Switch_set_dark_mode_settings');
                                                        setDarkModeSetting(
                                                            context,
                                                            ThemeMode.dark);
                                                      } else {
                                                        logFirebaseEvent(
                                                            'SETTING_Switch_egidl29y_ON_TOGGLE_OFF');
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
                                                  'SETTING_PAGE_Privac_ON_TAP');
                                              logFirebaseEvent(
                                                  'Privac_launch_u_r_l');
                                              await launchURL(
                                                  FFAppConstants.privacyLink);
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
                                                  'dq2nu91h' /* Privacy Policy */,
                                                ),
                                                showArrow: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SETTING_PAGE_Help_ON_TAP');
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
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'wqoya4id' /* Help Center */,
                                                  ),
                                                  showArrow: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                    'SETTING_PAGE_Share_ON_TAP');
                                                logFirebaseEvent('Share_share');
                                                await Share.share(
                                                  '${FFAppConstants.BrandAppName}: ${FFAppConstants.BrandTagLine}  AppStore: ${FFAppConstants.AppStoreLink} PlayStore: ${FFAppConstants.PlayStoreLink}',
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.shareModel,
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
                                                    'qe65e7nb' /* Share With Friends */,
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
                                        if (FFAppState()
                                                .AppSettings
                                                .social.isNotEmpty)
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'now4ob1r' /* Follow us on  */,
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
                                                    ],
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final socialMedia =
                                                          FFAppState()
                                                              .AppSettings
                                                              .social
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: List.generate(
                                                              socialMedia
                                                                  .length,
                                                              (socialMediaIndex) {
                                                            final socialMediaItem =
                                                                socialMedia[
                                                                    socialMediaIndex];
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .socialModels
                                                                  .getModel(
                                                                (socialMediaItem
                                                                        .toMap())
                                                                    .toString(),
                                                                socialMediaIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  SocialWidget(
                                                                key: Key(
                                                                  'Keyobt_${(socialMediaItem.toMap()).toString()}',
                                                                ),
                                                                type:
                                                                    socialMediaItem
                                                                        .type,
                                                                url:
                                                                    socialMediaItem
                                                                        .url,
                                                              ),
                                                            );
                                                          }).divide(const SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 8.0))
                                                    .addToStart(
                                                        const SizedBox(height: 8.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 8.0)),
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
                                                        'SETTING_PAGE_logout_ON_TAP');
                                                    Function() navigate =
                                                        () {};
                                                    logFirebaseEvent(
                                                        'logout_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                InfoModalWidget(
                                                              title: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'pkkl1lnu' /* Warning! */,
                                                              ),
                                                              body:
                                                                  'Are you sure you want to delete your account? All your data will be removed from our system.',
                                                              isConfirm: true,
                                                              actionButtonText:
                                                                  'Yes, Delete',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() => _model
                                                                .deleteAccountConfirm =
                                                            value));

                                                    if (_model
                                                        .deleteAccountConfirm!) {
                                                      logFirebaseEvent(
                                                          'logout_auth');
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      await authManager
                                                          .signOut();
                                                      GoRouter.of(context)
                                                          .clearRedirectLocation();

                                                      navigate = () =>
                                                          context.goNamedAuth(
                                                              'Splash',
                                                              context.mounted);
                                                    }

                                                    navigate();

                                                    safeSetState(() {});
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.logoutModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MenuSettingItemWidget(
                                                      icon: Icon(
                                                        FFIcons.kuserX,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 22.0,
                                                      ),
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jjlx0njo' /* Delete Account */,
                                                      ),
                                                      showArrow: true,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                                        'SETTING_PAGE_logout_ON_TAP');
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
                                                    model: _model.logoutModel2,
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
                                                        'hzotb4db' /* Logout */,
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 80.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.termsTextsModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const TermsTextsWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.appversion != null &&
                                              _model.appversion != '')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                '${FFAppConstants.BrandAppName} ${FFAppConstants.appVersion}',
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                        ].divide(const SizedBox(height: 10.0)),
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
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const NavBarWidget(
                      activePage: 'Account',
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
