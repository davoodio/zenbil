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
import 'products_category_widget.dart' show ProductsCategoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
