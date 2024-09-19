import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loader_box_model.dart';
export 'loader_box_model.dart';

class LoaderBoxWidget extends StatefulWidget {
  const LoaderBoxWidget({
    super.key,
    double? width,
    double? height,
    Color? color,
    double? borderRadius,
    Color? shimmerColor,
    double? paddingLeftRight,
    double? padingTopBottom,
  })  : width = width ?? 100.0,
        height = height ?? 100.0,
        color = color ?? const Color(0xFFE0E0E0),
        borderRadius = borderRadius ?? 5.0,
        shimmerColor = shimmerColor ?? const Color(0xFFE1E1E1),
        paddingLeftRight = paddingLeftRight ?? 0.0,
        padingTopBottom = padingTopBottom ?? 0.0;

  final double width;
  final double height;
  final Color color;
  final double borderRadius;
  final Color shimmerColor;
  final double paddingLeftRight;
  final double padingTopBottom;

  @override
  State<LoaderBoxWidget> createState() => _LoaderBoxWidgetState();
}

class _LoaderBoxWidgetState extends State<LoaderBoxWidget>
    with TickerProviderStateMixin {
  late LoaderBoxModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoaderBoxModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: valueOrDefault<Color>(
              widget.shimmerColor,
              const Color(0xFFDEDEDE),
            ),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            widget.paddingLeftRight,
            0.0,
          ),
          valueOrDefault<double>(
            widget.padingTopBottom,
            0.0,
          ),
          valueOrDefault<double>(
            widget.paddingLeftRight,
            0.0,
          ),
          valueOrDefault<double>(
            widget.padingTopBottom,
            0.0,
          )),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget.borderRadius,
            0.0,
          )),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
