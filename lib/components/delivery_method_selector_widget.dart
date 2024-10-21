import '/backend/supabase/supabase.dart';
import '/components/loaders/loader_query/loader_query_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delivery_method_selector_model.dart';
export 'delivery_method_selector_model.dart';

class DeliveryMethodSelectorWidget extends StatefulWidget {
  const DeliveryMethodSelectorWidget({
    super.key,
    required this.options,
  });

  final List<String>? options;

  @override
  State<DeliveryMethodSelectorWidget> createState() =>
      _DeliveryMethodSelectorWidgetState();
}

class _DeliveryMethodSelectorWidgetState
    extends State<DeliveryMethodSelectorWidget> {
  late DeliveryMethodSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryMethodSelectorModel());

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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 440.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 40.0,
                  color: Color(0x46000000),
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1lrst0pi' /* Select Delivery Method */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    const Shadow(
                                      color: Color(0x2503080C),
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 6.0,
                                    )
                                  ],
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 10.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'DELIVERY_METHOD_SELECTOR_keyboard_arrow_');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<DeliveryMethodTypesRow>>(
                      future: DeliveryMethodTypesTable().queryRows(
                        queryFn: (q) => q.order('sort_order', ascending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: LoaderQueryWidget(),
                          );
                        }
                        List<DeliveryMethodTypesRow>
                            listViewDeliveryMethodTypesRowList = snapshot.data!;

                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            20.0,
                            0,
                            20.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewDeliveryMethodTypesRowList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewDeliveryMethodTypesRow =
                                listViewDeliveryMethodTypesRowList[
                                    listViewIndex];
                            return Visibility(
                              visible: (listViewDeliveryMethodTypesRow.name !=
                                      'Default') &&
                                  functions.stringListContainsItem(
                                      widget.options!.toList(),
                                      listViewDeliveryMethodTypesRow.name!),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DELIVERY_METHOD_SELECTOR_Container_ba7mm');
                                    logFirebaseEvent('Container_bottom_sheet');
                                    Navigator.pop(context,
                                        listViewDeliveryMethodTypesRow.name);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground40,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      child: Container(
                                                        width: 44.0,
                                                        height: 44.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewDeliveryMethodTypesRow
                                                                    .image!,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewDeliveryMethodTypesRow
                                                                    .name,
                                                                '-',
                                                              ),
                                                              arText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewDeliveryMethodTypesRow
                                                                    .arabicName,
                                                                '-',
                                                              ),
                                                              faText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewDeliveryMethodTypesRow
                                                                    .kurdishName,
                                                                '-',
                                                              ),
                                                            ),
                                                            maxLines: 2,
                                                            minFontSize: 8.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewDeliveryMethodTypesRow
                                                                    .description,
                                                                '-',
                                                              ),
                                                              arText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewDeliveryMethodTypesRow
                                                                    .descriptionArabic,
                                                                '-',
                                                              ),
                                                              faText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewDeliveryMethodTypesRow
                                                                    .descriptionKurdish,
                                                                '-',
                                                              ),
                                                            ),
                                                            maxLines: 2,
                                                            minFontSize: 8.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 6.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(),
                                                child: Icon(
                                                  FFIcons.kangleDown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 18.0,
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 4.0)),
                                          ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
