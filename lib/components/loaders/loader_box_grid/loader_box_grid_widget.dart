import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loader_box_grid_model.dart';
export 'loader_box_grid_model.dart';

class LoaderBoxGridWidget extends StatefulWidget {
  const LoaderBoxGridWidget({
    super.key,
    double? height,
    Color? color,
    double? borderRadius,
    Color? shimmerColor,
    int? numberOfItems,
  })  : this.height = height ?? 100.0,
        this.color = color ?? const Color(0xFFE0E0E0),
        this.borderRadius = borderRadius ?? 5.0,
        this.shimmerColor = shimmerColor ?? const Color(0xFFE1E1E1),
        this.numberOfItems = numberOfItems ?? 4;

  final double height;
  final Color color;
  final double borderRadius;
  final Color shimmerColor;
  final int numberOfItems;

  @override
  State<LoaderBoxGridWidget> createState() => _LoaderBoxGridWidgetState();
}

class _LoaderBoxGridWidgetState extends State<LoaderBoxGridWidget>
    with TickerProviderStateMixin {
  late LoaderBoxGridModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoaderBoxGridModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: valueOrDefault<Color>(
              widget!.shimmerColor,
              Color(0xFFDEDEDE),
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
    return Container(
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final item = functions
              .generateRandonListOfNumbers(widget!.numberOfItems)
              .toList();

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: item.length,
            itemBuilder: (context, itemIndex) {
              final itemItem = item[itemIndex];
              return Container(
                height: widget!.height,
                decoration: BoxDecoration(
                  color: widget!.color,
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget!.borderRadius,
                    0.0,
                  )),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!);
            },
          );
        },
      ),
    );
  }
}
