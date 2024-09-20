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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.conversationId,
    required this.currentUser,
  });

  final int? conversationId;
  final UsersRow? currentUser;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_PAGE_Chat_ON_INIT_STATE');
      logFirebaseEvent('Chat_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('Chat_scroll_to');
      await _model.messages?.animateTo(
        _model.messages!.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
      logFirebaseEvent('Chat_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('Chat_scroll_to');
      await _model.messages?.animateTo(
        _model.messages!.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ConversationsRow>>(
      future: ConversationsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget!.conversationId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: LoaderQueryWidget(),
          );
        }
        List<ConversationsRow> chatConversationsRowList = snapshot.data!;

        final chatConversationsRow = chatConversationsRowList.isNotEmpty
            ? chatConversationsRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.chatHeaderModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: ChatHeaderWidget(
                              title: FFAppConstants.SupportShowName,
                              conversation: chatConversationsRow,
                            ),
                          ),
                          Expanded(
                            child: FutureBuilder<List<ConversationMessagesRow>>(
                              future: ConversationMessagesTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'conversation_id',
                                  widget!.conversationId,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return LoaderQueryInsideWidget();
                                }
                                List<ConversationMessagesRow>
                                    messagesConversationMessagesRowList =
                                    snapshot.data!;

                                if (messagesConversationMessagesRowList
                                    .isEmpty) {
                                  return EmptyStateWidget(
                                    title: FFLocalizations.of(context).getText(
                                      'dsb5qb40' /* Hi!  */,
                                    ),
                                    message:
                                        FFLocalizations.of(context).getText(
                                      'ktbr6wvv' /* Start your conversation. */,
                                    ),
                                    actionButton: () async {},
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    20.0,
                                    0,
                                    75.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: messagesConversationMessagesRowList
                                      .length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder: (context, messagesIndex) {
                                    final messagesConversationMessagesRow =
                                        messagesConversationMessagesRowList[
                                            messagesIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((messagesConversationMessagesRow
                                                      .senderId !=
                                                  currentUserUid) ||
                                              messagesConversationMessagesRow
                                                  .isSenderSupportAgent)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            54.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: FFAppConstants
                                                          .BrandSupportAvatarURL,
                                                      width: 32.0,
                                                      height: 32.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tfBg,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (MediaStruct.maybeFromMap(
                                                                          messagesConversationMessagesRow
                                                                              .media)
                                                                      ?.url !=
                                                                  null &&
                                                              MediaStruct.maybeFromMap(
                                                                          messagesConversationMessagesRow
                                                                              .media)
                                                                      ?.url !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        minHeight:
                                                                            80.0,
                                                                        maxHeight:
                                                                            180.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (MediaStruct.maybeFromMap(messagesConversationMessagesRow.media)?.type ==
                                                                                MediaTypes.Video)
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: FlutterFlowVideoPlayer(
                                                                                  path: functions.stringToVideoPath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                  videoType: VideoType.network,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  autoPlay: false,
                                                                                  looping: false,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                  lazyLoad: true,
                                                                                ),
                                                                              ),
                                                                            if (MediaStruct.maybeFromMap(messagesConversationMessagesRow.media)?.type ==
                                                                                MediaTypes.Audio)
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: FlutterFlowAudioPlayer(
                                                                                  audio: Audio.network(
                                                                                    functions.stringToAudioPath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                    metas: Metas(
                                                                                      title: 'Audio Attached',
                                                                                    ),
                                                                                  ),
                                                                                  titleTextStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  playbackDurationTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                      ),
                                                                                  fillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  playbackButtonColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).accent4,
                                                                                  elevation: 0.0,
                                                                                  playInBackground: PlayInBackground.disabledRestoreOnForeground,
                                                                                ),
                                                                              ),
                                                                            if (MediaStruct.maybeFromMap(messagesConversationMessagesRow.media)?.type ==
                                                                                MediaTypes.Image)
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CHAT_PAGE_Image_qbihl0sy_ON_TAP');
                                                                                  logFirebaseEvent('Image_expand_image');
                                                                                  await Navigator.push(
                                                                                    context,
                                                                                    PageTransition(
                                                                                      type: PageTransitionType.fade,
                                                                                      child: FlutterFlowExpandedImageView(
                                                                                        image: CachedNetworkImage(
                                                                                          fadeInDuration: Duration(milliseconds: 500),
                                                                                          fadeOutDuration: Duration(milliseconds: 500),
                                                                                          imageUrl: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    messagesConversationMessagesRow
                                                                        .message,
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "relative",
                                                                    messagesConversationMessagesRow
                                                                        .createdAt,
                                                                    locale: FFLocalizations.of(context)
                                                                            .languageShortCode ??
                                                                        FFLocalizations.of(context)
                                                                            .languageCode,
                                                                  ),
                                                                  '-',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (messagesConversationMessagesRow
                                                  .senderId ==
                                              currentUserUid)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (MediaStruct.maybeFromMap(
                                                                          messagesConversationMessagesRow
                                                                              .media)
                                                                      ?.url !=
                                                                  null &&
                                                              MediaStruct.maybeFromMap(
                                                                          messagesConversationMessagesRow
                                                                              .media)
                                                                      ?.url !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        minHeight:
                                                                            80.0,
                                                                        maxHeight:
                                                                            180.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (MediaStruct.maybeFromMap(messagesConversationMessagesRow.media)?.type ==
                                                                                MediaTypes.Video)
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: FlutterFlowVideoPlayer(
                                                                                  path: functions.stringToVideoPath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                  videoType: VideoType.network,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  autoPlay: false,
                                                                                  looping: false,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                  lazyLoad: true,
                                                                                ),
                                                                              ),
                                                                            if (MediaStruct.maybeFromMap(messagesConversationMessagesRow.media)?.type ==
                                                                                MediaTypes.Audio)
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: FlutterFlowAudioPlayer(
                                                                                  audio: Audio.network(
                                                                                    functions.stringToAudioPath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                    metas: Metas(
                                                                                      title: 'Audio Attached',
                                                                                    ),
                                                                                  ),
                                                                                  titleTextStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  playbackDurationTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                      ),
                                                                                  fillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  playbackButtonColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).accent4,
                                                                                  elevation: 0.0,
                                                                                  playInBackground: PlayInBackground.disabledRestoreOnForeground,
                                                                                ),
                                                                              ),
                                                                            if (MediaStruct.maybeFromMap(messagesConversationMessagesRow.media)?.type ==
                                                                                MediaTypes.Image)
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CHAT_PAGE_Image_aujkrvjb_ON_TAP');
                                                                                  logFirebaseEvent('Image_expand_image');
                                                                                  await Navigator.push(
                                                                                    context,
                                                                                    PageTransition(
                                                                                      type: PageTransitionType.fade,
                                                                                      child: FlutterFlowExpandedImageView(
                                                                                        image: CachedNetworkImage(
                                                                                          fadeInDuration: Duration(milliseconds: 500),
                                                                                          fadeOutDuration: Duration(milliseconds: 500),
                                                                                          imageUrl: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: functions.stringToImagePath(MediaStruct.maybeFromMap(messagesConversationMessagesRow.media!)!.url),
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    messagesConversationMessagesRow
                                                                        .message,
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "relative",
                                                                    messagesConversationMessagesRow
                                                                        .createdAt,
                                                                    locale: FFLocalizations.of(context)
                                                                            .languageShortCode ??
                                                                        FFLocalizations.of(context)
                                                                            .languageCode,
                                                                  ),
                                                                  '-',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            54.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: widget!
                                                                      .currentUser
                                                                      ?.avatarUrl !=
                                                                  null &&
                                                              widget!.currentUser
                                                                      ?.avatarUrl !=
                                                                  ''
                                                          ? valueOrDefault<
                                                              String>(
                                                              widget!
                                                                  .currentUser
                                                                  ?.avatarUrl,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/teams/Ng3pjnz11EXZuZaIgfKa/assets/muztoi9l6z3w/avatarMen.png',
                                                            )
                                                          : FFAppConstants
                                                              .DefaultAvatar,
                                                      width: 32.0,
                                                      height: 32.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    );
                                  },
                                  controller: _model.messages,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 16.0),
                            child: Builder(
                              builder: (context) {
                                if (chatConversationsRow?.status ==
                                    ConversationStatus.ClosedByUser.name) {
                                  return Text(
                                    FFLocalizations.of(context).getText(
                                      '3s9nyko1' /* Conversation ended by the user... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  );
                                } else if (chatConversationsRow?.status ==
                                    ConversationStatus.ClosedByAdmin.name) {
                                  return Text(
                                    FFLocalizations.of(context).getText(
                                      '5wf04d7v' /* Conversation ended by the supp... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if ((chatConversationsRow?.status ==
                            ConversationStatus.Active.name) ||
                        (chatConversationsRow?.status ==
                            ConversationStatus.Draft.name))
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 49.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).cartBg,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 250.0,
                                      child: TextFormField(
                                        controller:
                                            _model.messageTextController,
                                        focusNode: _model.messageFocusNode,
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'CHAT_PAGE_message_ON_TEXTFIELD_SUBMIT');
                                          logFirebaseEvent(
                                              'message_backend_call');
                                          _model.messageNew =
                                              await ConversationMessagesTable()
                                                  .insert({
                                            'sender_id': currentUserUid,
                                            'message': _model
                                                .messageTextController.text,
                                            'conversation_id':
                                                widget!.conversationId,
                                            'is_sender_support_agent': false,
                                            'media': _model.mediaObject?.url !=
                                                        null &&
                                                    _model.mediaObject?.url !=
                                                        ''
                                                ? (_model.mediaObject?.toMap())
                                                : null,
                                          });
                                          logFirebaseEvent(
                                              'message_update_page_state');
                                          _model.mediaObject = null;
                                          _model.mediaAttachMenu = false;
                                          _model.uploading = false;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'message_clear_text_fields_pin_codes');
                                          safeSetState(() {
                                            _model.messageTextController
                                                ?.clear();
                                          });
                                          logFirebaseEvent(
                                              'message_backend_call');
                                          await ConversationsTable().update(
                                            data: {
                                              'last_update': supaSerialize<
                                                      DateTime>(
                                                  functions
                                                      .getCurrentTimeWithTimeZone00()),
                                              'status': FFAppState()
                                                  .DataTypeEnums
                                                  .conversationStatus
                                                  .active,
                                              'admin_unread_message_number': 1,
                                              'last_message':
                                                  valueOrDefault<String>(
                                                MediaStruct.maybeFromMap(_model
                                                                    .messageNew
                                                                    ?.media)
                                                                ?.url !=
                                                            null &&
                                                        MediaStruct.maybeFromMap(
                                                                    _model
                                                                        .messageNew
                                                                        ?.media)
                                                                ?.url !=
                                                            ''
                                                    ? 'Media attached'
                                                    : _model
                                                        .messageNew?.message,
                                                '-',
                                              ),
                                              'last_message_sender_id':
                                                  currentUserUid,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget!.conversationId,
                                            ),
                                          );
                                          logFirebaseEvent('message_scroll_to');
                                          await _model.messages?.animateTo(
                                            _model.messages!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );

                                          safeSetState(() {});
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.send,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '6me1kzdh' /* Start Typing ... */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightBlack,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily),
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily),
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .messageTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 100.0,
                                    borderWidth: 0.0,
                                    buttonSize: 44.0,
                                    icon: Icon(
                                      Icons.add_circle,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      logFirebaseEvent('CHAT_PAGE_send_ON_TAP');
                                      logFirebaseEvent(
                                          'send_update_page_state');
                                      _model.mediaAttachMenu =
                                          !_model.mediaAttachMenu;
                                      safeSetState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.mediaObject?.url != null &&
                        _model.mediaObject?.url != '')
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 54.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    if (_model.mediaObject?.type ==
                                        MediaTypes.Video)
                                      ClipRRect(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Visibility(
                                            visible: _model.mediaObject?.type ==
                                                MediaTypes.Video,
                                            child: FlutterFlowVideoPlayer(
                                              path: functions.stringToVideoPath(
                                                  _model.mediaObject!.url),
                                              videoType: VideoType.network,
                                              width: double.infinity,
                                              height: double.infinity,
                                              autoPlay: false,
                                              looping: false,
                                              showControls: true,
                                              allowFullScreen: true,
                                              allowPlaybackSpeedMenu: false,
                                              lazyLoad: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.mediaObject?.type ==
                                        MediaTypes.Audio)
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowAudioPlayer(
                                          audio: Audio.network(
                                            functions.stringToAudioPath(
                                                _model.mediaObject!.url),
                                            metas: Metas(
                                              title: 'Audio Attached',
                                            ),
                                          ),
                                          titleTextStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          playbackDurationTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily),
                                                  ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          playbackButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          elevation: 0.0,
                                          playInBackground: PlayInBackground
                                              .disabledRestoreOnForeground,
                                        ),
                                      ),
                                    if (_model.mediaObject?.type ==
                                        MediaTypes.Image)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: functions.stringToImagePath(
                                              _model.mediaObject!.url),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          FFIcons.ktrash,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CHAT_PAGE_trash_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          _model.mediaObject = null;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.mediaAttachMenu)
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 60.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Color(0x11000000),
                                  offset: Offset(
                                    0.0,
                                    4.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 44.0,
                                      borderWidth: 0.0,
                                      buttonSize: 44.0,
                                      icon: Icon(
                                        FFIcons.kvideo,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CHAT_PAGE_attach_ON_TAP');
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.uploading = true;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'attach_upload_media_to_supabase');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          storageFolderPath:
                                              valueOrDefault<String>(
                                            'users/uploads/${currentUserUid}',
                                            'users/uploads',
                                          ),
                                          allowPhoto: false,
                                          allowVideo: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading1 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: FFAppState()
                                                  .StorageBuckets
                                                  .shared,
                                              selectedFiles: selectedMedia,
                                            );
                                          } finally {
                                            _model.isDataUploading1 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile1 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl1 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl1 != null &&
                                            _model.uploadedFileUrl1 != '') {
                                          logFirebaseEvent(
                                              'attach_update_page_state');
                                          _model.mediaObject = MediaStruct(
                                            type: MediaTypes.Video,
                                            url: _model.uploadedFileUrl1,
                                          );
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'attach_clear_uploaded_data');
                                          safeSetState(() {
                                            _model.isDataUploading1 = false;
                                            _model.uploadedLocalFile1 =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl1 = '';
                                          });
                                        }
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.mediaAttachMenu = false;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.uploading = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 44.0,
                                      borderWidth: 0.0,
                                      buttonSize: 44.0,
                                      icon: Icon(
                                        Icons.mic,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CHAT_PAGE_attach_ON_TAP');
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.uploading = true;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'attach_upload_file_to_supabase');
                                        final selectedFiles = await selectFiles(
                                          storageFolderPath:
                                              valueOrDefault<String>(
                                            'users/uploads/${currentUserUid}',
                                            'users/uploads',
                                          ),
                                          allowedExtensions: ['mp3'],
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();

                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: FFAppState()
                                                  .StorageBuckets
                                                  .shared,
                                              selectedFiles: selectedFiles,
                                            );
                                          } finally {
                                            _model.isDataUploading2 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedFiles.length &&
                                              downloadUrls.length ==
                                                  selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile2 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl2 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl2 != null &&
                                            _model.uploadedFileUrl2 != '') {
                                          logFirebaseEvent(
                                              'attach_update_page_state');
                                          _model.mediaObject = MediaStruct(
                                            type: MediaTypes.Audio,
                                            url: _model.uploadedFileUrl2,
                                          );
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'attach_clear_uploaded_data');
                                          safeSetState(() {
                                            _model.isDataUploading2 = false;
                                            _model.uploadedLocalFile2 =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl2 = '';
                                          });
                                        }
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.mediaAttachMenu = false;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.uploading = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 44.0,
                                      borderWidth: 0.0,
                                      buttonSize: 44.0,
                                      icon: Icon(
                                        FFIcons.kphoto,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CHAT_PAGE_attach_ON_TAP');
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.uploading = true;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'attach_upload_media_to_supabase');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          storageFolderPath:
                                              valueOrDefault<String>(
                                            'users/uploads/${currentUserUid}',
                                            'users/uploads',
                                          ),
                                          maxWidth: 1200.00,
                                          imageQuality: 80,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading3 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: FFAppState()
                                                  .StorageBuckets
                                                  .shared,
                                              selectedFiles: selectedMedia,
                                            );
                                          } finally {
                                            _model.isDataUploading3 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile3 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl3 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl3 != null &&
                                            _model.uploadedFileUrl3 != '') {
                                          logFirebaseEvent(
                                              'attach_update_page_state');
                                          _model.mediaObject = MediaStruct(
                                            type: MediaTypes.Image,
                                            url: _model.uploadedFileUrl3,
                                          );
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'attach_clear_uploaded_data');
                                          safeSetState(() {
                                            _model.isDataUploading3 = false;
                                            _model.uploadedLocalFile3 =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl3 = '';
                                          });
                                        }
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.mediaAttachMenu = false;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'attach_update_page_state');
                                        _model.uploading = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ]
                                      .addToStart(SizedBox(height: 4.0))
                                      .addToEnd(SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                      ),
                    if (_model.uploading)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 180.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15.0,
                                color: Color(0x11000000),
                                offset: Offset(
                                  0.0,
                                  8.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.loaderQueryInsideModel,
                                updateCallback: () => safeSetState(() {}),
                                child: LoaderQueryInsideWidget(),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'sisemz6x' /* Uploading ... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
