import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Splash'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_PAGE_Splash_ON_INIT_STATE');
      logFirebaseEvent('Splash_custom_action');
      await actions.handleDynamicLink(
        context,
      );
      if (FFAppState().storeID != 0) {
        logFirebaseEvent('Splash_navigate_to');

        context.goNamed(
          'StoreFront',
          queryParameters: {
            'marketID': serializeParam(
              FFAppState().storeID,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      } else {
        logFirebaseEvent('Splash_navigate_to');

        context.goNamed('Control');
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
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
        backgroundColor: FlutterFlowTheme.of(context).mainBlue,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/adaptiveIcon_trans.png',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.contain,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                    ].divide(const SizedBox(height: 34.0)),
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
