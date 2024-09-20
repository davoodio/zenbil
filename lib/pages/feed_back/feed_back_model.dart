import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_back_widget.dart' show FeedBackWidget;
import 'package:flutter/material.dart';

class FeedBackModel extends FlutterFlowModel<FeedBackWidget> {
  ///  Local state fields for this page.

  bool ratingSet = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TitleTextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldTextController;
  String? Function(BuildContext, String?)?
      titleTextFieldTextControllerValidator;
  // State field(s) for CommentTextField widget.
  FocusNode? commentTextFieldFocusNode;
  TextEditingController? commentTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    titleTextFieldFocusNode?.dispose();
    titleTextFieldTextController?.dispose();

    commentTextFieldFocusNode?.dispose();
    commentTextFieldTextController?.dispose();
  }
}
