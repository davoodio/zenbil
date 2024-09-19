import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'line_colors_model.dart';
export 'line_colors_model.dart';

class LineColorsWidget extends StatefulWidget {
  const LineColorsWidget({super.key});

  @override
  State<LineColorsWidget> createState() => _LineColorsWidgetState();
}

class _LineColorsWidgetState extends State<LineColorsWidget> {
  late LineColorsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineColorsModel());

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
      height: 3.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFEF00FF),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF0400E1),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFF9C00),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF008EFF),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFF3500),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
