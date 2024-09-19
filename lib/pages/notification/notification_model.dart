import '/components/header/header_widget.dart';
import '/components/notifications_tag/notifications_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';

class NotificationModel extends FlutterFlowModel<NotificationWidget> {
  ///  Local state fields for this page.

  String? activeTagName = '';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NotificationsTag component.
  late NotificationsTagModel notificationsTagModel1;
  // Model for NotificationsTag component.
  late NotificationsTagModel notificationsTagModel2;
  // Model for NotificationsTag component.
  late NotificationsTagModel notificationsTagModel3;
  // Model for NotificationsTag component.
  late NotificationsTagModel notificationsTagModel4;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    notificationsTagModel1 =
        createModel(context, () => NotificationsTagModel());
    notificationsTagModel2 =
        createModel(context, () => NotificationsTagModel());
    notificationsTagModel3 =
        createModel(context, () => NotificationsTagModel());
    notificationsTagModel4 =
        createModel(context, () => NotificationsTagModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    notificationsTagModel1.dispose();
    notificationsTagModel2.dispose();
    notificationsTagModel3.dispose();
    notificationsTagModel4.dispose();
  }
}
