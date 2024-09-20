import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'address_return_place_id_widget.dart' show AddressReturnPlaceIdWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressReturnPlaceIdModel
    extends FlutterFlowModel<AddressReturnPlaceIdWidget> {
  ///  Local state fields for this component.

  bool processing = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (getCurrentAddress)] action in Button widget.
  ApiCallResponse? getAddressFromMapCenter;
  // State field(s) for SeachAddressTextField widget.
  FocusNode? seachAddressTextFieldFocusNode;
  TextEditingController? seachAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      seachAddressTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetPlace)] action in SeachAddressTextField widget.
  ApiCallResponse? placesGet;
  // Stores action output result for [Backend Call - API (getCurrentAddressPlaceId)] action in Container widget.
  ApiCallResponse? addressFromPlaceIDFinder;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    seachAddressTextFieldFocusNode?.dispose();
    seachAddressTextFieldTextController?.dispose();
  }
}
