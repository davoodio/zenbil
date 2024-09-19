import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/advertise_banner_widget.dart';
import '/components/brand_item/brand_item_widget.dart';
import '/components/cart_badge_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/notification_badge_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'zenbil_widget.dart' show ZenbilWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ZenbilModel extends FlutterFlowModel<ZenbilWidget> {
  ///  Local state fields for this page.

  String? activeCategory = 'All';

  bool pageIsReady = false;

  List<ViewProductsFilterByCategoryRow> productsCategory = [];
  void addToProductsCategory(ViewProductsFilterByCategoryRow item) =>
      productsCategory.add(item);
  void removeFromProductsCategory(ViewProductsFilterByCategoryRow item) =>
      productsCategory.remove(item);
  void removeAtIndexFromProductsCategory(int index) =>
      productsCategory.removeAt(index);
  void insertAtIndexInProductsCategory(
          int index, ViewProductsFilterByCategoryRow item) =>
      productsCategory.insert(index, item);
  void updateProductsCategoryAtIndex(
          int index, Function(ViewProductsFilterByCategoryRow) updateFn) =>
      productsCategory[index] = updateFn(productsCategory[index]);

  List<String> mainCategories = ['All'];
  void addToMainCategories(String item) => mainCategories.add(item);
  void removeFromMainCategories(String item) => mainCategories.remove(item);
  void removeAtIndexFromMainCategories(int index) =>
      mainCategories.removeAt(index);
  void insertAtIndexInMainCategories(int index, String item) =>
      mainCategories.insert(index, item);
  void updateMainCategoriesAtIndex(int index, Function(String) updateFn) =>
      mainCategories[index] = updateFn(mainCategories[index]);

  List<CategoriesRow> mainCategoriesRows = [];
  void addToMainCategoriesRows(CategoriesRow item) =>
      mainCategoriesRows.add(item);
  void removeFromMainCategoriesRows(CategoriesRow item) =>
      mainCategoriesRows.remove(item);
  void removeAtIndexFromMainCategoriesRows(int index) =>
      mainCategoriesRows.removeAt(index);
  void insertAtIndexInMainCategoriesRows(int index, CategoriesRow item) =>
      mainCategoriesRows.insert(index, item);
  void updateMainCategoriesRowsAtIndex(
          int index, Function(CategoriesRow) updateFn) =>
      mainCategoriesRows[index] = updateFn(mainCategoriesRows[index]);

  List<MarketsRow> markets = [];
  void addToMarkets(MarketsRow item) => markets.add(item);
  void removeFromMarkets(MarketsRow item) => markets.remove(item);
  void removeAtIndexFromMarkets(int index) => markets.removeAt(index);
  void insertAtIndexInMarkets(int index, MarketsRow item) =>
      markets.insert(index, item);
  void updateMarketsAtIndex(int index, Function(MarketsRow) updateFn) =>
      markets[index] = updateFn(markets[index]);

  List<AdvertisingRow> advertisements = [];
  void addToAdvertisements(AdvertisingRow item) => advertisements.add(item);
  void removeFromAdvertisements(AdvertisingRow item) =>
      advertisements.remove(item);
  void removeAtIndexFromAdvertisements(int index) =>
      advertisements.removeAt(index);
  void insertAtIndexInAdvertisements(int index, AdvertisingRow item) =>
      advertisements.insert(index, item);
  void updateAdvertisementsAtIndex(
          int index, Function(AdvertisingRow) updateFn) =>
      advertisements[index] = updateFn(advertisements[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 0;

  // Models for AdvertiseBanner dynamic component.
  late FlutterFlowDynamicModels<AdvertiseBannerModel> advertiseBannerModels;
  // Models for BrandItem dynamic component.
  late FlutterFlowDynamicModels<BrandItemModel> brandItemModels;
  // Models for ProductCard dynamic component.
  late FlutterFlowDynamicModels<ProductCardModel> productCardModels5;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for NotificationBadge component.
  late NotificationBadgeModel notificationBadgeModel;
  // Model for CartBadge component.
  late CartBadgeModel cartBadgeModel;

  @override
  void initState(BuildContext context) {
    advertiseBannerModels =
        FlutterFlowDynamicModels(() => AdvertiseBannerModel());
    brandItemModels = FlutterFlowDynamicModels(() => BrandItemModel());
    productCardModels5 = FlutterFlowDynamicModels(() => ProductCardModel());
    navBarModel = createModel(context, () => NavBarModel());
    notificationBadgeModel =
        createModel(context, () => NotificationBadgeModel());
    cartBadgeModel = createModel(context, () => CartBadgeModel());
  }

  @override
  void dispose() {
    advertiseBannerModels.dispose();
    brandItemModels.dispose();
    productCardModels5.dispose();
    navBarModel.dispose();
    notificationBadgeModel.dispose();
    cartBadgeModel.dispose();
  }

  /// Action blocks.
  Future loadHomePageData(BuildContext context) async {
    List<ViewProductsFilterByCategoryRow>? allProductsCopy;
    List<CategoriesRow>? allMainCategoriesCopy;
    List<MarketsRow>? allMarkets;
    List<AdvertisingRow>? advertisingQuery;

    await Future.wait([
      Future(() async {
        logFirebaseEvent('LoadHomePageData_backend_call');
        allProductsCopy = await ViewProductsFilterByCategoryTable().queryRows(
          queryFn: (q) => q
              .eq(
                'product_status',
                ProductStatus.Available.name,
              )
              .gt(
                'product_quantity_in_inventory',
                0,
              ),
        );
        logFirebaseEvent('LoadHomePageData_update_page_state');
        productsCategory = functions
            .uniquesFromProductsCategoryView(allProductsCopy?.toList())
            .toList()
            .cast<ViewProductsFilterByCategoryRow>();
      }),
      Future(() async {
        logFirebaseEvent('LoadHomePageData_backend_call');
        allMainCategoriesCopy = await CategoriesTable().queryRows(
          queryFn: (q) => q
              .eq(
                'is_sub_category',
                false,
              )
              .order('name', ascending: true),
        );
        logFirebaseEvent('LoadHomePageData_update_page_state');
        mainCategories = allMainCategoriesCopy!
            .map((e) => e.name)
            .withoutNulls
            .toList()
            .toList()
            .cast<String>();
        mainCategoriesRows = allMainCategoriesCopy!
            .where((e) =>
                (e.name != 'All') && (e.name != 'Men') && (e.name != 'Women'))
            .toList()
            .toList()
            .cast<CategoriesRow>();
        logFirebaseEvent('LoadHomePageData_backend_call');
        allMarkets = await MarketsTable().queryRows(
          queryFn: (q) => q.eq(
            'status',
            MarketStatus.Active.name,
          ),
        );
        logFirebaseEvent('LoadHomePageData_update_page_state');
        markets = allMarkets!.toList().cast<MarketsRow>();
      }),
      Future(() async {
        logFirebaseEvent('LoadHomePageData_backend_call');
        advertisingQuery = await AdvertisingTable().queryRows(
          queryFn: (q) => q
              .eq(
                'status',
                AdvertiseStatus.Active.name,
              )
              .contains(
                'ads_place',
                '{${AdvertisePlacesInMobileApp.Home.name}}',
              ),
        );
        if ((advertisingQuery != null && (advertisingQuery)!.isNotEmpty) &&
            (advertisingQuery!.isNotEmpty)) {
          logFirebaseEvent('LoadHomePageData_update_page_state');
          advertisements = advertisingQuery!.toList().cast<AdvertisingRow>();
        }
      }),
    ]);
  }
}
