import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delivery_signup_widget.dart' show DeliverySignupWidget;
import 'package:flutter/material.dart';

class DeliverySignupModel extends FlutterFlowModel<DeliverySignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FullNameTextField widget.
  FocusNode? fullNameTextFieldFocusNode;
  TextEditingController? fullNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      fullNameTextFieldTextControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for CreatePasswordTextField widget.
  FocusNode? createPasswordTextFieldFocusNode;
  TextEditingController? createPasswordTextFieldTextController;
  late bool createPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      createPasswordTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RolesRow>? deliveryRoleLoaded;

  @override
  void initState(BuildContext context) {
    createPasswordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    fullNameTextFieldFocusNode?.dispose();
    fullNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    createPasswordTextFieldFocusNode?.dispose();
    createPasswordTextFieldTextController?.dispose();
  }
}
