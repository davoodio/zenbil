import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/address_card_widget.dart';
import '/components/empty_state_widget.dart';
import '/components/loaders/loader_query/loader_query_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'address_insert_model.dart';
export 'address_insert_model.dart';

class AddressInsertWidget extends StatefulWidget {
  const AddressInsertWidget({super.key});

  @override
  State<AddressInsertWidget> createState() => _AddressInsertWidgetState();
}

class _AddressInsertWidgetState extends State<AddressInsertWidget> {
  late AddressInsertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressInsertModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.75,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'bqxk57d9' /* Select Address */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      const Shadow(
                                        color: Color(0x2503080C),
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 6.0,
                                      )
                                    ],
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ADDRESS_INSERT_keyboard_arrow_down_ICN_O');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<UserAddressesRow>>(
                        future: UserAddressesTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'user_id',
                                currentUserUid,
                              )
                              .eq(
                                'is_deleted',
                                false,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const LoaderQueryWidget();
                          }
                          List<UserAddressesRow> listViewUserAddressesRowList =
                              snapshot.data!;

                          if (listViewUserAddressesRowList.isEmpty) {
                            return EmptyStateWidget(
                              message: FFLocalizations.of(context).getText(
                                '3m2dki9l' /* No address, Please start add y... */,
                              ),
                              actionButton: () async {},
                            );
                          }

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              16.0,
                              0,
                              16.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewUserAddressesRowList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewUserAddressesRow =
                                  listViewUserAddressesRowList[listViewIndex];
                              return Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ADDRESS_INSERT_Container_okn8l4od_ON_TAP');
                                      logFirebaseEvent(
                                          'AddressCard_bottom_sheet');
                                      Navigator.pop(
                                          context, listViewUserAddressesRow);
                                    },
                                    child: wrapWithModel(
                                      model: _model.addressCardModels.getModel(
                                        listViewUserAddressesRow.id.toString(),
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: AddressCardWidget(
                                        key: Key(
                                          'Keyokn_${listViewUserAddressesRow.id.toString()}',
                                        ),
                                        userAddresss: listViewUserAddressesRow,
                                        showSetDefaultButton: false,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Semantics(
                              label: 'add new Address',
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADDRESS_INSERT_ADD_NEW_ADDRESS_BTN_ON_TA');
                                  logFirebaseEvent('Button_action_block');
                                  await action_blocks.addAddress(context);
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'y9n3rq0x' /* Add New Address */,
                                ),
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
