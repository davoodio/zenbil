import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/conversation_card_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_query_inside/loader_query_inside_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'support_model.dart';
export 'support_model.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({super.key});

  @override
  State<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  late SupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Support'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                currentUserUid,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 38.0,
                    height: 38.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<UsersRow> currentUserUsersRowList = snapshot.data!;

              final currentUserUsersRow = currentUserUsersRowList.isNotEmpty
                  ? currentUserUsersRowList.first
                  : null;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(
                                title: FFLocalizations.of(context).getText(
                                  'ghrdztql' /* Support */,
                                ),
                                showBackButton: true,
                                showCart: true,
                                goToCartOnClick: true,
                                showSearch: false,
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<ConversationsRow>>(
                                future: ConversationsTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'user_created_id',
                                        currentUserUid,
                                      )
                                      .order('created_at'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const LoaderQueryInsideWidget();
                                  }
                                  List<ConversationsRow>
                                      conversationListConversationsRowList =
                                      snapshot.data!;

                                  if (conversationListConversationsRowList
                                      .isEmpty) {
                                    return Center(
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: EmptyStateWidget(
                                          message: FFLocalizations.of(context)
                                              .getText(
                                            'gu6cr867' /* There is no active conversatio... */,
                                          ),
                                          icon: const Icon(
                                            FFIcons.kmessageChatbot,
                                          ),
                                          title: 'No Conversation',
                                          actionButton: () async {},
                                        ),
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      85.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        conversationListConversationsRowList
                                            .length,
                                    itemBuilder:
                                        (context, conversationListIndex) {
                                      final conversationListConversationsRow =
                                          conversationListConversationsRowList[
                                              conversationListIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: ConversationCardWidget(
                                          key: Key(
                                              'Key4t9_${conversationListIndex}_of_${conversationListConversationsRowList.length}'),
                                          conversation:
                                              conversationListConversationsRow,
                                          currentUser: currentUserUsersRow!,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!FFAppState().CurrentUser.isAnon)
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 20.0),
                            child: Container(
                              width: 54.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 24.0,
                                    color: FlutterFlowTheme.of(context)
                                        .shadowPrimary,
                                    offset: const Offset(
                                      0.0,
                                      6.0,
                                    ),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 100.0,
                                      buttonSize: double.infinity,
                                      icon: Icon(
                                        FFIcons.kmessagePlus,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 23.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SUPPORT_PAGE_messagePlus_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_backend_call');
                                        _model.newConversationCreated =
                                            await ConversationsTable().insert({
                                          'user_created_id': currentUserUid,
                                          'status': FFAppState()
                                              .DataTypeEnums
                                              .conversationStatus
                                              .draft,
                                          'last_update':
                                              supaSerialize<DateTime>(functions
                                                  .getCurrentTimeWithTimeZone00()),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.pushNamed(
                                          'Chat',
                                          queryParameters: {
                                            'conversationId': serializeParam(
                                              _model.newConversationCreated?.id,
                                              ParamType.int,
                                            ),
                                            'currentUser': serializeParam(
                                              currentUserUsersRow,
                                              ParamType.SupabaseRow,
                                            ),
                                          }.withoutNulls,
                                        );

                                        safeSetState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
