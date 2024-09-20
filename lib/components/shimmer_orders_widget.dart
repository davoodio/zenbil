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
import 'shimmer_orders_model.dart';
export 'shimmer_orders_model.dart';

class ShimmerOrdersWidget extends StatefulWidget {
  const ShimmerOrdersWidget({
    super.key,
    Color? boxColor,
    int? amountListItems,
  })  : this.boxColor = boxColor ?? const Color(0xFFE4E4E4),
        this.amountListItems = amountListItems ?? 4;

  final Color boxColor;
  final int amountListItems;

  @override
  State<ShimmerOrdersWidget> createState() => _ShimmerOrdersWidgetState();
}

class _ShimmerOrdersWidgetState extends State<ShimmerOrdersWidget>
    with TickerProviderStateMixin {
  late ShimmerOrdersModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerOrdersModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.6,
            end: 1.0,
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
    return Builder(
      builder: (context) {
        final shimmerOrder = functions
            .generateRandonListOfNumbers(widget!.amountListItems)
            .toList();

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: shimmerOrder.length,
          itemBuilder: (context, shimmerOrderIndex) {
            final shimmerOrderItem = shimmerOrder[shimmerOrderIndex];
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: widget!.boxColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 10.0,
                                          decoration: BoxDecoration(
                                            color: widget!.boxColor,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        Container(
                                          width: 80.0,
                                          height: 10.0,
                                          decoration: BoxDecoration(
                                            color: widget!.boxColor,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: widget!.boxColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: widget!.boxColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: widget!.boxColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                Container(
                                  width: 60.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: widget!.boxColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
