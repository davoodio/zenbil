import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_square_model.dart';
export 'product_square_model.dart';

class ProductSquareWidget extends StatefulWidget {
  const ProductSquareWidget({
    super.key,
    this.productImage,
  });

  final String? productImage;

  @override
  State<ProductSquareWidget> createState() => _ProductSquareWidgetState();
}

class _ProductSquareWidgetState extends State<ProductSquareWidget> {
  late ProductSquareModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSquareModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: Container(
        width: 72.0,
        height: 72.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: FlutterFlowTheme.of(context).boxShadow,
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 500),
              fadeOutDuration: Duration(milliseconds: 500),
              imageUrl: valueOrDefault<String>(
                widget!.productImage,
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shopping-express-wrb1ci/assets/47turnqldnz6/9k.png',
              ),
              width: 300.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
