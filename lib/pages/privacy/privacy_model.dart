import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'privacy_widget.dart' show PrivacyWidget;
import 'package:flutter/material.dart';

class PrivacyModel extends FlutterFlowModel<PrivacyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
