import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/delivery_method_item_widget.dart';
import '/components/info_modal_widget.dart';
import '/components/pick_how_to_pay_widget.dart';
import '/components/shimmer_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  UserAddressesRow? userAddress;

  PaymentTypesRow? selectedPaymentType;

  List<DeliveryOrdersStruct> deliveryOptions = [];
  void addToDeliveryOptions(DeliveryOrdersStruct item) =>
      deliveryOptions.add(item);
  void removeFromDeliveryOptions(DeliveryOrdersStruct item) =>
      deliveryOptions.remove(item);
  void removeAtIndexFromDeliveryOptions(int index) =>
      deliveryOptions.removeAt(index);
  void insertAtIndexInDeliveryOptions(int index, DeliveryOrdersStruct item) =>
      deliveryOptions.insert(index, item);
  void updateDeliveryOptionsAtIndex(
          int index, Function(DeliveryOrdersStruct) updateFn) =>
      deliveryOptions[index] = updateFn(deliveryOptions[index]);

  int orderGroupsLoopCounter = 0;

  bool isLoading = false;

  List<String> availableMethodsForCurrentOrderGroup = [];
  void addToAvailableMethodsForCurrentOrderGroup(String item) =>
      availableMethodsForCurrentOrderGroup.add(item);
  void removeFromAvailableMethodsForCurrentOrderGroup(String item) =>
      availableMethodsForCurrentOrderGroup.remove(item);
  void removeAtIndexFromAvailableMethodsForCurrentOrderGroup(int index) =>
      availableMethodsForCurrentOrderGroup.removeAt(index);
  void insertAtIndexInAvailableMethodsForCurrentOrderGroup(
          int index, String item) =>
      availableMethodsForCurrentOrderGroup.insert(index, item);
  void updateAvailableMethodsForCurrentOrderGroupAtIndex(
          int index, Function(String) updateFn) =>
      availableMethodsForCurrentOrderGroup[index] =
          updateFn(availableMethodsForCurrentOrderGroup[index]);

  double? deliveryTotalFee;

  bool isApiCallUnsuccessful = false;

  List<DeliveryMethodTypesRow> deliberyTypes = [];
  void addToDeliberyTypes(DeliveryMethodTypesRow item) =>
      deliberyTypes.add(item);
  void removeFromDeliberyTypes(DeliveryMethodTypesRow item) =>
      deliberyTypes.remove(item);
  void removeAtIndexFromDeliberyTypes(int index) =>
      deliberyTypes.removeAt(index);
  void insertAtIndexInDeliberyTypes(int index, DeliveryMethodTypesRow item) =>
      deliberyTypes.insert(index, item);
  void updateDeliberyTypesAtIndex(
          int index, Function(DeliveryMethodTypesRow) updateFn) =>
      deliberyTypes[index] = updateFn(deliberyTypes[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Checkout widget.
  List<UserAddressesRow>? userAddressOnOrder;
  // Stores action output result for [Action Block - fetchDeliveryMethodsAvailableForOrderGroups] action in Checkout widget.
  List<dynamic>? groupedDeliveryMethodsForOrder;
  // Stores action output result for [Backend Call - Query Rows] action in Checkout widget.
  List<DeliveryMethodTypesRow>? deliveryTypesLoaded;
  // Stores action output result for [Bottom Sheet - InfoModal] action in IconButton widget.
  bool? cancelConfirm;
  // Models for DeliveryMethodItem dynamic component.
  late FlutterFlowDynamicModels<DeliveryMethodItemModel>
      deliveryMethodItemModels;
  // Stores action output result for [Action Block - calculateDeliveryPricesForOrder] action in DeliveryMethodItem widget.
  dynamic updatedCalculation;
  // Stores action output result for [Bottom Sheet - addressInsert] action in ChanageAddress widget.
  UserAddressesRow? addressReturned;
  // Stores action output result for [Backend Call - Update Row(s)] action in ChanageAddress widget.
  List<OrdersRow>? orderAddressUpdated;
  // Stores action output result for [Backend Call - Query Rows] action in ChanageAddress widget.
  List<OrdersRow>? updatedOrder;
  // Models for PickHowToPay dynamic component.
  late FlutterFlowDynamicModels<PickHowToPayModel> pickHowToPayModels;
  // Model for ShimmerContainer component.
  late ShimmerContainerModel shimmerContainerModel1;
  // Model for ShimmerContainer component.
  late ShimmerContainerModel shimmerContainerModel2;
  // Stores action output result for [Backend Call - API (PayWallet)] action in Button widget.
  ApiCallResponse? payWalletResponse;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WalletsRow>? walletQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PaymentTypesRow>? paymentTypeCOD;

  @override
  void initState(BuildContext context) {
    deliveryMethodItemModels =
        FlutterFlowDynamicModels(() => DeliveryMethodItemModel());
    pickHowToPayModels = FlutterFlowDynamicModels(() => PickHowToPayModel());
    shimmerContainerModel1 =
        createModel(context, () => ShimmerContainerModel());
    shimmerContainerModel2 =
        createModel(context, () => ShimmerContainerModel());
  }

  @override
  void dispose() {
    deliveryMethodItemModels.dispose();
    pickHowToPayModels.dispose();
    shimmerContainerModel1.dispose();
    shimmerContainerModel2.dispose();
  }

  /// Action blocks.
  Future<List<dynamic>?> fetchDeliveryMethodsAvailableForOrderGroups(
    BuildContext context, {
    required OrdersRow? order,
  }) async {
    ApiCallResponse? deliveryMethodsForOrder;
    dynamic orderGroupCalculation;

    logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
    isLoading = true;
    deliveryOptions = [];
    logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
    deliveryMethodsForOrder =
        await SupabaseApiCallGroup.deliveryMethodsCall.call(
      orderId: order?.id,
      jwt: currentJwtToken,
    );

    if (SupabaseApiCallGroup.deliveryMethodsCall.success(
      (deliveryMethodsForOrder.jsonBody ?? ''),
    )!) {
      while (orderGroupsLoopCounter <
          SupabaseApiCallGroup.deliveryMethodsCall
              .orderGroups(
                (deliveryMethodsForOrder.jsonBody ?? ''),
              )!
              .length) {
        logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
        await OrderGroupsTable().update(
          data: {
            'delivery_method_id': getJsonField(
              SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                (deliveryMethodsForOrder.jsonBody ?? ''),
              )?[orderGroupsLoopCounter],
              r'''$.grouped[0].method_id''',
            ),
            'delivery_method_mapping_id': getJsonField(
              SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                (deliveryMethodsForOrder.jsonBody ?? ''),
              )?[orderGroupsLoopCounter],
              r'''$.grouped[0].method_mapping_id''',
            ),
            'onro_delivery_method_id': getJsonField(
              SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                (deliveryMethodsForOrder.jsonBody ?? ''),
              )?[orderGroupsLoopCounter],
              r'''$.grouped[0].method_type_id''',
            ),
          },
          matchingRows: (rows) => rows.eq(
            'id',
            getJsonField(
              SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                (deliveryMethodsForOrder?.jsonBody ?? ''),
              )?[orderGroupsLoopCounter],
              r'''$.id''',
            ),
          ),
        );
        logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
        orderGroupCalculation = await calculateDeliveryPricesForOrder(
          context,
          orderGroupId: getJsonField(
            SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
              (deliveryMethodsForOrder.jsonBody ?? ''),
            )?[orderGroupsLoopCounter],
            r'''$.id''',
          ),
          deliveryAddressId: order?.userShippingAddressId,
        );
        if (orderGroupCalculation != null) {
          logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
          addToDeliveryOptions(DeliveryOrdersStruct(
            orderGroupId: getJsonField(
              SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                (deliveryMethodsForOrder.jsonBody ?? ''),
              )?[orderGroupsLoopCounter],
              r'''$.id''',
            ),
            deliveryOptionsAvailable: (getJsonField(
              SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                (deliveryMethodsForOrder.jsonBody ?? ''),
              )?[orderGroupsLoopCounter],
              r'''$.grouped[:].method_type_name''',
              true,
            ) as List)
                .map<String>((s) => s.toString())
                .toList(),
            selectedDeliveryMethodForOrderGroup:
                OrderGroupDeliveryMethodsStruct(
              methodId: getJsonField(
                SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                  (deliveryMethodsForOrder.jsonBody ?? ''),
                )?[orderGroupsLoopCounter],
                r'''$.grouped[0].method_id''',
              ),
              methodTypeId: getJsonField(
                SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                  (deliveryMethodsForOrder.jsonBody ?? ''),
                )?[orderGroupsLoopCounter],
                r'''$.grouped[0].method_type_id''',
              ),
              methodTypeName: getJsonField(
                SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                  (deliveryMethodsForOrder.jsonBody ?? ''),
                )?[orderGroupsLoopCounter],
                r'''$.grouped[0].method_type_name''',
              ).toString().toString(),
              methodMappingId: getJsonField(
                SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                  (deliveryMethodsForOrder.jsonBody ?? ''),
                )?[orderGroupsLoopCounter],
                r'''$.grouped[0].method_mapping_id''',
              ),
              methodTypeNameArabic: getJsonField(
                SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                  (deliveryMethodsForOrder.jsonBody ?? ''),
                )?[orderGroupsLoopCounter],
                r'''$.grouped[0].method_type_name_arabic''',
              ).toString().toString(),
              methodTypeNameKurdish: getJsonField(
                SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
                  (deliveryMethodsForOrder.jsonBody ?? ''),
                )?[orderGroupsLoopCounter],
                r'''$.grouped[0].method_type_name_kurdish''',
              ).toString().toString(),
            ),
            selectedOptionPrice: functions.roundToNearestDouble(getJsonField(
              orderGroupCalculation,
              r'''$.calculation.price''',
            )),
            selectedOptionCurrencyCode: getJsonField(
              orderGroupCalculation,
              r'''$.calculation.currencyCode''',
            ).toString().toString(),
          ));
          orderGroupsLoopCounter = orderGroupsLoopCounter + 1;
        }
      }
      logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
      orderGroupsLoopCounter = 0;
      deliveryTotalFee =
          functions.calculateDeliveryTotalOnCheckout(deliveryOptions.toList());
    } else {
      logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: double.infinity,
                child: InfoModalWidget(
                  icon: Icon(
                    FFIcons.kerrorCircleDefault,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 34.0,
                  ),
                  title: FFLocalizations.of(context).getText(
                    'gha3bzgd' /* Error fetching delivery detail... */,
                  ),
                  body: getJsonField(
                    (deliveryMethodsForOrder?.jsonBody ?? ''),
                    r'''$.error''',
                  ).toString().toString(),
                  autoDismiss: true,
                ),
              ),
            ),
          );
        },
      );

      logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
      isApiCallUnsuccessful = true;
      return getJsonField(
        (deliveryMethodsForOrder.jsonBody ?? ''),
        r'''$.error''',
        true,
      );
    }

    logFirebaseEvent('fetchDeliveryMethodsAvailableForOrderGro');
    isLoading = false;
    return SupabaseApiCallGroup.deliveryMethodsCall.orderGroups(
      (deliveryMethodsForOrder.jsonBody ?? ''),
    );
  }

  Future<dynamic> calculateDeliveryPricesForOrder(
    BuildContext context, {
    required int? orderGroupId,
    required int? deliveryAddressId,
  }) async {
    ApiCallResponse? deliveryPricesForOrder;

    logFirebaseEvent('calculateDeliveryPricesForOrder_backend_');
    deliveryPricesForOrder =
        await SupabaseApiCallGroup.calculateOrderGroupCall.call(
      orderGroupId: orderGroupId,
      deliveryAddressId: deliveryAddressId,
      jwt: currentJwtToken,
    );

    if (SupabaseApiCallGroup.calculateOrderGroupCall.success(
      (deliveryPricesForOrder.jsonBody ?? ''),
    )!) {
      return SupabaseApiCallGroup.calculateOrderGroupCall
          .orderGroups(
            (deliveryPricesForOrder.jsonBody ?? ''),
          )!
          .first;
    }

    logFirebaseEvent('calculateDeliveryPricesForOrder_bottom_s');
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: SizedBox(
              height: double.infinity,
              child: InfoModalWidget(
                icon: Icon(
                  FFIcons.kerrorCircleDefault,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 34.0,
                ),
                title: FFLocalizations.of(context).getText(
                  'tmhl22xk' /* Error fetching delivery detail... */,
                ),
                body: getJsonField(
                  (deliveryPricesForOrder?.jsonBody ?? ''),
                  r'''$.error''',
                ).toString().toString(),
                autoDismiss: true,
              ),
            ),
          ),
        );
      },
    );

    logFirebaseEvent('calculateDeliveryPricesForOrder_update_p');
    isApiCallUnsuccessful = true;
    return getJsonField(
      (deliveryPricesForOrder.jsonBody ?? ''),
      r'''$.error''',
    );
  }
}
