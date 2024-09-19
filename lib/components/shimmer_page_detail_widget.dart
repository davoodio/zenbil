import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'shimmer_page_detail_model.dart';
export 'shimmer_page_detail_model.dart';

class ShimmerPageDetailWidget extends StatefulWidget {
  const ShimmerPageDetailWidget({
    super.key,
    Color? boxColor,
    bool? showUpperSection,
  })  : boxColor = boxColor ?? const Color(0xFFE4E4E4),
        showUpperSection = showUpperSection ?? true;

  final Color boxColor;
  final bool showUpperSection;

  @override
  State<ShimmerPageDetailWidget> createState() =>
      _ShimmerPageDetailWidgetState();
}

class _ShimmerPageDetailWidgetState extends State<ShimmerPageDetailWidget>
    with TickerProviderStateMixin {
  late ShimmerPageDetailModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerPageDetailModel());

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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.showUpperSection)
                Container(
                  width: double.infinity,
                  height: 600.0,
                  decoration: BoxDecoration(
                    color: widget.boxColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 9.0,
                              height: 9.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 9.0,
                              height: 9.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 9.0,
                              height: 9.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 9.0,
                              height: 9.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 143.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        Container(
                          width: 88.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 188.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 99.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 188.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 224.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 142.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: widget.boxColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                              color: widget.boxColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Container(
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                              color: widget.boxColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Container(
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                              color: widget.boxColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(width: 16.0))
                            .addToStart(const SizedBox(width: 20.0))
                            .addToEnd(const SizedBox(width: 20.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 143.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 188.0,
                          height: 77.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 88.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: widget.boxColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}
