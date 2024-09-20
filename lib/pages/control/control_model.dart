import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'control_widget.dart' show ControlWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControlModel extends FlutterFlowModel<ControlWidget> {
  ///  Local state fields for this page.

  int cartProductsCounter = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - handleDynamicLink] action in Control widget.
  dynamic? actionFinished;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
