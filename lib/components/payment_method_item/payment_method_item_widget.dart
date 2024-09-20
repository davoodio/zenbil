import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'payment_method_item_model.dart';
export 'payment_method_item_model.dart';

class PaymentMethodItemWidget extends StatefulWidget {
  const PaymentMethodItemWidget({
    super.key,
    String? image,
    required this.methodName,
  }) : image = image ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shopping-express-wrb1ci/assets/amg2zsplg6at/fedex-express-6.png';

  final String image;
  final String? methodName;

  @override
  State<PaymentMethodItemWidget> createState() =>
      _PaymentMethodItemWidgetState();
}

class _PaymentMethodItemWidgetState extends State<PaymentMethodItemWidget> {
  late PaymentMethodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('PAYMENT_METHOD_ITEM_Container_quc2f1ur_O');
        logFirebaseEvent('Container_update_app_state');
        FFAppState().PaymentMethod = widget.methodName!;
        FFAppState().update(() {});
      },
      child: Container(
        width: 66.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tfBg,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              FFAppState().PaymentMethod == widget.methodName
                  ? FlutterFlowTheme.of(context).tertiary
                  : FlutterFlowTheme.of(context).tfBg,
              FlutterFlowTheme.of(context).tfBg,
            ),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              widget.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
