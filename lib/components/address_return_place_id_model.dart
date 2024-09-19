import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'address_return_place_id_widget.dart' show AddressReturnPlaceIdWidget;
import 'package:flutter/material.dart';

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
