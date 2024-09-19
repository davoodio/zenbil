import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/capacitytems_widget.dart';
import '/components/cart_badge_widget.dart';
import '/components/color_items_widget.dart';
import '/components/counter_product_widget.dart';
import '/components/favorite_badge_widget.dart';
import '/components/market_type_badge_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/components/product_fav_toggle_widget.dart';
import '/components/review_box_widget.dart';
import '/components/review_summary_section_widget.dart';
import '/components/share_badge_widget.dart';
import '/components/shimmer_page_detail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_detail_widget.dart' show ProductDetailWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailModel extends FlutterFlowModel<ProductDetailWidget> {
  ///  Local state fields for this page.

  String activeTab = 'Description';

  int numberOfItemsAdded = 1;

  MarketsRow? marketData;

  bool defaultBusinessMarket = false;

  List<CartProductStruct> cartProducts = [];
  void addToCartProducts(CartProductStruct item) => cartProducts.add(item);
  void removeFromCartProducts(CartProductStruct item) =>
      cartProducts.remove(item);
  void removeAtIndexFromCartProducts(int index) => cartProducts.removeAt(index);
  void insertAtIndexInCartProducts(int index, CartProductStruct item) =>
      cartProducts.insert(index, item);
  void updateCartProductsAtIndex(
          int index, Function(CartProductStruct) updateFn) =>
      cartProducts[index] = updateFn(cartProducts[index]);

  bool isPageLoading = false;

  int cartProductCounter = 0;

  bool isSameProductFound = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ProductDetail widget.
  List<MarketsRow>? marketLoaded;
  // Stores action output result for [Backend Call - Query Rows] action in ProductDetail widget.
  List<ProductsRow>? productLoadedAction;
  // Stores action output result for [Backend Call - Query Rows] action in ProductDetail widget.
  List<BusinessesRow>? businessLoadedFromProduct;
  // Stores action output result for [Backend Call - Query Rows] action in ProductDetail widget.
  List<MarketsRow>? defaultMarketOfBusiness;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for ShareBadge component.
  late ShareBadgeModel shareBadgeModel;
  // Model for FavoriteBadge component.
  late FavoriteBadgeModel favoriteBadgeModel;
  // Model for CartBadge component.
  late CartBadgeModel cartBadgeModel;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for ProductFavToggle component.
  late ProductFavToggleModel productFavToggleModel;
  // Model for MarketTypeBadge component.
  late MarketTypeBadgeModel marketTypeBadgeModel;
  // Model for ColorItems component.
  late ColorItemsModel colorItemsModel;
  // Model for Capacitytems component.
  late CapacitytemsModel capacitytemsModel1;
  // Model for Capacitytems component.
  late CapacitytemsModel capacitytemsModel2;
  // Model for ReviewSummarySection component.
  late ReviewSummarySectionModel reviewSummarySectionModel;
  // State field(s) for MostHelpfulCheckboxListTile widget.
  bool? mostHelpfulCheckboxListTileValue;
  // Models for ReviewBox dynamic component.
  late FlutterFlowDynamicModels<ReviewBoxModel> reviewBoxModels;
  // Models for ProductCard dynamic component.
  late FlutterFlowDynamicModels<ProductCardModel> productCardModels;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 0;

  // Models for AdvertiseBanner dynamic component.
  late FlutterFlowDynamicModels<AdvertiseBannerModel> advertiseBannerModels;
  // Model for CounterProduct component.
  late CounterProductModel counterProductModel;
  // Model for ShimmerPageDetail component.
  late ShimmerPageDetailModel shimmerPageDetailModel;

  @override
  void initState(BuildContext context) {
    shareBadgeModel = createModel(context, () => ShareBadgeModel());
    favoriteBadgeModel = createModel(context, () => FavoriteBadgeModel());
    cartBadgeModel = createModel(context, () => CartBadgeModel());
    productFavToggleModel = createModel(context, () => ProductFavToggleModel());
    marketTypeBadgeModel = createModel(context, () => MarketTypeBadgeModel());
    colorItemsModel = createModel(context, () => ColorItemsModel());
    capacitytemsModel1 = createModel(context, () => CapacitytemsModel());
    capacitytemsModel2 = createModel(context, () => CapacitytemsModel());
    reviewSummarySectionModel =
        createModel(context, () => ReviewSummarySectionModel());
    reviewBoxModels = FlutterFlowDynamicModels(() => ReviewBoxModel());
    productCardModels = FlutterFlowDynamicModels(() => ProductCardModel());
    advertiseBannerModels =
        FlutterFlowDynamicModels(() => AdvertiseBannerModel());
    counterProductModel = createModel(context, () => CounterProductModel());
    shimmerPageDetailModel =
        createModel(context, () => ShimmerPageDetailModel());
  }

  @override
  void dispose() {
    shareBadgeModel.dispose();
    favoriteBadgeModel.dispose();
    cartBadgeModel.dispose();
    productFavToggleModel.dispose();
    marketTypeBadgeModel.dispose();
    colorItemsModel.dispose();
    capacitytemsModel1.dispose();
    capacitytemsModel2.dispose();
    reviewSummarySectionModel.dispose();
    reviewBoxModels.dispose();
    productCardModels.dispose();
    advertiseBannerModels.dispose();
    counterProductModel.dispose();
    shimmerPageDetailModel.dispose();
  }
}
