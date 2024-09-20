import '/components/product_fav_toggle_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_card_widget.dart' show ProductCardWidget;
import 'package:flutter/material.dart';

class ProductCardModel extends FlutterFlowModel<ProductCardWidget> {
  ///  Local state fields for this component.

  bool liked = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for ProductFavToggle component.
  late ProductFavToggleModel productFavToggleModel;

  @override
  void initState(BuildContext context) {
    productFavToggleModel = createModel(context, () => ProductFavToggleModel());
  }

  @override
  void dispose() {
    productFavToggleModel.dispose();
  }
}
