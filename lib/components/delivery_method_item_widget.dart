import '/backend/schema/structs/index.dart';
import '/components/delivery_method_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delivery_method_item_model.dart';
export 'delivery_method_item_model.dart';

class DeliveryMethodItemWidget extends StatefulWidget {
  const DeliveryMethodItemWidget({
    super.key,
    required this.orderGroupId,
    this.letChangeTheMethod,
    required this.onMethodChanged,
    this.deliveryOrder,
    required this.indexInList,
  });

  final int? orderGroupId;
  final bool? letChangeTheMethod;
  final Future Function(String selectedMethod)? onMethodChanged;
  final DeliveryOrdersStruct? deliveryOrder;
  final int? indexInList;

  @override
  State<DeliveryMethodItemWidget> createState() =>
      _DeliveryMethodItemWidgetState();
}

class _DeliveryMethodItemWidgetState extends State<DeliveryMethodItemWidget> {
  late DeliveryMethodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryMethodItemModel());

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
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.ktruckDelivery,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 24.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '0pb14jpp' /* Delivery Method */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'DELIVERY_METHOD_ITEM_Container_o0ghuvku_');
                          if (widget.letChangeTheMethod!) {
                            logFirebaseEvent('Container_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height: double.infinity,
                                    child: DeliveryMethodSelectorWidget(
                                      options: widget.deliveryOrder!
                                          .deliveryOptionsAvailable,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(
                                () => _model.deliveryMethodReturned = value));

                            if (_model.deliveryMethodReturned != null &&
                                _model.deliveryMethodReturned != '') {
                              logFirebaseEvent('Container_execute_callback');
                              await widget.onMethodChanged?.call(
                                _model.deliveryMethodReturned!,
                              );
                            }
                          }

                          safeSetState(() {});
                        },
                        child: Container(
                          height: 34.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget
                                          .deliveryOrder
                                          ?.selectedDeliveryMethodForOrderGroup
                                          .methodTypeName,
                                      'Fast',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ),
                                if (widget.letChangeTheMethod ?? true)
                                  Icon(
                                    FFIcons.krefresh,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      functions.applyCorrectNumberFormatting(
                          widget.deliveryOrder!.selectedOptionPrice,
                          widget.deliveryOrder!.selectedOptionCurrencyCode,
                          FFAppConstants.useCurrencySymbol,
                          true),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelMediumFamily),
                          ),
                    ),
                    if (false)
                      Text(
                        FFLocalizations.of(context).getText(
                          '9k3i0m8e' /* Est Arrival: 24 Jan */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ].divide(const SizedBox(height: 4.0)),
            ),
          ),
        ].divide(const SizedBox(width: 8.0)),
      ),
    );
  }
}
