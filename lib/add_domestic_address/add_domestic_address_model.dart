import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/divider_text/divider_text_widget.dart';
import '/components/header/header_widget.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_domestic_address_widget.dart' show AddDomesticAddressWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDomesticAddressModel
    extends FlutterFlowModel<AddDomesticAddressWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getCurrentAddressPlaceId)] action in AddDomesticAddress widget.
  ApiCallResponse? addressFromPlaceID;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  String? _streetTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5xtxgnjn' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for building widget.
  FocusNode? buildingFocusNode;
  TextEditingController? buildingTextController;
  String? Function(BuildContext, String?)? buildingTextControllerValidator;
  // State field(s) for floor widget.
  FocusNode? floorFocusNode;
  TextEditingController? floorTextController;
  String? Function(BuildContext, String?)? floorTextControllerValidator;
  // State field(s) for unit widget.
  FocusNode? unitFocusNode;
  TextEditingController? unitTextController;
  String? Function(BuildContext, String?)? unitTextControllerValidator;
  // Model for DividerText component.
  late DividerTextModel dividerTextModel1;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8mjpmfrf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Model for DividerText component.
  late DividerTextModel dividerTextModel2;
  // State field(s) for Label widget.
  FocusNode? labelFocusNode;
  TextEditingController? labelTextController;
  String? Function(BuildContext, String?)? labelTextControllerValidator;
  // Model for DividerText component.
  late DividerTextModel dividerTextModel3;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    streetTextControllerValidator = _streetTextControllerValidator;
    dividerTextModel1 = createModel(context, () => DividerTextModel());
    phoneTextControllerValidator = _phoneTextControllerValidator;
    dividerTextModel2 = createModel(context, () => DividerTextModel());
    dividerTextModel3 = createModel(context, () => DividerTextModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    streetFocusNode?.dispose();
    streetTextController?.dispose();

    buildingFocusNode?.dispose();
    buildingTextController?.dispose();

    floorFocusNode?.dispose();
    floorTextController?.dispose();

    unitFocusNode?.dispose();
    unitTextController?.dispose();

    dividerTextModel1.dispose();
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    dividerTextModel2.dispose();
    labelFocusNode?.dispose();
    labelTextController?.dispose();

    dividerTextModel3.dispose();
    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
