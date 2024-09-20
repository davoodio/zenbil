import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_address_popup_widget.dart' show AddAddressPopupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAddressPopupModel extends FlutterFlowModel<AddAddressPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AddressName widget.
  FocusNode? addressNameFocusNode;
  TextEditingController? addressNameTextController;
  String? Function(BuildContext, String?)? addressNameTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for cb_default widget.
  bool? cbDefaultValue;
  // State field(s) for cb_shipping widget.
  bool? cbShippingValue;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UserAddressesRow? addressCreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addressNameFocusNode?.dispose();
    addressNameTextController?.dispose();
  }
}
