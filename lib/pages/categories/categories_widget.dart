import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/categories_item/categories_item_widget.dart';
import '/components/categories_item_new/categories_item_new_widget.dart';
import '/components/empty_component_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_box_column/loader_box_column_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'categories_model.dart';
export 'categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    super.key,
    bool? showBackButton,
  }) : showBackButton = showBackButton ?? false;

  final bool showBackButton;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late CategoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Categories'});
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
                            'qe6onoo4' /* Categories */,
                          ),
                          showBackButton: widget.showBackButton,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: true,
                          searchTableName: 'categories',
                          fieldsToReturnFromSearchTable:
                              'id, name, description, image_url, name_arabic, name_kurdish, is_sub_category',
                          fieldsToSearchIn: 'name',
                          searchTitle: 'Categories',
                          preDefineSearch: '',
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FutureBuilder<List<CategoriesRow>>(
                                future: CategoriesTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'is_sub_category',
                                        false,
                                      )
                                      .order('name', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: LoaderBoxColumnWidget(
                                        height: 100.0,
                                        borderRadius: 5.0,
                                        numberOfItems: 14,
                                      ),
                                    );
                                  }
                                  List<CategoriesRow>
                                      allCategoriesCategoriesRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (FFAppState()
                                                    .AppSettings
                                                    .enableAdvertisement &&
                                                FFAppState()
                                                    .AppSettings
                                                    .enableAdvertisementOnCategories) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<
                                                      List<AdvertisingRow>>(
                                                    future: AdvertisingTable()
                                                        .queryRows(
                                                      queryFn: (q) => q
                                                          .eq(
                                                            'status',
                                                            'Active',
                                                          )
                                                          .contains(
                                                            'ads_place',
                                                            '{${AdvertisePlacesInMobileApp.Categories.name}}',
                                                          ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return const SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 0.0,
                                                          child:
                                                              EmptyComponentWidget(),
                                                        );
                                                      }
                                                      List<AdvertisingRow>
                                                          containerAdvertisingRowList =
                                                          snapshot.data!;

                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            containerAdvertisingRowList.isNotEmpty
                                                                ? 160.0
                                                                : 0.0,
                                                            160.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar =
                                                                    containerAdvertisingRowList
                                                                        .toList();

                                                                return SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  child: PageView
                                                                      .builder(
                                                                    controller: _model
                                                                            .pageViewController ??=
                                                                        PageController(
                                                                            initialPage:
                                                                                max(0, min(0, containerVar.length - 1))),
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        containerVar
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            containerVarIndex) {
                                                                      final containerVarItem =
                                                                          containerVar[
                                                                              containerVarIndex];
                                                                      return Semantics(
                                                                        label:
                                                                            'Advertise banner',
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('CATEGORIES_Container_k9cl0peq_ON_TAP');
                                                                            logFirebaseEvent('AdvertiseBanner_action_block');
                                                                            await action_blocks.advertisementOnClick(
                                                                              context,
                                                                              advertisement: containerVarItem,
                                                                            );
                                                                          },
                                                                          child:
                                                                              AdvertiseBannerWidget(
                                                                            key:
                                                                                Key('Keyk9c_${containerVarIndex}_of_${containerVar.length}'),
                                                                            advertise:
                                                                                containerVarItem,
                                                                            indexInList:
                                                                                containerVarIndex,
                                                                            numberOfItems:
                                                                                containerAdvertisingRowList.length,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Container(
                                                decoration: const BoxDecoration(),
                                              );
                                            }
                                          },
                                        ),
                                        Builder(
                                          builder: (context) {
                                            if (false) {
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final allCategoriesVar =
                                                        allCategoriesCategoriesRowList
                                                            .where((e) =>
                                                                (e.name !=
                                                                    'Men') &&
                                                                (e.name !=
                                                                    'Women'))
                                                            .toList();
                                                    if (allCategoriesVar
                                                        .isEmpty) {
                                                      return Center(
                                                        child: EmptyStateWidget(
                                                          title: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '32agg2q1' /* Sorry! */,
                                                          ),
                                                          message:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '7qzsn9r3' /* There is no available market i... */,
                                                          ),
                                                          icon: Icon(
                                                            FFIcons.kflower,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lightBlack,
                                                            size: 44.0,
                                                          ),
                                                          actionButton:
                                                              () async {},
                                                        ),
                                                      );
                                                    }

                                                    return MasonryGridView
                                                        .builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                      ),
                                                      crossAxisSpacing: 20.0,
                                                      mainAxisSpacing: 20.0,
                                                      itemCount:
                                                          allCategoriesVar
                                                              .length,
                                                      shrinkWrap: true,
                                                      itemBuilder: (context,
                                                          allCategoriesVarIndex) {
                                                        final allCategoriesVarItem =
                                                            allCategoriesVar[
                                                                allCategoriesVarIndex];
                                                        return Container(
                                                          height: 75.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child:
                                                              CategoriesItemWidget(
                                                            key: Key(
                                                                'Key1l0_${allCategoriesVarIndex}_of_${allCategoriesVar.length}'),
                                                            photo:
                                                                allCategoriesVarItem
                                                                    .imageUrl,
                                                            title: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              enText:
                                                                  allCategoriesVarItem
                                                                      .name,
                                                              arText: allCategoriesVarItem
                                                                              .nameArabic !=
                                                                          null &&
                                                                      allCategoriesVarItem
                                                                              .nameArabic !=
                                                                          ''
                                                                  ? allCategoriesVarItem
                                                                      .nameArabic
                                                                  : allCategoriesVarItem
                                                                      .name,
                                                              faText: allCategoriesVarItem
                                                                              .nameKurdish !=
                                                                          null &&
                                                                      allCategoriesVarItem
                                                                              .nameKurdish !=
                                                                          ''
                                                                  ? allCategoriesVarItem
                                                                      .nameKurdish
                                                                  : allCategoriesVarItem
                                                                      .name,
                                                            ),
                                                            categoryId:
                                                                allCategoriesVarItem
                                                                    .id,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                decoration: const BoxDecoration(),
                                              );
                                            }
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final allCategoriesVar =
                                                  allCategoriesCategoriesRowList
                                                      .where((e) =>
                                                          (e.name != 'Men') &&
                                                          (e.name != 'Women') &&
                                                          (e.name != 'All'))
                                                      .toList();
                                              if (allCategoriesVar.isEmpty) {
                                                return Center(
                                                  child: EmptyStateWidget(
                                                    title: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ot6vxz23' /* Sorry! */,
                                                    ),
                                                    message: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ky7uc4i6' /* There is no available market i... */,
                                                    ),
                                                    icon: Icon(
                                                      FFIcons.kflower,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lightBlack,
                                                      size: 44.0,
                                                    ),
                                                    actionButton: () async {},
                                                  ),
                                                );
                                              }

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    allCategoriesVar.length,
                                                    (allCategoriesVarIndex) {
                                                  final allCategoriesVarItem =
                                                      allCategoriesVar[
                                                          allCategoriesVarIndex];
                                                  return Semantics(
                                                    label: 'Ccategory details',
                                                    child:
                                                        CategoriesItemNewWidget(
                                                      key: Key(
                                                          'Keynti_${allCategoriesVarIndex}_of_${allCategoriesVar.length}'),
                                                      photo:
                                                          allCategoriesVarItem
                                                              .imageUrl,
                                                      title: FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            allCategoriesVarItem
                                                                .name,
                                                        arText: allCategoriesVarItem
                                                                        .nameArabic !=
                                                                    null &&
                                                                allCategoriesVarItem
                                                                        .nameArabic !=
                                                                    ''
                                                            ? allCategoriesVarItem
                                                                .nameArabic
                                                            : allCategoriesVarItem
                                                                .name,
                                                        faText: allCategoriesVarItem
                                                                        .nameKurdish !=
                                                                    null &&
                                                                allCategoriesVarItem
                                                                        .nameKurdish !=
                                                                    ''
                                                            ? allCategoriesVarItem
                                                                .nameKurdish
                                                            : allCategoriesVarItem
                                                                .name,
                                                      ),
                                                      categoryId:
                                                          allCategoriesVarItem
                                                              .id,
                                                    ),
                                                  );
                                                }).divide(
                                                    const SizedBox(height: 8.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ]
                                          .addToStart(const SizedBox(height: 20.0))
                                          .addToEnd(const SizedBox(height: 100.0)),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: NavBarWidget(
                      activePage: FFLocalizations.of(context).getText(
                        '2skp4dhb' /* Categories */,
                      ),
                    ),
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
