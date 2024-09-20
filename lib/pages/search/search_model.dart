import '/components/category_search_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/market_search_widget.dart';
import '/components/product_search_widget.dart';
import '/components/search_shell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  String? categories;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SearchShell component.
  late SearchShellModel searchShellModel;
  // Models for ProductSearch dynamic component.
  late FlutterFlowDynamicModels<ProductSearchModel> productSearchModels1;
  // Models for MarketSearch dynamic component.
  late FlutterFlowDynamicModels<MarketSearchModel> marketSearchModels;
  // Models for ProductSearch dynamic component.
  late FlutterFlowDynamicModels<ProductSearchModel> productSearchModels2;
  // Models for ProductSearch dynamic component.
  late FlutterFlowDynamicModels<ProductSearchModel> productSearchModels3;
  // Models for BrandSearch.
  late FlutterFlowDynamicModels<MarketSearchModel> brandSearchModels;
  // Models for CategorySearch dynamic component.
  late FlutterFlowDynamicModels<CategorySearchModel> categorySearchModels;
  // Model for EmptyStateStart.
  late EmptyStateModel emptyStateStartModel;
  // Model for EmptyStateNoResult.
  late EmptyStateModel emptyStateNoResultModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    searchShellModel = createModel(context, () => SearchShellModel());
    productSearchModels1 = FlutterFlowDynamicModels(() => ProductSearchModel());
    marketSearchModels = FlutterFlowDynamicModels(() => MarketSearchModel());
    productSearchModels2 = FlutterFlowDynamicModels(() => ProductSearchModel());
    productSearchModels3 = FlutterFlowDynamicModels(() => ProductSearchModel());
    brandSearchModels = FlutterFlowDynamicModels(() => MarketSearchModel());
    categorySearchModels =
        FlutterFlowDynamicModels(() => CategorySearchModel());
    emptyStateStartModel = createModel(context, () => EmptyStateModel());
    emptyStateNoResultModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    searchShellModel.dispose();
    productSearchModels1.dispose();
    marketSearchModels.dispose();
    productSearchModels2.dispose();
    productSearchModels3.dispose();
    brandSearchModels.dispose();
    categorySearchModels.dispose();
    emptyStateStartModel.dispose();
    emptyStateNoResultModel.dispose();
  }
}
