import '/components/image_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'brand_search_widget.dart' show BrandSearchWidget;
import 'package:flutter/material.dart';

class BrandSearchModel extends FlutterFlowModel<BrandSearchWidget> {
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
