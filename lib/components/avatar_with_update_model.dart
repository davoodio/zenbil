import '/flutter_flow/flutter_flow_util.dart';
import 'avatar_with_update_widget.dart' show AvatarWithUpdateWidget;
import 'package:flutter/material.dart';

class AvatarWithUpdateModel extends FlutterFlowModel<AvatarWithUpdateWidget> {
  ///  Local state fields for this component.

  String? avatarURL = ' ';

  String? blureHash = '';

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
