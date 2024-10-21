import '/backend/supabase/supabase.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'address_card_model.dart';
export 'address_card_model.dart';

class AddressCardWidget extends StatefulWidget {
  const AddressCardWidget({
    super.key,
    required this.userAddresss,
    bool? showSetDefaultButton,
  }) : showSetDefaultButton = showSetDefaultButton ?? true;

  final UserAddressesRow? userAddresss;
  final bool showSetDefaultButton;

  @override
  State<AddressCardWidget> createState() => _AddressCardWidgetState();
}

class _AddressCardWidgetState extends State<AddressCardWidget> {
  late AddressCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressCardModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).cartBg,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget.userAddresss?.addressName,
                              '-',
                            ),
                            maxLines: 1,
                            minFontSize: 8.0,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (widget.userAddresss?.isDefualt ?? false) {
                          return Text(
                            FFLocalizations.of(context).getText(
                              'j27ac60i' /* Default Address */,
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                          );
                        } else {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (widget.showSetDefaultButton)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADDRESS_CARD_SET_AS_DEFAULT_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');
                                    await UserAddressesTable().update(
                                      data: {
                                        'is_defualt': true,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.userAddresss?.id,
                                      ),
                                    );
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().dummyVariable = '';
                                    _model.updatePage(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'kvxg229g' /* Set as Default */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 30.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              if (widget.showSetDefaultButton)
                                FlutterFlowIconButton(
                                  borderRadius: 4.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    FFIcons.kdeleteDefault,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADDRESS_CARD_deleteDefault_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: double.infinity,
                                            child: InfoModalWidget(
                                              icon: Icon(
                                                FFIcons.kcheck,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 24.0,
                                              ),
                                              title: FFLocalizations.of(context)
                                                  .getText(
                                                'e0a6powq' /* Confirm! */,
                                              ),
                                              body: FFLocalizations.of(context)
                                                  .getText(
                                                'i1rmwmf8' /* You sure you want to remove th... */,
                                              ),
                                              isConfirm: true,
                                              actionButtonText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'xflb73wp' /* Yes, Remove */,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.removeAddress = value));

                                    if (_model.removeAddress!) {
                                      logFirebaseEvent(
                                          'IconButton_backend_call');
                                      await UserAddressesTable().update(
                                        data: {
                                          'is_deleted': true,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.userAddresss?.id,
                                        ),
                                      );
                                      logFirebaseEvent(
                                          'IconButton_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: double.infinity,
                                              child: InfoModalWidget(
                                                icon: Icon(
                                                  FFIcons.kcircleCheckFilled,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 34.0,
                                                ),
                                                autoDismiss: true,
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'vak8irjs' /* Removed! */,
                                                ),
                                                body:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'sov781s1' /* Address is successfully remove... */,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                            ].divide(const SizedBox(width: 4.0)),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget.userAddresss?.address,
                      '-',
                    ),
                    maxLines: 3,
                    minFontSize: 8.0,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelSmallFamily),
                          lineHeight: 1.7,
                        ),
                  ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
