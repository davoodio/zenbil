import '/auth/supabase_auth/auth_util.dart';
import '/components/cart_badge_widget.dart';
import '/components/search_badge_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    this.title,
    bool? showBackButton,
    bool? showCart,
    bool? goToCartOnClick,
    bool? showSearch,
    this.searchTableName,
    this.fieldsToReturnFromSearchTable,
    this.fieldsToSearchIn,
    this.searchTitle,
    this.preDefineSearch,
  })  : showBackButton = showBackButton ?? false,
        showCart = showCart ?? false,
        goToCartOnClick = goToCartOnClick ?? false,
        showSearch = showSearch ?? false;

  final String? title;
  final bool showBackButton;
  final bool showCart;
  final bool goToCartOnClick;
  final bool showSearch;
  final String? searchTableName;
  final String? fieldsToReturnFromSearchTable;
  final String? fieldsToSearchIn;
  final String? searchTitle;
  final String? preDefineSearch;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: SizedBox(
              width: 48.0,
              child: Stack(
                children: [
                  if (widget.showBackButton)
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      borderWidth: 0.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        FFIcons.karrowLeft,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 22.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('HEADER_COMP_arrowLeft_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                ],
              ),
            ),
          ),
          if (widget.showCart && widget.showSearch)
            Container(
              width: 48.0,
              height: 48.0,
              decoration: const BoxDecoration(),
            ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.title != null && widget.title != '')
                  Flexible(
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.title,
                        'TITLE',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 8.0,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                    ),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: SizedBox(
                  width: 44.0,
                  height: 44.0,
                  child: Stack(
                    children: [
                      if (widget.showSearch)
                        wrapWithModel(
                          model: _model.searchBadgeModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SearchBadgeWidget(
                            backColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            goToSearchOnTap: true,
                            tableName: widget.searchTableName!,
                            fieldsToReturnFromTable:
                                widget.fieldsToReturnFromSearchTable!,
                            fieldsToSearchIn: widget.fieldsToSearchIn!,
                            searchTitle: widget.searchTitle!,
                            preDefineSearch: widget.preDefineSearch!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: SizedBox(
                  width: 44.0,
                  height: 44.0,
                  child: Stack(
                    children: [
                      if (widget.showCart)
                        wrapWithModel(
                          model: _model.cartBadgeModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CartBadgeWidget(
                            backColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            goToCartOnTap: widget.goToCartOnClick,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (false)
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              icon: Icon(
                FFIcons.klogOut,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('HEADER_COMP_logOut_ICN_ON_TAP');
                logFirebaseEvent('IconButton_auth');
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('Splash', context.mounted);
              },
            ),
        ],
      ),
    );
  }
}
