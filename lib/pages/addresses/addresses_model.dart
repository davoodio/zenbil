import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/address_card_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'addresses_widget.dart' show AddressesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressesModel extends FlutterFlowModel<AddressesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Models for AddressCard dynamic component.
  late FlutterFlowDynamicModels<AddressCardModel> addressCardModels;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    addressCardModels = FlutterFlowDynamicModels(() => AddressCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    addressCardModels.dispose();
  }
}
