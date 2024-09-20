import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/categories_item/categories_item_widget.dart';
import '/components/empty_component_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_box_grid_product/loader_box_grid_product_widget.dart';
import '/components/loaders/loader_box_row/loader_box_row_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_category_model.dart';
export 'products_category_model.dart';

class ProductsCategoryWidget extends StatefulWidget {
  const ProductsCategoryWidget({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  final int? categoryId;
  final String? categoryTitle;

  @override
  State<ProductsCategoryWidget> createState() => _ProductsCategoryWidgetState();
}

class _ProductsCategoryWidgetState extends State<ProductsCategoryWidget> {
  late ProductsCategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsCategoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProductsCategory'});
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: valueOrDefault<String>(
                            widget!.categoryTitle,
                            'Category Title',
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: true,
                          searchTableName: 'view_products_categories',
                          fieldsToReturnFromSearchTable:
                              'product_id, product_name, product_description, product_default_image_url, product_name_arabic, product_name_kurdish, product_description_arabic, product_description_kurdish, category_id, status',
                          fieldsToSearchIn:
                              'product_name, product_description, product_name_arabic, product_name_kurdish, product_description_arabic, product_description_kurdish',
                          searchTitle: 'Products in ${widget!.categoryTitle}',
                          preDefineSearch:
                              'category_id=${widget!.categoryId?.toString()},status=${ProductStatus.Available.name},quantity_in_inventory>0',
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
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
                                          .enableAdvertisementOnSubCategories) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FutureBuilder<List<AdvertisingRow>>(
                                          future: AdvertisingTable().queryRows(
                                            queryFn: (q) => q
                                                .eq(
                                                  'status',
                                                  'Active',
                                                )
                                                .contains(
                                                  'ads_place',
                                                  '{${AdvertisePlacesInMobileApp.SubCategories.name}}',
                                                ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Container(
                                                width: double.infinity,
                                                height: 0.0,
                                                child: EmptyComponentWidget(),
                                              );
                                            }
                                            List<AdvertisingRow>
                                                containerAdvertisingRowList =
                                                snapshot.data!;

                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: valueOrDefault<double>(
                                                  containerAdvertisingRowList
                                                              .length >
                                                          0
                                                      ? 160.0
                                                      : 0.0,
                                                  160.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final containerVar =
                                                          containerAdvertisingRowList
                                                              .toList();

                                                      return Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: PageView.builder(
                                                          controller: _model
                                                                  .pageViewController ??=
                                                              PageController(
                                                                  initialPage: max(
                                                                      0,
                                                                      min(
                                                                          0,
                                                                          containerVar.length -
                                                                              1))),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              containerVar
                                                                  .length,
                                                          itemBuilder: (context,
                                                              containerVarIndex) {
                                                            final containerVarItem =
                                                                containerVar[
                                                                    containerVarIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PRODUCTS_CATEGORY_Container_gi83dz0u_ON_');
                                                                logFirebaseEvent(
                                                                    'AdvertiseBanner_action_block');
                                                                await action_blocks
                                                                    .advertisementOnClick(
                                                                  context,
                                                                  advertisement:
                                                                      containerVarItem,
                                                                );
                                                              },
                                                              child:
                                                                  AdvertiseBannerWidget(
                                                                key: Key(
                                                                    'Keygi8_${containerVarIndex}_of_${containerVar.length}'),
                                                                advertise:
                                                                    containerVarItem,
                                                                indexInList:
                                                                    containerVarIndex,
                                                                numberOfItems:
                                                                    containerAdvertisingRowList
                                                                        .length,
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
                                      ],
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(),
                                    );
                                  }
                                },
                              ),
                              FutureBuilder<List<CategoriesRow>>(
                                future: CategoriesTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'is_sub_category',
                                        true,
                                      )
                                      .eq(
                                        'parent_id',
                                        widget!.categoryId,
                                      ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 75.0,
                                        child: LoaderBoxRowWidget(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          shimmerColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          numberOfItems: 4,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CategoriesRow>
                                      subCAatsCategoriesRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible:
                                          subCAatsCategoriesRowList.isNotEmpty,
                                      child: Container(
                                        height: 75.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final subCaatsVar =
                                                subCAatsCategoriesRowList
                                                    .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                10.0,
                                                0,
                                                10.0,
                                                0,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: subCaatsVar.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 10.0),
                                              itemBuilder:
                                                  (context, subCaatsVarIndex) {
                                                final subCaatsVarItem =
                                                    subCaatsVar[
                                                        subCaatsVarIndex];
                                                return CategoriesItemWidget(
                                                  key: Key(
                                                      'Key5kw_${subCaatsVarIndex}_of_${subCaatsVar.length}'),
                                                  photo:
                                                      subCaatsVarItem.imageUrl,
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    enText:
                                                        subCaatsVarItem.name,
                                                    arText: subCaatsVarItem
                                                                    .nameArabic !=
                                                                null &&
                                                            subCaatsVarItem
                                                                    .nameArabic !=
                                                                ''
                                                        ? subCaatsVarItem
                                                            .nameArabic
                                                        : subCaatsVarItem.name,
                                                    faText: subCaatsVarItem
                                                                    .nameKurdish !=
                                                                null &&
                                                            subCaatsVarItem
                                                                    .nameKurdish !=
                                                                ''
                                                        ? subCaatsVarItem
                                                            .nameKurdish
                                                        : subCaatsVarItem.name,
                                                  ),
                                                  categoryId:
                                                      subCaatsVarItem.id,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: FutureBuilder<
                                    List<ViewProductsCategoriesRow>>(
                                  future:
                                      ViewProductsCategoriesTable().queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'category_id',
                                          widget!.categoryId,
                                        )
                                        .eq(
                                          'status',
                                          ProductStatus.Available.name,
                                        )
                                        .gt(
                                          'quantity_in_inventory',
                                          0,
                                        ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return LoaderBoxGridProductWidget(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shimmerColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        numberOfItems: 4,
                                      );
                                    }
                                    List<ViewProductsCategoriesRow>
                                        gridViewViewProductsCategoriesRowList =
                                        snapshot.data!;

                                    if (gridViewViewProductsCategoriesRowList
                                        .isEmpty) {
                                      return EmptyStateWidget(
                                        message:
                                            FFLocalizations.of(context).getText(
                                          'q6exawo9' /* There is no product in this ca... */,
                                        ),
                                        actionButton: () async {},
                                      );
                                    }

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12.0,
                                        mainAxisSpacing: 4.0,
                                        childAspectRatio: 0.62,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewViewProductsCategoriesRowList
                                              .length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewViewProductsCategoriesRow =
                                            gridViewViewProductsCategoriesRowList[
                                                gridViewIndex];
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: ProductCardWidget(
                                            key: Key(
                                                'Keyuhv_${gridViewIndex}_of_${gridViewViewProductsCategoriesRowList.length}'),
                                            image:
                                                gridViewViewProductsCategoriesRow
                                                    .productDefaultImageUrl!,
                                            productName:
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText:
                                                  gridViewViewProductsCategoriesRow
                                                      .productName,
                                              arText: gridViewViewProductsCategoriesRow
                                                              .productNameArabic !=
                                                          null &&
                                                      gridViewViewProductsCategoriesRow
                                                              .productNameArabic !=
                                                          ''
                                                  ? gridViewViewProductsCategoriesRow
                                                      .productNameArabic
                                                  : gridViewViewProductsCategoriesRow
                                                      .productName,
                                              faText: gridViewViewProductsCategoriesRow
                                                              .productNameKurdish !=
                                                          null &&
                                                      gridViewViewProductsCategoriesRow
                                                              .productNameKurdish !=
                                                          ''
                                                  ? gridViewViewProductsCategoriesRow
                                                      .productNameKurdish
                                                  : gridViewViewProductsCategoriesRow
                                                      .productName,
                                            ),
                                            price:
                                                gridViewViewProductsCategoriesRow
                                                    .productPrice,
                                            discount:
                                                gridViewViewProductsCategoriesRow
                                                    .productDiscountPercent,
                                            reviewRate:
                                                gridViewViewProductsCategoriesRow
                                                    .productReviewRate,
                                            numberOfReviews:
                                                gridViewViewProductsCategoriesRow
                                                    .productNumberOfReviews,
                                            productId:
                                                gridViewViewProductsCategoriesRow
                                                    .productId!,
                                            discountedPrice:
                                                gridViewViewProductsCategoriesRow
                                                    .productDiscountedPrice,
                                            imagesUrl:
                                                gridViewViewProductsCategoriesRow
                                                    .productImagesUrl,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 20.0))
                                .addToStart(SizedBox(height: 20.0)),
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
