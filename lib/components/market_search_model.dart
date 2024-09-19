import '/components/image_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'market_search_widget.dart' show MarketSearchWidget;
import 'package:flutter/material.dart';

class MarketSearchModel extends FlutterFlowModel<MarketSearchWidget> {
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
