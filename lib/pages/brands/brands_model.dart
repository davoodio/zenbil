import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'brands_widget.dart' show BrandsWidget;
import 'package:flutter/material.dart';

class BrandsModel extends FlutterFlowModel<BrandsWidget> {
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
