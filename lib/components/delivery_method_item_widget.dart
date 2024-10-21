import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/delivery_method_selector_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    this.deliveryTypes,
  });

  final int? orderGroupId;
  final bool? letChangeTheMethod;
  final Future Function(String selectedMethod)? onMethodChanged;
  final DeliveryOrdersStruct? deliveryOrder;
  final int? indexInList;
  final List<DeliveryMethodTypesRow>? deliveryTypes;

  @override
  State<DeliveryMethodItemWidget> createState() =>
      _DeliveryMethodItemWidgetState();
}

class _DeliveryMethodItemWidgetState extends State<DeliveryMethodItemWidget>
    with TickerProviderStateMixin {
  late DeliveryMethodItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryMethodItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DELIVERY_METHOD_ITEM_DeliveryMethodItem_');
      logFirebaseEvent('DeliveryMethodItem_update_component_stat');
      _model.deliveryType = widget.deliveryTypes
          ?.where((e) =>
              e.name ==
              valueOrDefault<String>(
                widget.deliveryOrder?.selectedDeliveryMethodForOrderGroup
                    .methodTypeName,
                'Fast',
              ))
          .toList()
          .first;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
      child: Visibility(
        visible: _model.deliveryType != null,
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
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      _model.deliveryType?.image,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zenbil-consumer-elul2g/assets/5uuffjk1dyru/fast-1.png',
                                    ),
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (valueOrDefault<String>(
                                                          widget
                                                              .deliveryOrder
                                                              ?.selectedDeliveryMethodForOrderGroup
                                                              .methodTypeName,
                                                          '-',
                                                        ) !=
                                                        '')
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget
                                                            .deliveryOrder
                                                            ?.selectedDeliveryMethodForOrderGroup
                                                            .methodTypeName,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            shadows: [
                                                              const Shadow(
                                                                color: Color(
                                                                    0x2503080C),
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                                blurRadius: 6.0,
                                                              )
                                                            ],
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallFamily),
                                                          ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0pb14jpp' /* Delivery */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                                ),
                                                if (valueOrDefault<double>(
                                                      widget.deliveryOrder
                                                          ?.selectedOptionPrice,
                                                      0.0,
                                                    ) >
                                                    0.0)
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .applyCorrectNumberFormatting(
                                                              valueOrDefault<
                                                                  double>(
                                                                widget
                                                                    .deliveryOrder
                                                                    ?.selectedOptionPrice,
                                                                0.0,
                                                              ),
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .deliveryOrder
                                                                    ?.selectedOptionCurrencyCode,
                                                                'iqd',
                                                              ),
                                                              FFAppConstants
                                                                  .useCurrencySymbol,
                                                              true),
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                  ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: _model
                                                            .deliveryType
                                                            ?.description,
                                                        arText: _model
                                                            .deliveryType
                                                            ?.descriptionArabic,
                                                        faText: _model
                                                            .deliveryType
                                                            ?.descriptionKurdish,
                                                      ),
                                                      '-',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(height: 6.0)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DELIVERY_METHOD_ITEM_Container_o0ghuvku_');
                                                if (widget
                                                    .letChangeTheMethod!) {
                                                  logFirebaseEvent(
                                                      'Container_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: SizedBox(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              DeliveryMethodSelectorWidget(
                                                            options: widget
                                                                .deliveryOrder!
                                                                .deliveryOptionsAvailable,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                              .deliveryMethodReturned =
                                                          value));

                                                  if (_model.deliveryMethodReturned !=
                                                          null &&
                                                      _model.deliveryMethodReturned !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'Container_execute_callback');
                                                    await widget.onMethodChanged
                                                        ?.call(
                                                      _model
                                                          .deliveryMethodReturned!,
                                                    );
                                                  }
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                height: 34.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'm33hsh03' /* Change */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 6.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 4.0)),
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
