import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_component_widget.dart';
import '/components/header/header_widget.dart';
import '/components/review_box_widget.dart';
import '/components/review_summary_section_widget.dart';
import '/components/shimmer_reviews_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ratings_reviews_widget.dart' show RatingsReviewsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
