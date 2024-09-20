import '/backend/schema/structs/index.dart';
import '/components/line_colors_widget.dart';
import '/components/topup_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wallet_front_card_model.dart';
export 'wallet_front_card_model.dart';

class WalletFrontCardWidget extends StatefulWidget {
  const WalletFrontCardWidget({
    super.key,
    bool? showHistory,
    required this.wallet,
  }) : showHistory = showHistory ?? false;

  final bool showHistory;
  final WalletStruct? wallet;

  @override
  State<WalletFrontCardWidget> createState() => _WalletFrontCardWidgetState();
}

class _WalletFrontCardWidgetState extends State<WalletFrontCardWidget> {
  late WalletFrontCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletFrontCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('WALLET_FRONT_CARD_Container_riclw2ie_ON_');
        if (widget.showHistory) {
          logFirebaseEvent('Container_navigate_to');

          context.pushNamed(
            'WalletHistory',
            queryParameters: {
              'wallet': serializeParam(
                widget.wallet?.walletId,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.kwallet,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'kml1rrf7' /* Wallet */,
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          functions.applyCorrectNumberFormatting(
                              valueOrDefault<double>(
                                widget.wallet?.balance,
                                0.0,
                              ),
                              widget.wallet!.currencyCode,
                              FFAppConstants.useCurrencySymbol,
                              true),
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                      ].divide(const SizedBox(width: 4.0)),
                    ),
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
              wrapWithModel(
                model: _model.lineColorsModel,
                updateCallback: () => safeSetState(() {}),
                child: const LineColorsWidget(),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Visibility(
                      visible: widget.showHistory,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 5.0, 5.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'p1o5y80s' /* History */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: FlutterFlowTheme.of(context).accent4,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 5.0)),
                      ),
                    ),
                  ),
                  if (FFAppState().AppSettings.enableWalletTopup)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('WALLET_FRONT_CARD_COMP_Topup_ON_TAP');
                        logFirebaseEvent('Topup_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          isDismissible: false,
                          enableDrag: false,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: double.infinity,
                                child: TopupModalWidget(
                                  walletId: widget.wallet!.walletId,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).boxShadow,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kplus,
                                color: FlutterFlowTheme.of(context).info,
                                size: 16.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '9s7zajf3' /* Top Up */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
