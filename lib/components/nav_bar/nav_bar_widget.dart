import '/components/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    String? activePage,
  }) : activePage = activePage ?? 'Home';

  final String activePage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Current naBar items:
        //
        // Home
        // Cart
        // Orders
        // Wallet
        // Profile
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Color(0x07000000),
                  offset: Offset(
                    0.0,
                    -12.0,
                  ),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAV_BAR_COMP_HomeZenbil_ON_TAP');
                      logFirebaseEvent('HomeZenbil_navigate_to');

                      context.goNamed('zenbil');
                    },
                    child: wrapWithModel(
                      model: _model.homeZenbilModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: FFAppConstants.BrandAppName,
                        unselectedIcon: Icon(
                          FFIcons.kletterZ,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.kletterZ,
                          color: FlutterFlowTheme.of(context).mainBlue,
                          size: 24.0,
                        ),
                        fancyItem: false,
                        showImageAsIcon: true,
                        imageNormal:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zenbil-consumer-elul2g/assets/tnlrxfialmlh/512_navbar_lightBlack_trans.png',
                        imageSelected:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zenbil-consumer-elul2g/assets/19fsirgh4cub/512_navbar_blue_trans.png',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAV_BAR_COMP_Market_ON_TAP');
                      logFirebaseEvent('Market_navigate_to');

                      context.goNamed('Stores');
                    },
                    child: wrapWithModel(
                      model: _model.marketModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          'x0waiw5y' /* Stores */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.kshoppingBag,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.kshoppingBag,
                          color: FlutterFlowTheme.of(context).mainBlue,
                          size: 24.0,
                        ),
                        fancyItem: false,
                        showImageAsIcon: false,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAV_BAR_COMP_Influencer_ON_TAP');
                      logFirebaseEvent('Influencer_navigate_to');

                      context.goNamed('Stars');
                    },
                    child: wrapWithModel(
                      model: _model.influencerModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          'g85460uu' /* Stars */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.ksparkle,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.ksparkle,
                          color: FlutterFlowTheme.of(context).mainBlue,
                          size: 24.0,
                        ),
                        fancyItem: true,
                        showImageAsIcon: true,
                        imageNormal:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zenbil-consumer-elul2g/assets/zm1xsdg60tfb/star_navbar_lightblack.png',
                        imageSelected:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zenbil-consumer-elul2g/assets/32qjhsdju87w/star_navbar_blue.png',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAV_BAR_COMP_Categories_ON_TAP');
                      logFirebaseEvent('Categories_navigate_to');

                      context.goNamed('Categories');
                    },
                    child: wrapWithModel(
                      model: _model.categoriesModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          'i81l6pdr' /* Categories */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.klayoutGrid,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.klayoutGrid,
                          color: FlutterFlowTheme.of(context).mainBlue,
                          size: 24.0,
                        ),
                        fancyItem: false,
                        showImageAsIcon: false,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAV_BAR_COMP_Account_ON_TAP');
                      logFirebaseEvent('Account_navigate_to');

                      context.goNamed('Setting');
                    },
                    child: wrapWithModel(
                      model: _model.accountModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          's4f8om5t' /* Account */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.kuserAlt,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.kuserAlt,
                          color: FlutterFlowTheme.of(context).mainBlue,
                          size: 24.0,
                        ),
                        fancyItem: false,
                        showImageAsIcon: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
