import '/components/header/header_widget.dart';
import '/components/market_cover_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stores_widget.dart' show StoresWidget;
import 'package:flutter/material.dart';

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
