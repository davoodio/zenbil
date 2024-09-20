import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'terms_model.dart';
export 'terms_model.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key});

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late TermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Terms'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            'i8vngblc' /* Privacy Policy */,
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Html(
                                data:
                                    '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>Privacy Policy</title>\n<style>\n  body {\n    font-family: Arial, sans-serif;\n    padding: 20px;\n    line-height: 1.3;\n  }\n  h1 {\n    color: #333;\n  }\n  p {\n    margin-bottom: 10px;\n  }\n</style>\n</head>\n<body>\n  <h2>Privacy Policy</h2>\n  <p>Effective date: November 3, 2023</p>\n  \n  <p>At BuilderKing, accessible from our app, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by BuilderKing and how we use it.</p>\n  \n  <p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p>\n  \n  <p>This Privacy Policy applies only to our online activities and is valid for visitors to our app with regards to the information that they shared and/or collect in BuilderKing. This policy is not applicable to any information collected offline or via channels other than this app.</p>\n  \n  <h2>Consent</h2>\n  <p>By using our app, you hereby consent to our Privacy Policy and agree to its terms.</p>\n  \n  <h2>Information we collect</h2>\n  <p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p>\n  \n  <p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p>\n  \n  <h2>How we use your information</h2>\n  <p>We use the information we collect in various ways, including to:</p>\n  \n  <ul>\n    <li>Provide, operate, and maintain our app</li>\n    <li>Improve, personalize, and expand our app</li>\n    <li>Understand and analyze how you use our app</li>\n    <li>Develop new products, services, features, and functionality</li>\n  </ul>\n  \n  <h2>Contact us</h2>\n  <p>For any questions or concerns regarding your privacy, you may contact us using the following details:</p>\n  <p><strong>BuilderKing Support</strong><br>Email: support@builderkingapp.com</p>\n  \n</main>\n\n</body>\n</html>\n',
                                onLinkTap: (url, _, __) => launchURL(url!),
                              ),
                            ].addToEnd(const SizedBox(height: 77.0)),
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
