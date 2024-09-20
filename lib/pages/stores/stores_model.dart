import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_box_grid/loader_box_grid_widget.dart';
import '/components/market_cover_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'stores_widget.dart' show StoresWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoresModel extends FlutterFlowModel<StoresWidget> {
  ///  Local state fields for this page.

  String marketType = 'Business';

  bool isPage = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Models for BrandCoverCard.
  late FlutterFlowDynamicModels<MarketCoverCardModel> brandCoverCardModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    brandCoverCardModels =
        FlutterFlowDynamicModels(() => MarketCoverCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    brandCoverCardModels.dispose();
    navBarModel.dispose();
  }
}
