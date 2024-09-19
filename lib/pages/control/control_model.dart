import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'control_widget.dart' show ControlWidget;
import 'package:flutter/material.dart';

class ControlModel extends FlutterFlowModel<ControlWidget> {
  ///  Local state fields for this page.

  int cartProductsCounter = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Control widget.
  List<WalletsRow>? userWallet;
  // Stores action output result for [Backend Call - Insert Row] action in Control widget.
  WalletsRow? walletCreatedForUser;
  // Stores action output result for [Backend Call - Query Rows] action in Control widget.
  List<CountriesRow>? country;
  // Stores action output result for [Backend Call - Query Rows] action in Control widget.
  List<CountriesRow>? defaultCountry;
  // Stores action output result for [Backend Call - Query Rows] action in Control widget.
  List<AppGeneralSettingsRow>? appSettings;
  // Stores action output result for [Backend Call - Query Rows] action in Control widget.
  List<UserFavoritesRow>? userFavorites;
  // Stores action output result for [Backend Call - Query Rows] action in Control widget.
  List<ProductsRow>? userCartProducts;
  // Stores action output result for [Custom Action - handleDynamicLink] action in Control widget.
  int? marketId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
