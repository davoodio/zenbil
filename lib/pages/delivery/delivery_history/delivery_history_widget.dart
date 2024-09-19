import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'delivery_history_model.dart';
export 'delivery_history_model.dart';

class DeliveryHistoryWidget extends StatefulWidget {
  const DeliveryHistoryWidget({super.key});

  @override
  State<DeliveryHistoryWidget> createState() => _DeliveryHistoryWidgetState();
}

class _DeliveryHistoryWidgetState extends State<DeliveryHistoryWidget> {
  late DeliveryHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryHistoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DeliveryHistory'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              wrapWithModel(
                model: _model.navBarDeliveryModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: NavBarDeliveryWidget(
                  activePage: FFLocalizations.of(context).getText(
                    'xvnf9xur' /* Delivery History */,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
