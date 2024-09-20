import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'help_center_model.dart';
export 'help_center_model.dart';

class HelpCenterWidget extends StatefulWidget {
  const HelpCenterWidget({super.key});

  @override
  State<HelpCenterWidget> createState() => _HelpCenterWidgetState();
}

class _HelpCenterWidgetState extends State<HelpCenterWidget>
    with TickerProviderStateMixin {
  late HelpCenterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpCenterModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HelpCenter'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
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
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 48.0,
                                child: Stack(
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      borderWidth: 0.0,
                                      buttonSize: 48.0,
                                      icon: Icon(
                                        FFIcons.karrowLeft,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 22.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HELP_CENTER_PAGE_arrowLeft_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.safePop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ib99zku6' /* Help Center */,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    width: 44.0,
                                    height: 44.0,
                                    child: Stack(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                indicatorWeight: 2.0,
                                tabs: [
                                  Semantics(
                                    label: 'FAQ tab',
                                    child: Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '7qb69jdl' /* FAQ */,
                                      ),
                                    ),
                                  ),
                                  Semantics(
                                    label: 'Contact Us Tab',
                                    child: Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'ffyttx1t' /* Contact Us */,
                                      ),
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x11000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController1,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'xzcg6pae' /* General Support Tips */,
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Html(
                                                        data:
                                                            '<!-- FAQ Item 1 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How do I import assets into my FlutterFlow project?</p>\n  <div class=\"faq-answer\">\n    <p>Check our <a href=\"https://docs.flutterflow.io/flutterflow-features/assets\" target=\"_blank\">documentation on assets</a> to learn about importing and managing assets in FlutterFlow.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 2 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How can I add custom code to my project?</p>\n  <div class=\"faq-answer\">\n    <p>Learn about adding custom code in our <a href=\"https://docs.flutterflow.io/flutterflow-features/custom-code\" target=\"_blank\">Custom Code documentation</a>.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 3 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">What to do when my build fails?</p>\n  <div class=\"faq-answer\">\n    <p>For build issues, visit our <a href=\"https://intercom.help/flutterflow/en/articles/4438341-troubleshooting-a-build-failure\" target=\"_blank\">troubleshooting guide</a> for detailed steps to resolve common problems.</p>\n  </div>\n</div>\n',
                                                        onLinkTap:
                                                            (url, _, __) =>
                                                                launchURL(url!),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x11000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController2,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '8wbz05yl' /* Refudn policy */,
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Html(
                                                        data:
                                                            '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>FAQ Section</title>\n<style>\n  /* Basic styles for FAQ section */\n  body {\n    font-family: Arial, sans-serif;\n  }\n  .faq-container {\n    width: 90%;\n    margin: 0 auto;\n    padding: 20px;\n  }\n  .faq-question {\n    font-weight: bold;\n  }\n  .faq-answer {\n    margin-bottom: 20px;\n  }\n  a {\n    text-decoration: none;\n    color: blue;\n  }\n  a:hover {\n    text-decoration: underline;\n  }\n</style>\n</head>\n<body>\n\n<div class=\"faq-container\">\n  <h1>Frequently Asked Questions</h1>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">How do I start using FlutterFlow?</p>\n    <div class=\"faq-answer\">\n      <p>Getting started with FlutterFlow is easy. You can follow our <a href=\"https://docs.flutterflow.io/getting-started\" target=\"_blank\">Getting Started Guide</a> to create your first project.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">Where can I learn more about FlutterFlow features?</p>\n    <div class=\"faq-answer\">\n      <p>Our <a href=\"https://blog.flutterflow.io\" target=\"_blank\">blog</a> and <a href=\"https://www.youtube.com/c/FlutterFlow/videos\" target=\"_blank\">YouTube channel</a> are great resources for learning about what you can do with FlutterFlow.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">Can I get support from the community?</p>\n    <div class=\"faq-answer\">\n      <p>Yes, the <a href=\"https://community.flutterflow.io\" target=\"_blank\">FlutterFlow community</a> is a great place to get help and share your knowledge with others.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">What kind of templates does FlutterFlow offer?</p>\n    <div class=\"faq-answer\">\n      <p>We offer a variety of templates for different use cases. Check out our <a href=\"https://marketplace.flutterflow.io\" target=\"_blank\">marketplace</a> to browse our selection.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">How can I troubleshoot common issues?</p>\n    <div class=\"faq-answer\">\n      <p>Our <a href=\"https://intercom.help/flutterflow/en/\" target=\"_blank\">Intercom articles</a> cover a range of troubleshooting topics to help you resolve common issues.</p>\n    </div>\n  </div>\n\n</div>\n\n</body>\n</html>\n',
                                                        onLinkTap:
                                                            (url, _, __) =>
                                                                launchURL(url!),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x11000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController3,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rjkv8qr9' /* Starting to buy */,
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Html(
                                                        data:
                                                            '<!-- FAQ Item 1 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How do I import assets into my FlutterFlow project?</p>\n  <div class=\"faq-answer\">\n    <p>Check our <a href=\"https://docs.flutterflow.io/flutterflow-features/assets\" target=\"_blank\">documentation on assets</a> to learn about importing and managing assets in FlutterFlow.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 2 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How can I add custom code to my project?</p>\n  <div class=\"faq-answer\">\n    <p>Learn about adding custom code in our <a href=\"https://docs.flutterflow.io/flutterflow-features/custom-code\" target=\"_blank\">Custom Code documentation</a>.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 3 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">What to do when my build fails?</p>\n  <div class=\"faq-answer\">\n    <p>For build issues, visit our <a href=\"https://intercom.help/flutterflow/en/articles/4438341-troubleshooting-a-build-failure\" target=\"_blank\">troubleshooting guide</a> for detailed steps to resolve common problems.</p>\n  </div>\n</div>\n',
                                                        onLinkTap:
                                                            (url, _, __) =>
                                                                launchURL(url!),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x11000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController4,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'tzdtm550' /* How to get help */,
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Html(
                                                        data:
                                                            '<!-- FAQ Item -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">Where can I find FlutterFlow tutorials?</p>\n  <div class=\"faq-answer\">\n    <p>For step-by-step tutorials, visit our <a href=\"https://www.youtube.com/c/FlutterFlow/videos\" target=\"_blank\">YouTube channel</a> where we regularly upload educational content.</p>\n  </div>\n</div>\n',
                                                        onLinkTap:
                                                            (url, _, __) =>
                                                                launchURL(url!),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x11000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController5,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vlpij65p' /* General Support Tips */,
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Html(
                                                        data:
                                                            '<!-- FAQ Item 1 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How do I import assets into my FlutterFlow project?</p>\n  <div class=\"faq-answer\">\n    <p>Check our <a href=\"https://docs.flutterflow.io/flutterflow-features/assets\" target=\"_blank\">documentation on assets</a> to learn about importing and managing assets in FlutterFlow.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 2 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How can I add custom code to my project?</p>\n  <div class=\"faq-answer\">\n    <p>Learn about adding custom code in our <a href=\"https://docs.flutterflow.io/flutterflow-features/custom-code\" target=\"_blank\">Custom Code documentation</a>.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 3 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">What to do when my build fails?</p>\n  <div class=\"faq-answer\">\n    <p>For build issues, visit our <a href=\"https://intercom.help/flutterflow/en/articles/4438341-troubleshooting-a-build-failure\" target=\"_blank\">troubleshooting guide</a> for detailed steps to resolve common problems.</p>\n  </div>\n</div>\n',
                                                        onLinkTap:
                                                            (url, _, __) =>
                                                                launchURL(url!),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x11000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController6,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'wp0p4rpy' /* Which post service? */,
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Html(
                                                        data:
                                                            '<!-- FAQ Item -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">Where can I find FlutterFlow tutorials?</p>\n  <div class=\"faq-answer\">\n    <p>For step-by-step tutorials, visit our <a href=\"https://www.youtube.com/c/FlutterFlow/videos\" target=\"_blank\">YouTube channel</a> where we regularly upload educational content.</p>\n  </div>\n</div>\n',
                                                        onLinkTap:
                                                            (url, _, __) =>
                                                                launchURL(url!),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x11000000),
                                                  offset: Offset(
                                                    0.0,
                                                    12.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    FFIcons.kheadset,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '79065lw6' /* Customer Service */,
                                                        ),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x11000000),
                                                  offset: Offset(
                                                    0.0,
                                                    12.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.email_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'op8p10bo' /* Support */,
                                                        ),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x11000000),
                                                  offset: Offset(
                                                    0.0,
                                                    12.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.call_end_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'n34m6h75' /* Contact Us */,
                                                        ),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 24.0))
                                          .addToStart(SizedBox(height: 24.0))
                                          .addToEnd(SizedBox(height: 24.0)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
