import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_component_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_box_grid/loader_box_grid_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorites_model.dart';
export 'favorites_model.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  late FavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Favorites'});
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
                            'lged1lff' /* Favorites */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: true,
                          showSearch: false,
                          searchTableName: 'products',
                          fieldsToReturnFromSearchTable:
                              'id,name,description,price,default_image_url,name_arabic,name_kurdish,description_arabic,description_kurdish',
                          fieldsToSearchIn:
                              'name,description,default_image_url,name_arabic,name_kurdish,description_arabic,description_kurdish',
                          searchTitle: 'Products',
                          preDefineSearch:
                              'status=${ProductStatus.Available.name}',
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<UserFavoritesRow>>(
                          future: UserFavoritesTable().queryRows(
                            queryFn: (q) => q.eq(
                              'user_id',
                              currentUserUid,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const EmptyComponentWidget();
                            }
                            List<UserFavoritesRow>
                                userFavoritesUserFavoritesRowList =
                                snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '8rlv9bsq' /* Your Favorite Products */,
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
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
                                                                    .titleSmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: FutureBuilder<List<ProductsRow>>(
                                        future: ProductsTable().queryRows(
                                          queryFn: (q) => q.in_(
                                            'id',
                                            FFAppState().UserFavorites,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return LoaderBoxGridWidget(
                                              numberOfItems: 4,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: 8.0,
                                              shimmerColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            );
                                          }
                                          List<ProductsRow>
                                              staggeredViewProductsRowList =
                                              snapshot.data!;

                                          if (staggeredViewProductsRowList
                                              .isEmpty) {
                                            return EmptyStateWidget(
                                              title: FFLocalizations.of(context)
                                                  .getText(
                                                'hd4yj7a0' /* No favorites yet! */,
                                              ),
                                              message:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '8m37z2ps' /* You can add a favorite product... */,
                                              ),
                                              actionButton: () async {},
                                            );
                                          }

                                          return MasonryGridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            itemCount:
                                                staggeredViewProductsRowList
                                                    .length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, staggeredViewIndex) {
                                              final staggeredViewProductsRow =
                                                  staggeredViewProductsRowList[
                                                      staggeredViewIndex];
                                              return wrapWithModel(
                                                model: _model.productCardModels
                                                    .getModel(
                                                  staggeredViewProductsRow.id
                                                      .toString(),
                                                  staggeredViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: ProductCardWidget(
                                                  key: Key(
                                                    'Keyixd_${staggeredViewProductsRow.id.toString()}',
                                                  ),
                                                  image:
                                                      staggeredViewProductsRow
                                                          .defaultImageUrl!,
                                                  productName:
                                                      staggeredViewProductsRow
                                                          .name,
                                                  price:
                                                      staggeredViewProductsRow
                                                          .price,
                                                  discount:
                                                      staggeredViewProductsRow
                                                          .discountPercent,
                                                  reviewRate:
                                                      staggeredViewProductsRow
                                                          .reviewRate,
                                                  numberOfReviews:
                                                      staggeredViewProductsRow
                                                          .numberOfReviews,
                                                  productId:
                                                      staggeredViewProductsRow
                                                          .id,
                                                  marketID: userFavoritesUserFavoritesRowList
                                                              .where((e) =>
                                                                  (e.productId ==
                                                                      staggeredViewProductsRow
                                                                          .id) &&
                                                                  (e.userId ==
                                                                      currentUserUid))
                                                              .toList().isNotEmpty
                                                      ? userFavoritesUserFavoritesRowList
                                                          .where((e) =>
                                                              (e.productId ==
                                                                  staggeredViewProductsRow
                                                                      .id) &&
                                                              (e.userId ==
                                                                  currentUserUid))
                                                          .toList()
                                                          .first
                                                          .marketId
                                                      : null,
                                                  discountedPrice:
                                                      staggeredViewProductsRow
                                                          .discountedPrice,
                                                  imagesUrl:
                                                      staggeredViewProductsRow
                                                          .imagesUrl,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 24.0))
                                      .addToStart(const SizedBox(height: 24.0))
                                      .addToEnd(const SizedBox(height: 24.0)),
                                ),
                              ),
                            );
                          },
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
