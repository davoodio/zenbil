import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'image_widget_model.dart';
export 'image_widget_model.dart';

class ImageWidgetWidget extends StatefulWidget {
  const ImageWidgetWidget({
    super.key,
    this.image,
    bool? isExpamdable,
    double? radius,
    required this.isAvatar,
  })  : isExpamdable = isExpamdable ?? false,
        radius = radius ?? 4.0;

  final String? image;
  final bool isExpamdable;
  final double radius;
  final bool? isAvatar;

  @override
  State<ImageWidgetWidget> createState() => _ImageWidgetWidgetState();
}

class _ImageWidgetWidgetState extends State<ImageWidgetWidget> {
  late ImageWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(valueOrDefault<double>(
        widget.radius,
        0.0,
      )),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget.radius,
            0.0,
          )),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              if (widget.image == null || widget.image == '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageUrl: valueOrDefault<String>(
                      widget.isAvatar!
                          ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/prism-dashboard-saa-s-metrics-u411hg/assets/l7oedzfucwjp/avatar-placeholder.jpeg'
                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/prism-dashboard-saa-s-metrics-u411hg/assets/roe0mpiueyb8/placeholder-image.png',
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/prism-dashboard-saa-s-metrics-u411hg/assets/roe0mpiueyb8/placeholder-image.png',
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              if (widget.isExpamdable &&
                  (widget.image != null && widget.image != ''))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('IMAGE_WIDGET_COMP_expanded_ON_TAP');
                  },
                  child: Hero(
                    tag: widget.image!,
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: widget.image!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (!widget.isExpamdable &&
                  (widget.image != null && widget.image != ''))
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageUrl: widget.image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
