import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_header/chat_header_widget.dart';
import '/components/loaders/loader_query_inside/loader_query_inside_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  bool mediaAttachMenu = false;

  MediaStruct? mediaObject;
  void updateMediaObjectStruct(Function(MediaStruct) updateFn) {
    updateFn(mediaObject ??= MediaStruct());
  }

  bool uploading = false;

  ///  State fields for stateful widgets in this page.

  // Model for ChatHeader component.
  late ChatHeaderModel chatHeaderModel;
  // State field(s) for messages widget.
  ScrollController? messages;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in message widget.
  ConversationMessagesRow? messageNew;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Model for LoaderQueryInside component.
  late LoaderQueryInsideModel loaderQueryInsideModel;

  @override
  void initState(BuildContext context) {
    chatHeaderModel = createModel(context, () => ChatHeaderModel());
    messages = ScrollController();
    loaderQueryInsideModel =
        createModel(context, () => LoaderQueryInsideModel());
  }

  @override
  void dispose() {
    chatHeaderModel.dispose();
    messages?.dispose();
    messageFocusNode?.dispose();
    messageTextController?.dispose();

    loaderQueryInsideModel.dispose();
  }
}
