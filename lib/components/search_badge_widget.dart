import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_badge_model.dart';
export 'search_badge_model.dart';

class SearchBadgeWidget extends StatefulWidget {
  const SearchBadgeWidget({
    super.key,
    this.backColor,
    Color? iconColor,
    bool? goToSearchOnTap,
    required this.tableName,
    required this.fieldsToReturnFromTable,
    required this.fieldsToSearchIn,
    required this.searchTitle,
    required this.preDefineSearch,
  })  : iconColor = iconColor ?? Colors.white,
        goToSearchOnTap = goToSearchOnTap ?? true;

  final Color? backColor;
  final Color iconColor;
  final bool goToSearchOnTap;
  final String? tableName;
  final String? fieldsToReturnFromTable;
  final String? fieldsToSearchIn;
  final String? searchTitle;
  final String? preDefineSearch;

  @override
  State<SearchBadgeWidget> createState() => _SearchBadgeWidgetState();
}

class _SearchBadgeWidgetState extends State<SearchBadgeWidget> {
  late SearchBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBadgeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('SEARCH_BADGE_Container_sbdyzls3_ON_TAP');
        if (widget.goToSearchOnTap) {
          logFirebaseEvent('Container_navigate_to');

          context.pushNamed(
            'Search',
            queryParameters: {
              'tableName': serializeParam(
                widget.tableName,
                ParamType.String,
              ),
              'fieldsToReturnFromTable': serializeParam(
                widget.fieldsToReturnFromTable,
                ParamType.String,
              ),
              'fieldsToSearchIn': serializeParam(
                widget.fieldsToSearchIn,
                ParamType.String,
              ),
              'searchTitle': serializeParam(
                widget.searchTitle,
                ParamType.String,
              ),
              'preDefineSearch': serializeParam(
                widget.preDefineSearch,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
      },
      child: Container(
        width: 44.0,
        height: 44.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.backColor,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Icon(
                FFIcons.ksearch,
                color: widget.iconColor,
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
