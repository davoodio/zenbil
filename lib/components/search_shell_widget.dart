import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_shell_model.dart';
export 'search_shell_model.dart';

class SearchShellWidget extends StatefulWidget {
  const SearchShellWidget({
    super.key,
    required this.tableName,
    required this.fieldsToReturnFromTable,
    required this.fieldsToSearchIn,
    this.preDefineSearch,
    int? maxNumberOfResults,
    this.autoCompleteOptions,
  }) : maxNumberOfResults = maxNumberOfResults ?? 10;

  final String? tableName;
  final String? fieldsToReturnFromTable;
  final String? fieldsToSearchIn;
  final String? preDefineSearch;
  final int maxNumberOfResults;
  final List<dynamic>? autoCompleteOptions;

  @override
  State<SearchShellWidget> createState() => _SearchShellWidgetState();
}

class _SearchShellWidgetState extends State<SearchShellWidget> {
  late SearchShellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchShellModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
    _model.searchFieldFocusNode!.addListener(
      () async {
        logFirebaseEvent('SEARCH_SHELL_SearchField_ON_FOCUS_CHANGE');
        if (_model.searchFieldTextController.text != '') {
          logFirebaseEvent('SearchField_custom_action');
          _model.searchResultFocusChange = await actions.supabaseSearch(
            widget.tableName!,
            functions
                .textSeparatorToList(widget.fieldsToReturnFromTable!, ',')
                .toList(),
            functions
                .textSeparatorToList(widget.fieldsToSearchIn!, ',')
                .toList(),
            _model.searchFieldTextController.text,
            0,
            widget.maxNumberOfResults,
            false,
            widget.preDefineSearch!,
          );
          if (getJsonField(
            _model.searchResultFocusChange,
            r'''$.success''',
          )) {
            logFirebaseEvent('SearchField_update_component_state');
            _model.numberOfResults = getJsonField(
              _model.searchResultFocusChange,
              r'''$.count''',
            );
            _model.searchResultBody = getJsonField(
              _model.searchResultFocusChange,
              r'''$.*''',
            );
            _model.searchError = null;
            _model.updatePage(() {});
            if (_model.numberOfResults! > 0) {
              logFirebaseEvent('SearchField_update_component_state');
              _model.hasResults = true;
              _model.successButNoResult = false;
              _model.result = getJsonField(
                _model.searchResultFocusChange,
                r'''$.result''',
              );
              _model.updatePage(() {});
            } else {
              logFirebaseEvent('SearchField_update_component_state');
              _model.hasResults = false;
              _model.successButNoResult = true;
              _model.updatePage(() {});
            }
          } else {
            logFirebaseEvent('SearchField_update_component_state');
            _model.isTestMode = false;
            _model.numberOfResults = null;
            _model.hasResults = false;
            _model.successButNoResult = false;
            _model.searchResultBody = null;
            _model.result = null;
            _model.searchError = getJsonField(
              _model.searchResultFocusChange,
              r'''$.error''',
            ).toString().toString();
            _model.updatePage(() {});
          }
        } else {
          logFirebaseEvent('SearchField_update_component_state');
          _model.isTestMode = false;
          _model.numberOfResults = null;
          _model.hasResults = false;
          _model.successButNoResult = false;
          _model.searchResultBody = null;
          _model.result = null;
          _model.updatePage(() {});
        }

        safeSetState(() {});
      },
    );
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
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: _model.searchFieldTextController,
          focusNode: _model.searchFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.searchFieldTextController',
            const Duration(milliseconds: 100),
            () async {
              logFirebaseEvent('SEARCH_SHELL_SearchField_ON_TEXTFIELD_CH');
              if (_model.searchFieldTextController.text != '') {
                logFirebaseEvent('SearchField_custom_action');
                _model.searchResult = await actions.supabaseSearch(
                  widget.tableName!,
                  functions
                      .textSeparatorToList(
                          widget.fieldsToReturnFromTable!, ',')
                      .toList(),
                  functions
                      .textSeparatorToList(widget.fieldsToSearchIn!, ',')
                      .toList(),
                  _model.searchFieldTextController.text,
                  0,
                  widget.maxNumberOfResults,
                  true,
                  widget.preDefineSearch!,
                );
                if (getJsonField(
                  _model.searchResult,
                  r'''$.success''',
                )) {
                  logFirebaseEvent('SearchField_update_component_state');
                  _model.numberOfResults = getJsonField(
                    _model.searchResult,
                    r'''$.count''',
                  );
                  _model.searchResultBody = getJsonField(
                    _model.searchResult,
                    r'''$.*''',
                  );
                  _model.searchError = null;
                  _model.updatePage(() {});
                  if (_model.numberOfResults! > 0) {
                    logFirebaseEvent('SearchField_update_component_state');
                    _model.hasResults = true;
                    _model.successButNoResult = false;
                    _model.result = getJsonField(
                      _model.searchResult,
                      r'''$.result''',
                    );
                    _model.updatePage(() {});
                  } else {
                    logFirebaseEvent('SearchField_update_component_state');
                    _model.hasResults = false;
                    _model.successButNoResult = true;
                    _model.updatePage(() {});
                  }
                } else {
                  logFirebaseEvent('SearchField_update_component_state');
                  _model.isTestMode = false;
                  _model.numberOfResults = null;
                  _model.hasResults = false;
                  _model.successButNoResult = false;
                  _model.searchResultBody = null;
                  _model.result = null;
                  _model.searchError = getJsonField(
                    _model.searchResult,
                    r'''$.error''',
                  ).toString();
                  _model.updatePage(() {});
                }
              } else {
                logFirebaseEvent('SearchField_update_component_state');
                _model.isTestMode = false;
                _model.numberOfResults = null;
                _model.hasResults = false;
                _model.successButNoResult = false;
                _model.searchResultBody = null;
                _model.result = null;
                _model.updatePage(() {});
              }

              safeSetState(() {});
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            isDense: false,
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            hintText: FFLocalizations.of(context).getText(
              'ek1xovlj' /* Search */,
            ),
            hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelSmallFamily),
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryText,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryText,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            prefixIcon: Icon(
              FFIcons.ksearch,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 20.0,
            ),
            suffixIcon: _model.searchFieldTextController!.text.isNotEmpty
                ? InkWell(
                    onTap: () async {
                      _model.searchFieldTextController?.clear();
                      logFirebaseEvent(
                          'SEARCH_SHELL_SearchField_ON_TEXTFIELD_CH');
                      if (_model.searchFieldTextController.text != '') {
                        logFirebaseEvent('SearchField_custom_action');
                        _model.searchResult = await actions.supabaseSearch(
                          widget.tableName!,
                          functions
                              .textSeparatorToList(
                                  widget.fieldsToReturnFromTable!, ',')
                              .toList(),
                          functions
                              .textSeparatorToList(
                                  widget.fieldsToSearchIn!, ',')
                              .toList(),
                          _model.searchFieldTextController.text,
                          0,
                          widget.maxNumberOfResults,
                          true,
                          widget.preDefineSearch!,
                        );
                        if (getJsonField(
                          _model.searchResult,
                          r'''$.success''',
                        )) {
                          logFirebaseEvent(
                              'SearchField_update_component_state');
                          _model.numberOfResults = getJsonField(
                            _model.searchResult,
                            r'''$.count''',
                          );
                          _model.searchResultBody = getJsonField(
                            _model.searchResult,
                            r'''$.*''',
                          );
                          _model.searchError = null;
                          _model.updatePage(() {});
                          if (_model.numberOfResults! > 0) {
                            logFirebaseEvent(
                                'SearchField_update_component_state');
                            _model.hasResults = true;
                            _model.successButNoResult = false;
                            _model.result = getJsonField(
                              _model.searchResult,
                              r'''$.result''',
                            );
                            _model.updatePage(() {});
                          } else {
                            logFirebaseEvent(
                                'SearchField_update_component_state');
                            _model.hasResults = false;
                            _model.successButNoResult = true;
                            _model.updatePage(() {});
                          }
                        } else {
                          logFirebaseEvent(
                              'SearchField_update_component_state');
                          _model.isTestMode = false;
                          _model.numberOfResults = null;
                          _model.hasResults = false;
                          _model.successButNoResult = false;
                          _model.searchResultBody = null;
                          _model.result = null;
                          _model.searchError = getJsonField(
                            _model.searchResult,
                            r'''$.error''',
                          ).toString();
                          _model.updatePage(() {});
                        }
                      } else {
                        logFirebaseEvent('SearchField_update_component_state');
                        _model.isTestMode = false;
                        _model.numberOfResults = null;
                        _model.hasResults = false;
                        _model.successButNoResult = false;
                        _model.searchResultBody = null;
                        _model.result = null;
                        _model.updatePage(() {});
                      }

                      safeSetState(() {});
                      safeSetState(() {});
                    },
                    child: Icon(
                      Icons.clear,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                  )
                : null,
          ),
          style: FlutterFlowTheme.of(context).labelSmall.override(
                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14.0,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
              ),
          validator:
              _model.searchFieldTextControllerValidator.asValidator(context),
        ),
        if (_model.isTestMode)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_model.searchResultBody != null)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            _model.searchResultBody?.toString(),
                            '-Body',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_model.searchError != null && _model.searchError != '')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            _model.searchError,
                            'error',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
