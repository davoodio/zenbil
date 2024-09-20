import '/flutter_flow/flutter_flow_util.dart';
import 'pin_code_verification_widget.dart' show PinCodeVerificationWidget;
import 'package:flutter/material.dart';

class PinCodeVerificationModel
    extends FlutterFlowModel<PinCodeVerificationWidget> {
  ///  Local state fields for this page.

  bool pincodeCompleted = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - verifyOtp] action in VerifyPinCode widget.
  dynamic pincodeVerify;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
