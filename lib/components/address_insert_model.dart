import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/address_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'address_insert_widget.dart' show AddressInsertWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressInsertModel extends FlutterFlowModel<AddressInsertWidget> {
  ///  Local state fields for this component.

  SearchSortStruct? selected;
  void updateSelectedStruct(Function(SearchSortStruct) updateFn) {
    updateFn(selected ??= SearchSortStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Models for AddressCard dynamic component.
  late FlutterFlowDynamicModels<AddressCardModel> addressCardModels;

  @override
  void initState(BuildContext context) {
    addressCardModels = FlutterFlowDynamicModels(() => AddressCardModel());
  }

  @override
  void dispose() {
    addressCardModels.dispose();
  }
}
