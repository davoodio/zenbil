import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/cart_badge_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  UsersRow? currentUser;

  int counterOrderGroup = 0;

  int counterOrderProduct = 0;

  List<int> uniqueBusinesses = [];
  void addToUniqueBusinesses(int item) => uniqueBusinesses.add(item);
  void removeFromUniqueBusinesses(int item) => uniqueBusinesses.remove(item);
  void removeAtIndexFromUniqueBusinesses(int index) =>
      uniqueBusinesses.removeAt(index);
  void insertAtIndexInUniqueBusinesses(int index, int item) =>
      uniqueBusinesses.insert(index, item);
  void updateUniqueBusinessesAtIndex(int index, Function(int) updateFn) =>
      uniqueBusinesses[index] = updateFn(uniqueBusinesses[index]);

  List<int> uniqueproducts = [];
  void addToUniqueproducts(int item) => uniqueproducts.add(item);
  void removeFromUniqueproducts(int item) => uniqueproducts.remove(item);
  void removeAtIndexFromUniqueproducts(int index) =>
      uniqueproducts.removeAt(index);
  void insertAtIndexInUniqueproducts(int index, int item) =>
      uniqueproducts.insert(index, item);
  void updateUniqueproductsAtIndex(int index, Function(int) updateFn) =>
      uniqueproducts[index] = updateFn(uniqueproducts[index]);

  List<OrderGroupsRow> orderGroups = [];
  void addToOrderGroups(OrderGroupsRow item) => orderGroups.add(item);
  void removeFromOrderGroups(OrderGroupsRow item) => orderGroups.remove(item);
  void removeAtIndexFromOrderGroups(int index) => orderGroups.removeAt(index);
  void insertAtIndexInOrderGroups(int index, OrderGroupsRow item) =>
      orderGroups.insert(index, item);
  void updateOrderGroupsAtIndex(int index, Function(OrderGroupsRow) updateFn) =>
      orderGroups[index] = updateFn(orderGroups[index]);

  List<OrderProductsRow> orderproducts = [];
  void addToOrderproducts(OrderProductsRow item) => orderproducts.add(item);
  void removeFromOrderproducts(OrderProductsRow item) =>
      orderproducts.remove(item);
  void removeAtIndexFromOrderproducts(int index) =>
      orderproducts.removeAt(index);
  void insertAtIndexInOrderproducts(int index, OrderProductsRow item) =>
      orderproducts.insert(index, item);
  void updateOrderproductsAtIndex(
          int index, Function(OrderProductsRow) updateFn) =>
      orderproducts[index] = updateFn(orderproducts[index]);

  OrderGroupsRow? currentOrderGroup;

  CartProductStruct? currentCartProduct;
  void updateCurrentCartProductStruct(Function(CartProductStruct) updateFn) {
    updateFn(currentCartProduct ??= CartProductStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for CartBadge component.
  late CartBadgeModel cartBadgeModel;
  // Stores action output result for [Backend Call - Query Rows] action in Checkoutting widget.
  List<UsersRow>? user;
  // Stores action output result for [Backend Call - Insert Row] action in Checkoutting widget.
  OrdersRow? order;
  // Stores action output result for [Backend Call - Insert Row] action in Checkoutting widget.
  OrderGroupsRow? orderGroup;
  // Stores action output result for [Backend Call - Insert Row] action in Checkoutting widget.
  OrderProductsRow? orderProduct;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cartBadgeModel = createModel(context, () => CartBadgeModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    cartBadgeModel.dispose();
  }
}
