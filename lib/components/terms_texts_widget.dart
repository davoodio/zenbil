import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_texts_model.dart';
export 'terms_texts_model.dart';

class TermsTextsWidget extends StatefulWidget {
  const TermsTextsWidget({super.key});

  @override
  State<TermsTextsWidget> createState() => _TermsTextsWidgetState();
}

class _TermsTextsWidgetState extends State<TermsTextsWidget> {
  late TermsTextsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsTextsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'loe8vknm' /* By joining you are agree to ou... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelLargeFamily,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelLargeFamily),
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'mow1c2lx' /* Terms of Service  */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        decoration: TextDecoration.underline,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  mouseCursor: SystemMouseCursors.click,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      logFirebaseEvent(
                          'TERMS_TEXTS_RichTextSpan_tud7drwu_ON_TAP');
                      logFirebaseEvent('RichTextSpan_launch_u_r_l');
                      await launchURL(FFAppConstants.termsLink);
                    },
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'r9qvi8vu' /* and  */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelLargeFamily,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelLargeFamily),
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'm9pje3b2' /* Privacy Policy. */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        decoration: TextDecoration.underline,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  mouseCursor: SystemMouseCursors.click,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      logFirebaseEvent(
                          'TERMS_TEXTS_RichTextSpan_iyl8bp5a_ON_TAP');
                      logFirebaseEvent('RichTextSpan_launch_u_r_l');
                      await launchURL(FFAppConstants.privacyLink);
                    },
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                    lineHeight: 1.7,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
