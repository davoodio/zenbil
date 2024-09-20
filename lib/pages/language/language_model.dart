import '/components/header/header_widget.dart';
import '/components/languages_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'language_widget.dart' show LanguageWidget;
import 'package:flutter/material.dart';

class LanguageModel extends FlutterFlowModel<LanguageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for LanguagesItem component.
  late LanguagesItemModel languagesItemModel1;
  // Model for LanguagesItem component.
  late LanguagesItemModel languagesItemModel2;
  // Model for LanguagesItem component.
  late LanguagesItemModel languagesItemModel3;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    languagesItemModel1 = createModel(context, () => LanguagesItemModel());
    languagesItemModel2 = createModel(context, () => LanguagesItemModel());
    languagesItemModel3 = createModel(context, () => LanguagesItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    languagesItemModel1.dispose();
    languagesItemModel2.dispose();
    languagesItemModel3.dispose();
  }
}
