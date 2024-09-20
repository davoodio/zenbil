import '/auth/supabase_auth/auth_util.dart';
import '/components/cart_badge_widget.dart';
import '/components/search_badge_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchBadge component.
  late SearchBadgeModel searchBadgeModel;
  // Model for CartBadge component.
  late CartBadgeModel cartBadgeModel;

  @override
  void initState(BuildContext context) {
    searchBadgeModel = createModel(context, () => SearchBadgeModel());
    cartBadgeModel = createModel(context, () => CartBadgeModel());
  }

  @override
  void dispose() {
    searchBadgeModel.dispose();
    cartBadgeModel.dispose();
  }
}
