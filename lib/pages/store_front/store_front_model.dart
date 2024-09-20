import '/backend/supabase/supabase.dart';
import '/components/cart_badge_widget.dart';
import '/components/image_widget_widget.dart';
import '/components/market_type_badge_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/components/search_badge_widget.dart';
import '/components/share_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'store_front_widget.dart' show StoreFrontWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StoreFrontModel extends FlutterFlowModel<StoreFrontWidget> {
  ///  Local state fields for this page.

  MarketsRow? market;

  BrandsRow? brand;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in StoreFront widget.
  List<MarketsRow>? currentMarket;
  // Stores action output result for [Backend Call - Query Rows] action in StoreFront widget.
  List<BrandsRow>? currentBrand;
  // Model for ShareBadge component.
  late ShareBadgeModel shareBadgeModel;
  // Stores action output result for [Custom Action - generateProductStoreLink] action in ShareBadge widget.
  String? generatedLink;
  // Model for SearchBadge component.
  late SearchBadgeModel searchBadgeModel;
  // Model for CartBadge component.
  late CartBadgeModel cartBadgeModel;
  // Model for ImageWidget component.
  late ImageWidgetModel imageWidgetModel1;
  // Model for ImageWidget component.
  late ImageWidgetModel imageWidgetModel2;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for MarketTypeBadge component.
  late MarketTypeBadgeModel marketTypeBadgeModel;
  // Model for ImageWidget component.
  late ImageWidgetModel imageWidgetModel4;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for ProductCard dynamic component.
  late FlutterFlowDynamicModels<ProductCardModel> productCardModels2;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    shareBadgeModel = createModel(context, () => ShareBadgeModel());
    searchBadgeModel = createModel(context, () => SearchBadgeModel());
    cartBadgeModel = createModel(context, () => CartBadgeModel());
    imageWidgetModel1 = createModel(context, () => ImageWidgetModel());
    imageWidgetModel2 = createModel(context, () => ImageWidgetModel());
    marketTypeBadgeModel = createModel(context, () => MarketTypeBadgeModel());
    imageWidgetModel4 = createModel(context, () => ImageWidgetModel());
    productCardModels2 = FlutterFlowDynamicModels(() => ProductCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    shareBadgeModel.dispose();
    searchBadgeModel.dispose();
    cartBadgeModel.dispose();
    imageWidgetModel1.dispose();
    imageWidgetModel2.dispose();
    marketTypeBadgeModel.dispose();
    imageWidgetModel4.dispose();
    productCardModels2.dispose();
    navBarModel.dispose();
  }
}
