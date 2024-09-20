import '/components/header/header_widget.dart';
import '/components/review_box_widget.dart';
import '/components/review_summary_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ratings_reviews_widget.dart' show RatingsReviewsWidget;
import 'package:flutter/material.dart';

class RatingsReviewsModel extends FlutterFlowModel<RatingsReviewsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ReviewSummarySection component.
  late ReviewSummarySectionModel reviewSummarySectionModel;
  // State field(s) for MostHelpfulCheckboxListTile widget.
  bool? mostHelpfulCheckboxListTileValue;
  // Models for ReviewBox dynamic component.
  late FlutterFlowDynamicModels<ReviewBoxModel> reviewBoxModels;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    reviewSummarySectionModel =
        createModel(context, () => ReviewSummarySectionModel());
    reviewBoxModels = FlutterFlowDynamicModels(() => ReviewBoxModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    reviewSummarySectionModel.dispose();
    reviewBoxModels.dispose();
  }
}
