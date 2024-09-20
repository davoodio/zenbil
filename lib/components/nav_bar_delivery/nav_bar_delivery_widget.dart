import '/components/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_delivery_model.dart';
export 'nav_bar_delivery_model.dart';

class NavBarDeliveryWidget extends StatefulWidget {
  const NavBarDeliveryWidget({
    super.key,
    String? activePage,
  }) : this.activePage = activePage ?? 'Home';

  final String activePage;

  @override
  State<NavBarDeliveryWidget> createState() => _NavBarDeliveryWidgetState();
}

class _NavBarDeliveryWidgetState extends State<NavBarDeliveryWidget> {
  late NavBarDeliveryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarDeliveryModel());

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
        //
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
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
                      logFirebaseEvent('NAV_BAR_DELIVERY_COMP_Market_ON_TAP');
                      logFirebaseEvent('Market_navigate_to');

                      context.goNamed('DeliveryHome');
                    },
                    child: wrapWithModel(
                      model: _model.marketModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarItemWidget(
                        actiePage: widget!.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          'p5z062yj' /* Home */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.ktruckDelivery,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.kshoppingBag,
                          color: FlutterFlowTheme.of(context).tertiary,
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
                      logFirebaseEvent('NAV_BAR_DELIVERY_COMP_Account_ON_TAP');
                      logFirebaseEvent('Account_navigate_to');

                      context.goNamed('DeliveryHistory');
                    },
                    child: wrapWithModel(
                      model: _model.accountModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarItemWidget(
                        actiePage: widget!.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          'pp5xpshl' /* Delivery History */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.khistoryDefault,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.kuserAlt,
                          color: FlutterFlowTheme.of(context).tertiary,
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
                      logFirebaseEvent('NAV_BAR_DELIVERY_COMP_Account_ON_TAP');
                      logFirebaseEvent('Account_navigate_to');

                      context.goNamed('DeliveryAccount');
                    },
                    child: wrapWithModel(
                      model: _model.accountModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarItemWidget(
                        actiePage: widget!.activePage,
                        currentItemName: FFLocalizations.of(context).getText(
                          'srv0anaj' /* Account */,
                        ),
                        unselectedIcon: Icon(
                          FFIcons.kuserAlt,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          FFIcons.kuserAlt,
                          color: FlutterFlowTheme.of(context).tertiary,
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
