import '/backend/supabase/supabase.dart';
import '/components/brand_item/brand_item_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_box_grid/loader_box_grid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'brands_model.dart';
export 'brands_model.dart';

class BrandsWidget extends StatefulWidget {
  const BrandsWidget({super.key});

  @override
  State<BrandsWidget> createState() => _BrandsWidgetState();
}

class _BrandsWidgetState extends State<BrandsWidget> {
  late BrandsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Brands'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            'koci1n5x' /* Brands */,
                          ),
                          showBackButton: true,
                          showCart: true,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: FutureBuilder<List<MarketsRow>>(
                                  future: MarketsTable().queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'status',
                                          FFAppState()
                                              .DataTypeEnums
                                              .marketStatuses
                                              .active,
                                        )
                                        .eq(
                                          'type',
                                          FFAppState()
                                              .DataTypeEnums
                                              .marketTypes
                                              .brand,
                                        ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: LoaderBoxGridWidget(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius: 8.0,
                                          shimmerColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          numberOfItems: 7,
                                        ),
                                      );
                                    }
                                    List<MarketsRow>
                                        staggeredViewMarketsRowList =
                                        snapshot.data!;

                                    if (staggeredViewMarketsRowList.isEmpty) {
                                      return Center(
                                        child: EmptyStateWidget(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'z6bsloz7' /* Sorry! */,
                                          ),
                                          message: FFLocalizations.of(context)
                                              .getText(
                                            '076dcrmf' /* There is no available market i... */,
                                          ),
                                          icon: Icon(
                                            FFIcons.kflower,
                                            color: FlutterFlowTheme.of(context)
                                                .lightBlack,
                                            size: 44.0,
                                          ),
                                          actionButton: () async {},
                                        ),
                                      );
                                    }

                                    return MasonryGridView.builder(
                                      gridDelegate:
                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      crossAxisSpacing: 20.0,
                                      mainAxisSpacing: 20.0,
                                      itemCount:
                                          staggeredViewMarketsRowList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewMarketsRow =
                                            staggeredViewMarketsRowList[
                                                staggeredViewIndex];
                                        return Container(
                                          height: 140.0,
                                          decoration: const BoxDecoration(),
                                          child: Semantics(
                                            label: 'Brand details',
                                            child: BrandItemWidget(
                                              key: Key(
                                                  'Key2ie_${staggeredViewIndex}_of_${staggeredViewMarketsRowList.length}'),
                                              photo: staggeredViewMarketsRow
                                                  .logoUrl,
                                              title:
                                                  staggeredViewMarketsRow.name,
                                              brandId:
                                                  staggeredViewMarketsRow.id,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ]
                                .addToStart(const SizedBox(height: 20.0))
                                .addToEnd(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
