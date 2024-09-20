import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_header_widget.dart' show ChatHeaderWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatHeaderModel extends FlutterFlowModel<ChatHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - InfoModal] action in IconButton widget.
  bool? archiveApprove;
  // Stores action output result for [Bottom Sheet - InfoModal] action in IconButton widget.
  bool? deleteApprove;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
