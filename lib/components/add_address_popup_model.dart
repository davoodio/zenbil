import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_address_popup_widget.dart' show AddAddressPopupWidget;
import 'package:flutter/material.dart';

class AddAddressPopupModel extends FlutterFlowModel<AddAddressPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AddressName widget.
  FocusNode? addressNameFocusNode;
  TextEditingController? addressNameTextController;
  String? Function(BuildContext, String?)? addressNameTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
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
