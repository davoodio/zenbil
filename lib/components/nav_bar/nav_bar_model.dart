import '/components/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HomeZenbil.
  late NavBarItemModel homeZenbilModel;
  // Model for Market.
  late NavBarItemModel marketModel;
  // Model for Influencer.
  late NavBarItemModel influencerModel;
  // Model for Categories.
  late NavBarItemModel categoriesModel;
  // Model for Account.
  late NavBarItemModel accountModel;

  @override
  void initState(BuildContext context) {
    homeZenbilModel = createModel(context, () => NavBarItemModel());
    marketModel = createModel(context, () => NavBarItemModel());
    influencerModel = createModel(context, () => NavBarItemModel());
    categoriesModel = createModel(context, () => NavBarItemModel());
    accountModel = createModel(context, () => NavBarItemModel());
  }

  @override
  void dispose() {
    homeZenbilModel.dispose();
    marketModel.dispose();
    influencerModel.dispose();
    categoriesModel.dispose();
    accountModel.dispose();
  }
}
