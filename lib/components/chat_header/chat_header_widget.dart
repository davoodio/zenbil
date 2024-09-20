import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_header_model.dart';
export 'chat_header_model.dart';

class ChatHeaderWidget extends StatefulWidget {
  const ChatHeaderWidget({
    super.key,
    this.title,
    this.conversation,
  });

  final String? title;
  final ConversationsRow? conversation;

  @override
  State<ChatHeaderWidget> createState() => _ChatHeaderWidgetState();
}

class _ChatHeaderWidgetState extends State<ChatHeaderWidget> {
  late ChatHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('CHAT_HEADER_chevron_left_rounded_ICN_ON_');
                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 28.0,
                        height: 28.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: FFAppConstants.BrandSupportAvatarURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.title,
                          'TITLE',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((widget!.conversation?.status ==
                      ConversationStatus.Active.name) ||
                  (widget!.conversation?.status ==
                      ConversationStatus.Draft.name))
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      FFIcons.kdeleteDefault,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('CHAT_HEADER_deleteDefault_ICN_ON_TAP');
                      if (widget!.conversation?.status ==
                          ConversationStatus.Active.name) {
                        logFirebaseEvent('IconButton_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: double.infinity,
                                child: InfoModalWidget(
                                  icon: Icon(
                                    FFIcons.kcheck,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 24.0,
                                  ),
                                  title: FFLocalizations.of(context).getText(
                                    'f7wwnhef' /* Confirm! */,
                                  ),
                                  body: FFLocalizations.of(context).getText(
                                    '7k6n7bgs' /* You sure you want to archive t... */,
                                  ),
                                  isConfirm: true,
                                  actionButtonText:
                                      FFLocalizations.of(context).getText(
                                    'v1xcbuv5' /* Yes, Archive */,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.archiveApprove = value));

                        if (_model.archiveApprove!) {
                          logFirebaseEvent('IconButton_backend_call');
                          await ConversationsTable().update(
                            data: {
                              'status': ConversationStatus.ClosedByUser.name,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget!.conversation?.id,
                            ),
                          );
                          logFirebaseEvent('IconButton_alert_dialog');
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: InfoModalWidget(
                                  isConfirm: false,
                                  autoDismiss: true,
                                  icon: Icon(
                                    FFIcons.kcheckCircle,
                                  ),
                                  body: FFLocalizations.of(context).getText(
                                    'xr6tn033' /* Chat archived successfully! */,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        logFirebaseEvent('IconButton_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: double.infinity,
                                child: InfoModalWidget(
                                  icon: Icon(
                                    FFIcons.kcheck,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 24.0,
                                  ),
                                  title: FFLocalizations.of(context).getText(
                                    'hyguljxb' /* Confirm! */,
                                  ),
                                  body: FFLocalizations.of(context).getText(
                                    'ip3fobkr' /* You sure you want to delete th... */,
                                  ),
                                  isConfirm: true,
                                  actionButtonText:
                                      FFLocalizations.of(context).getText(
                                    '268cabss' /* Yes, Delete */,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.deleteApprove = value));

                        if (_model.deleteApprove!) {
                          logFirebaseEvent('IconButton_backend_call');
                          await ConversationsTable().delete(
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget!.conversation?.id,
                            ),
                          );
                          logFirebaseEvent('IconButton_navigate_to');

                          context.goNamed('Support');
                        }
                      }

                      safeSetState(() {});
                    },
                  ),
                ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ],
      ),
    );
  }
}
