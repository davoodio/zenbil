import '/components/header/header_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stars_widget.dart' show StarsWidget;
import 'package:flutter/material.dart';

class StarsModel extends FlutterFlowModel<StarsWidget> {
  ///  Local state fields for this page.

  String activeCategory = 'All';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navBarModel.dispose();
  }
}
