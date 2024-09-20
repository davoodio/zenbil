import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delivery_home_model.dart';
export 'delivery_home_model.dart';

class DeliveryHomeWidget extends StatefulWidget {
  const DeliveryHomeWidget({super.key});

  @override
  State<DeliveryHomeWidget> createState() => _DeliveryHomeWidgetState();
}

class _DeliveryHomeWidgetState extends State<DeliveryHomeWidget>
    with TickerProviderStateMixin {
  late DeliveryHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryHomeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DeliveryHome'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DELIVERY_HOME_DeliveryHome_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      await Future.wait([
        Future(() async {
          if (loggedIn && !FFAppState().CurrentUser.isAnon) {
            if ((FFAppState().Role.code == Roles.DELIVERY_ADMIN.name) ||
                (FFAppState().Role.code == Roles.DELIVERY_EMPLOYEE.name)) {
              return;
            }
          }
          logFirebaseEvent('DeliveryHome_navigate_to');

          context.goNamed('DeliveryLogin');
        }),
        Future(() async {
          logFirebaseEvent('DeliveryHome_start_periodic_action');
          _model.LocationUpdater = InstantTimer.periodic(
            duration: Duration(milliseconds: 5000),
            callback: (timer) async {
              currentUserLocationValue = await getCurrentUserLocation(
                  defaultLocation: LatLng(0.0, 0.0));
              if (FFAppState().LiveLocation.liveLocationIsOn) {
                logFirebaseEvent('DeliveryHome_update_app_state');
                FFAppState().updateLiveLocationStruct(
                  (e) => e
                    ..updatedTime = getCurrentTimestamp
                    ..location = currentUserLocationValue,
                );
                safeSetState(() {});
                logFirebaseEvent('DeliveryHome_backend_call');
                await UsersTable().update(
                  data: {
                    'location': functions
                        .convertLatlangToString(currentUserLocationValue!),
                  },
                  matchingRows: (rows) => rows.eq(
                    'id',
                    currentUserUid,
                  ),
                );
              }
            },
            startImmediately: false,
          );
        }),
      ]);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 75.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      FFIcons.kmenu,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    '${FFAppConstants.BrandAppName} | Delivery',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily),
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'DELIVERY_HOME_Container_cstdz5jl_ON_TAP');
                                logFirebaseEvent('Container_update_app_state');
                                FFAppState().updateLiveLocationStruct(
                                  (e) =>
                                      e..liveLocationIsOn = !e.liveLocationIsOn,
                                );
                                safeSetState(() {});
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color:
                                      FFAppState().LiveLocation.liveLocationIsOn
                                          ? Color(0x2D048178)
                                          : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FFAppState()
                                            .LiveLocation
                                            .liveLocationIsOn
                                        ? FlutterFlowTheme.of(context).success
                                        : Color(0x00000000),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      if (!FFAppState()
                                          .LiveLocation
                                          .liveLocationIsOn)
                                        Icon(
                                          FFIcons.klocationCrosshairs,
                                          color: FlutterFlowTheme.of(context)
                                              .grayMiddle,
                                          size: 24.0,
                                        ),
                                      if (FFAppState()
                                          .LiveLocation
                                          .liveLocationIsOn)
                                        Icon(
                                          FFIcons.klocationCrosshairs,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation']!),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qsb466fp' /* Available Orders */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.navBarDeliveryModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: NavBarDeliveryWidget(
                  activePage: FFLocalizations.of(context).getText(
                    'fedj9fib' /* Home */,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
