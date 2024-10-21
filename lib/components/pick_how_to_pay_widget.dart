import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/loaders/loader_box/loader_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pick_how_to_pay_model.dart';
export 'pick_how_to_pay_model.dart';

class PickHowToPayWidget extends StatefulWidget {
  const PickHowToPayWidget({
    super.key,
    this.activeItem,
    required this.item,
    required this.onSelectedCallback,
    double? orderFee,
    bool? disabled,
  })  : orderFee = orderFee ?? 0.0,
        disabled = disabled ?? false;

  final PaymentTypesRow? activeItem;
  final PaymentTypesRow? item;
  final Future Function()? onSelectedCallback;
  final double orderFee;
  final bool disabled;

  @override
  State<PickHowToPayWidget> createState() => _PickHowToPayWidgetState();
}

class _PickHowToPayWidgetState extends State<PickHowToPayWidget> {
  late PickHowToPayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickHowToPayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('PICK_HOW_TO_PAY_DeliveryContainer_ON_TAP');
        if (!widget.disabled) {
          logFirebaseEvent('DeliveryContainer_execute_callback');
          await widget.onSelectedCallback?.call();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.item?.id == widget.activeItem?.id
                ? FlutterFlowTheme.of(context).secondary25
                : const Color(0x00FFFFFF),
            const Color(0x00FFFFFF),
          ),
          borderRadius: BorderRadius.circular(4.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.item?.id == widget.activeItem?.id
                  ? FlutterFlowTheme.of(context).success
                  : const Color(0x00B8BCBF),
              const Color(0x00838383),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: widget.item!.image!,
                        width: 32.0,
                        height: 32.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.item?.name,
                                    '-',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        color: valueOrDefault<Color>(
                                          widget.item?.id ==
                                                  widget.activeItem?.id
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          if (widget.item?.type == 'Wallet')
                            Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: FutureBuilder<List<WalletsRow>>(
                                  future: WalletsTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'user_id',
                                      currentUserUid,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const SizedBox(
                                        width: double.infinity,
                                        height: 18.0,
                                        child: LoaderBoxWidget(
                                          borderRadius: 4.0,
                                        ),
                                      );
                                    }
                                    List<WalletsRow> rowWalletsRowList =
                                        snapshot.data!;

                                    final rowWalletsRow =
                                        rowWalletsRowList.isNotEmpty
                                            ? rowWalletsRowList.first
                                            : null;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              FFIcons.kwallet,
                                              color: widget.orderFee >
                                                      rowWalletsRow!.balance
                                                  ? FlutterFlowTheme.of(context)
                                                      .error
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '04bhw9bc' /* Wallet */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    color: widget.orderFee >
                                                            rowWalletsRow
                                                                .balance
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .error
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily),
                                                  ),
                                            ),
                                            Text(
                                              functions
                                                  .applyCorrectNumberFormatting(
                                                      rowWalletsRow.balance,
                                                      rowWalletsRow
                                                          .currencyCode!,
                                                      FFAppConstants
                                                          .useCurrencySymbol,
                                                      true),
                                              textAlign: TextAlign.end,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 5.0)),
                                        ),
                                      ].divide(const SizedBox(width: 16.0)),
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
              ),
              Stack(
                children: [
                  if (widget.item?.id != widget.activeItem?.id ? false : true)
                    Icon(
                      FFIcons.kcircleCheck,
                      color: FlutterFlowTheme.of(context).success,
                      size: 24.0,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
