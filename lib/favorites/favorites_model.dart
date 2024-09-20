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
import '/flutter_flow/flutter_flow_widgets.dart';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Models for ProductCard dynamic component.
  late FlutterFlowDynamicModels<ProductCardModel> productCardModels;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    productCardModels = FlutterFlowDynamicModels(() => ProductCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    productCardModels.dispose();
  }
}
