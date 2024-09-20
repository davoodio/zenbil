import '/backend/schema/structs/index.dart';
import '/components/delivery_method_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'delivery_method_item_widget.dart' show DeliveryMethodItemWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryMethodItemModel
    extends FlutterFlowModel<DeliveryMethodItemWidget> {
  ///  Local state fields for this component.

  List<DeliveryOrdersStruct> orderGroupDeliveryMethod = [];
  void addToOrderGroupDeliveryMethod(DeliveryOrdersStruct item) =>
      orderGroupDeliveryMethod.add(item);
  void removeFromOrderGroupDeliveryMethod(DeliveryOrdersStruct item) =>
      orderGroupDeliveryMethod.remove(item);
  void removeAtIndexFromOrderGroupDeliveryMethod(int index) =>
      orderGroupDeliveryMethod.removeAt(index);
  void insertAtIndexInOrderGroupDeliveryMethod(
          int index, DeliveryOrdersStruct item) =>
      orderGroupDeliveryMethod.insert(index, item);
  void updateOrderGroupDeliveryMethodAtIndex(
          int index, Function(DeliveryOrdersStruct) updateFn) =>
      orderGroupDeliveryMethod[index] =
          updateFn(orderGroupDeliveryMethod[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - DeliveryMethodSelector] action in Container widget.
  String? deliveryMethodReturned;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getDeliveryMethods(
    BuildContext context, {
    required int? orderGroupId,
  }) async {}
}
