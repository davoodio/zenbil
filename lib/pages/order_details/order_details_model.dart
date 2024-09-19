import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/order_group_delivery_item/order_group_delivery_item_widget.dart';
import '/components/shimmer_orders_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_details_widget.dart' show OrderDetailsWidget;
import 'package:flutter/material.dart';

class OrderDetailsModel extends FlutterFlowModel<OrderDetailsWidget> {
  ///  Local state fields for this page.

  OrdersRow? order;

  List<OrderGroupsRow> orderGroups = [];
  void addToOrderGroups(OrderGroupsRow item) => orderGroups.add(item);
  void removeFromOrderGroups(OrderGroupsRow item) => orderGroups.remove(item);
  void removeAtIndexFromOrderGroups(int index) => orderGroups.removeAt(index);
  void insertAtIndexInOrderGroups(int index, OrderGroupsRow item) =>
      orderGroups.insert(index, item);
  void updateOrderGroupsAtIndex(int index, Function(OrderGroupsRow) updateFn) =>
      orderGroups[index] = updateFn(orderGroups[index]);

  List<OrderProductsRow> orderProducts = [];
  void addToOrderProducts(OrderProductsRow item) => orderProducts.add(item);
  void removeFromOrderProducts(OrderProductsRow item) =>
      orderProducts.remove(item);
  void removeAtIndexFromOrderProducts(int index) =>
      orderProducts.removeAt(index);
  void insertAtIndexInOrderProducts(int index, OrderProductsRow item) =>
      orderProducts.insert(index, item);
  void updateOrderProductsAtIndex(
          int index, Function(OrderProductsRow) updateFn) =>
      orderProducts[index] = updateFn(orderProducts[index]);

  UserAddressesRow? currentAddress;

  UsersRow? currentUser;

  DeliveryMethodsRow? deliveryMethod;

  List<BusinessesRow> orderGroupBusinessesList = [];
  void addToOrderGroupBusinessesList(BusinessesRow item) =>
      orderGroupBusinessesList.add(item);
  void removeFromOrderGroupBusinessesList(BusinessesRow item) =>
      orderGroupBusinessesList.remove(item);
  void removeAtIndexFromOrderGroupBusinessesList(int index) =>
      orderGroupBusinessesList.removeAt(index);
  void insertAtIndexInOrderGroupBusinessesList(int index, BusinessesRow item) =>
      orderGroupBusinessesList.insert(index, item);
  void updateOrderGroupBusinessesListAtIndex(
          int index, Function(BusinessesRow) updateFn) =>
      orderGroupBusinessesList[index] =
          updateFn(orderGroupBusinessesList[index]);

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in OrderDetails widget.
  List<OrdersRow>? orderLoaded;
  // Stores action output result for [Backend Call - Query Rows] action in OrderDetails widget.
  List<OrderGroupsRow>? orderGroupsLoaded;
  // Stores action output result for [Backend Call - Query Rows] action in OrderDetails widget.
  List<BusinessesRow>? orderGroupBusinesses;
  // Stores action output result for [Backend Call - Query Rows] action in OrderDetails widget.
  List<OrderProductsRow>? orderProductsLoaded;
  // Stores action output result for [Backend Call - Query Rows] action in OrderDetails widget.
  List<UserAddressesRow>? addressLoaded;
  // Stores action output result for [Backend Call - Query Rows] action in OrderDetails widget.
  List<UsersRow>? userLoaded;
  // Model for Header component.
  late HeaderModel headerModel;
  // Models for OrderGroupDeliveryItem dynamic component.
  late FlutterFlowDynamicModels<OrderGroupDeliveryItemModel>
      orderGroupDeliveryItemModels;
  // Model for ShimmerOrders component.
  late ShimmerOrdersModel shimmerOrdersModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    orderGroupDeliveryItemModels =
        FlutterFlowDynamicModels(() => OrderGroupDeliveryItemModel());
    shimmerOrdersModel = createModel(context, () => ShimmerOrdersModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    orderGroupDeliveryItemModels.dispose();
    shimmerOrdersModel.dispose();
  }
}
