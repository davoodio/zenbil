import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'delivery_home_widget.dart' show DeliveryHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryHomeModel extends FlutterFlowModel<DeliveryHomeWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? LocationUpdater;
  // Model for NavBarDelivery component.
  late NavBarDeliveryModel navBarDeliveryModel;

  @override
  void initState(BuildContext context) {
    navBarDeliveryModel = createModel(context, () => NavBarDeliveryModel());
  }

  @override
  void dispose() {
    LocationUpdater?.cancel();
    navBarDeliveryModel.dispose();
  }
}
