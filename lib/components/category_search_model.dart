import '/components/image_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_search_widget.dart' show CategorySearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategorySearchModel extends FlutterFlowModel<CategorySearchWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ImageWidget component.
  late ImageWidgetModel imageWidgetModel;

  @override
  void initState(BuildContext context) {
    imageWidgetModel = createModel(context, () => ImageWidgetModel());
  }

  @override
  void dispose() {
    imageWidgetModel.dispose();
  }
}
