import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'products_category_widget.dart' show ProductsCategoryWidget;
import 'package:flutter/material.dart';

class ProductsCategoryModel extends FlutterFlowModel<ProductsCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
