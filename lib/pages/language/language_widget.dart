import '/components/header/header_widget.dart';
import '/components/languages_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'language_model.dart';
export 'language_model.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  late LanguageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Language'});
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
                            'nkldex0c' /* Language */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: false,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LANGUAGE_PAGE_Container_c4w8hpzn_ON_TAP');
                                        logFirebaseEvent(
                                            'LanguagesItem_set_app_language');
                                        setAppLanguage(context, 'en');
                                      },
                                      child: wrapWithModel(
                                        model: _model.languagesItemModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LanguagesItemWidget(
                                          text: 'English (EN)',
                                          currentLanguage:
                                              FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en',
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
                                            'LANGUAGE_PAGE_Container_9unclyq8_ON_TAP');
                                        logFirebaseEvent(
                                            'LanguagesItem_set_app_language');
                                        setAppLanguage(context, 'ar');
                                      },
                                      child: wrapWithModel(
                                        model: _model.languagesItemModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LanguagesItemWidget(
                                          text: 'Arabic (AR )',
                                          currentLanguage:
                                              FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'ar',
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
                                            'LANGUAGE_PAGE_Container_jx15u1my_ON_TAP');
                                        logFirebaseEvent(
                                            'LanguagesItem_set_app_language');
                                        setAppLanguage(context, 'fa');
                                      },
                                      child: wrapWithModel(
                                        model: _model.languagesItemModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LanguagesItemWidget(
                                          text: 'Kurdish (KU)',
                                          currentLanguage:
                                              FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'fa',
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 16.0))
                                      .addToStart(const SizedBox(height: 24.0))
                                      .addToEnd(const SizedBox(height: 77.0)),
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
        ),
      ),
    );
  }
}
