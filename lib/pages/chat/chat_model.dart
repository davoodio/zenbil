import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_header/chat_header_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/loaders/loader_query/loader_query_widget.dart';
import '/components/loaders/loader_query_inside/loader_query_inside_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_widget.dart' show ChatWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
