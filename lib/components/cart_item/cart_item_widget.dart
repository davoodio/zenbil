import '/backend/schema/structs/index.dart';
import '/components/counter_product_widget.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_item_model.dart';
export 'cart_item_model.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.productCart,
    required this.index,
  });

  final CartProductStruct? productCart;
  final int? index;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late CartItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemModel());

    _model.noteSpecialRequestTextFieldTextController ??=
        TextEditingController();
    _model.noteSpecialRequestTextFieldFocusNode ??= FocusNode();

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

    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 96.0,
                    height: 96.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: FlutterFlowTheme.of(context).boxShadow,
                          offset: const Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: widget.productCart!.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.productCart?.productName,
                                    'name',
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.productCart?.productDescription,
                                    'description',
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.productCart?.isDiscounted ?? true)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        functions.applyCorrectNumberFormatting(
                                            widget.productCart!.price *
                                                widget.productCart!.quantity *
                                                FFAppState()
                                                    .country
                                                    .currencyExchangeRate,
                                            FFAppState().country.currencyCode,
                                            FFAppConstants.useCurrencySymbol,
                                            true),
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '-${formatNumber(
                                            widget
                                                .productCart?.discountPercent,
                                            formatType: FormatType.custom,
                                            format: '###.0',
                                            locale: '',
                                          )}%',
                                          '-',
                                        ),
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      functions.applyCorrectNumberFormatting(
                                          widget.productCart!.discountedPrice *
                                              _model.counterProductModel
                                                  .counterNumber *
                                              FFAppState()
                                                  .country
                                                  .currencyExchangeRate,
                                          FFAppState().country.currencyCode,
                                          FFAppConstants.useCurrencySymbol,
                                          true),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.counterProductModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: CounterProductWidget(
                                  initialNumber: widget.productCart?.quantity,
                                  maxNumber:
                                      widget.productCart?.quantityInInventory,
                                  minNumber: 0,
                                  counterStep: 1,
                                  height: 28.0,
                                  removeIcon: Icon(
                                    FFIcons.ktrash,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 13.0,
                                  ),
                                  plusIcon: Icon(
                                    FFIcons.kplus,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 13.0,
                                  ),
                                  plusAction: () async {
                                    logFirebaseEvent(
                                        'CART_ITEM_Container_auer712q_CALLBACK');
                                    logFirebaseEvent(
                                        'CounterProduct_update_app_state');
                                    FFAppState().updateCartStruct(
                                      (e) =>
                                          e..lastUpdates = getCurrentTimestamp,
                                    );
                                    logFirebaseEvent(
                                        'CounterProduct_update_app_state');
                                    FFAppState().updateCartStruct(
                                      (e) => e
                                        ..updateProducts(
                                          (e) => e[widget.index!]
                                            ..incrementQuantity(1),
                                        ),
                                    );
                                    FFAppState().update(() {});
                                    logFirebaseEvent(
                                        'CounterProduct_custom_action');
                                    await actions.printAction(
                                      'Removed from app state',
                                    );
                                  },
                                  removeAction: () async {
                                    logFirebaseEvent(
                                        'CART_ITEM_Container_auer712q_CALLBACK');
                                    var shouldSetState = false;
                                    if (widget.productCart?.quantity == 1) {
                                      logFirebaseEvent(
                                          'CounterProduct_bottom_sheet');
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
                                                  FFIcons.kcheck,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'amntffow' /* Confirm! */,
                                                ),
                                                body:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0w5bhe66' /* You sure you want to remove th... */,
                                                ),
                                                isConfirm: true,
                                                actionButtonText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'bzz1vsjq' /* Yes, Remove */,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.removeApproveCopy = value));

                                      shouldSetState = true;
                                      if (_model.removeApproveCopy!) {
                                        logFirebaseEvent(
                                            'CounterProduct_update_app_state');
                                        FFAppState().updateCartStruct(
                                          (e) => e
                                            ..lastUpdates = getCurrentTimestamp,
                                        );
                                        FFAppState().update(() {});
                                        logFirebaseEvent(
                                            'CounterProduct_update_app_state');
                                        FFAppState().updateCartStruct(
                                          (e) => e
                                            ..updateProducts(
                                              (e) => e.removeAt(widget.index!),
                                            ),
                                        );
                                        FFAppState().update(() {});
                                        logFirebaseEvent(
                                            'CounterProduct_custom_action');
                                        await actions.printAction(
                                          'Removed from app state',
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'CounterProduct_custom_action');
                                        await actions.printAction(
                                          'Back to 1',
                                        );
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }
                                    } else {
                                      logFirebaseEvent(
                                          'CounterProduct_update_app_state');
                                      FFAppState().updateCartStruct(
                                        (e) => e
                                          ..updateProducts(
                                            (e) => e[widget.index!]
                                              ..incrementQuantity(-1),
                                          ),
                                      );
                                      FFAppState().update(() {});
                                    }

                                    if (shouldSetState) safeSetState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                ),
              ].divide(const SizedBox(width: 16.0)),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CART_ITEM_COMP_Row_cian26t3_ON_TAP');
                  logFirebaseEvent('Row_update_component_state');
                  _model.showNote = !_model.showNote;
                  safeSetState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      FFIcons.knotePin,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'twjbyt8b' /* Add note and special requests */,
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
              if (_model.showNote)
                TextFormField(
                  controller: _model.noteSpecialRequestTextFieldTextController,
                  focusNode: _model.noteSpecialRequestTextFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.noteSpecialRequestTextFieldTextController',
                    const Duration(milliseconds: 100),
                    () async {
                      logFirebaseEvent(
                          'CART_ITEM_NoteSpecialRequestTextField_ON');
                      logFirebaseEvent(
                          'NoteSpecialRequestTextField_update_app_s');
                      FFAppState().updateCartStruct(
                        (e) => e
                          ..updateProducts(
                            (e) => e[widget.index!]
                              ..note = _model
                                  .noteSpecialRequestTextFieldTextController
                                  .text,
                          ),
                      );
                      _model.updatePage(() {});
                    },
                  ),
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      '923svstl' /* special request */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).lightBlack,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lightBlack,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelMediumFamily),
                      ),
                  maxLines: 3,
                  minLines: 1,
                  validator: _model
                      .noteSpecialRequestTextFieldTextControllerValidator
                      .asValidator(context),
                ),
            ].divide(const SizedBox(height: 8.0)),
          ),
        ].divide(const SizedBox(height: 16.0)),
      ),
    );
  }
}
