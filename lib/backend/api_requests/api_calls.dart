import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OnroSupabaseCalls Group Code

class OnroSupabaseCallsGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://folfryveuoptkooqemhm.supabase.co/functions/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
    'Content-type': 'application/json',
  };
  static GetVehiclesCall getVehiclesCall = GetVehiclesCall();
  static GetServiceCall getServiceCall = GetServiceCall();
  static GetOrderDetailsCall getOrderDetailsCall = GetOrderDetailsCall();
  static TrackDriverOfAnOrderCall trackDriverOfAnOrderCall =
      TrackDriverOfAnOrderCall();
  static CancelOrderCall cancelOrderCall = CancelOrderCall();
  static GetNearDriversCall getNearDriversCall = GetNearDriversCall();
  static CalculateOndemanOrderCall calculateOndemanOrderCall =
      CalculateOndemanOrderCall();
  static AddOndemandOrderCall addOndemandOrderCall = AddOndemandOrderCall();
}

class GetVehiclesCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? serviceid = '',
    String? lat = '',
    String? lng = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "language": "$language",
  "serviceId": "$serviceid",
  "latitude": "$lat",
  "longitude": "$lng"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getVehicles',
      apiUrl: '${baseUrl}onro-get-vehicle-type',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetServiceCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
"language":"$language"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getService',
      apiUrl: '${baseUrl}onro-get-service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOrderDetailsCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? onroOrderId = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "language": "$language",
  "onroOrderId": "$onroOrderId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderDetails',
      apiUrl: '${baseUrl}onro-get-order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? trackOrderLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.onro_get_order.trackOrder''',
      ));
}

class TrackDriverOfAnOrderCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? onroOrderId = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "language": "$language",
  "onroOrderId": "$onroOrderId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TrackDriverOfAnOrder',
      apiUrl: '${baseUrl}onro-track-order-driver',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelOrderCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? onroOrderId = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "language": "$language",
  "onroOrderId": "$onroOrderId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CancelOrder',
      apiUrl: '${baseUrl}onro-cancel-order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNearDriversCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? lat = '',
    String? lng = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "language": "$language",
  "latitude": "$lat",
  "longitude": "$lng"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getNearDrivers',
      apiUrl: '${baseUrl}onro-get-near-drivers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculateOndemanOrderCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? pickupLongitude = '',
    String? pickupLatitude = '',
    String? pickupScheduleDateAfter = '',
    String? pickupScheduleDateBefore = '',
    bool? pickupSchedulePickupNow,
    dynamic dropoffsJson,
    String? vehicleTypeId = '',
    String? serviceId = '',
    bool? isScheduled,
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final dropoffs = _serializeJson(dropoffsJson, true);
    final ffApiRequestBody = '''
{
  "language": "$language",
  "pickupLongitude":"$pickupLongitude",
  "pickupLatitude":"$pickupLatitude",
  "pickupScheduleDateAfter":"$pickupScheduleDateAfter",
  "pickupScheduleDateBefore":"$pickupScheduleDateBefore",
  "pickupSchedulePickupNow":$pickupSchedulePickupNow,
  "dropoffs": $dropoffs,
  "vehicleTypeId":"$vehicleTypeId",
  "serviceId" : "$serviceId",
  "isScheduled" : $isScheduled
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CalculateOndemanOrder',
      apiUrl: '${baseUrl}onro-calculate-ondemand-order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddOndemandOrderCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? pickupLongitude = '',
    String? pickupLatitude = '',
    int? pickupAddressId,
    String? pickupScheduleDateAfter = '',
    String? pickupScheduleDateBefore = '',
    bool? pickupSchedulePickupNow,
    dynamic dropoffsJson,
    String? vehicleTypeId = '',
    String? serviceId = '',
    bool? isScheduled,
    String? paymentSide = '',
    String? userCode = '',
    String? forUserId = '',
    String? jwt = '',
  }) async {
    final baseUrl = OnroSupabaseCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final dropoffs = _serializeJson(dropoffsJson, true);
    final ffApiRequestBody = '''
{
  "language": "$language",
  "pickupLongitude": "$pickupLongitude",
  "pickupLatitude": "$pickupLatitude",
  "pickupAddressId": $pickupAddressId,
  "pickupScheduleDateAfter": "$pickupScheduleDateAfter",
  "pickupScheduleDateBefore": "$pickupScheduleDateBefore",
  "pickupSchedulePickupNow": $pickupSchedulePickupNow,
  "dropoffs": $dropoffs,
  "vehicleTypeId": "$vehicleTypeId",
  "serviceId": "$serviceId",
  "isScheduled": $isScheduled,
  "paymentSide": "$paymentSide",
  "userCode": "$userCode",
  "forUserId": "$forUserId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddOndemandOrder',
      apiUrl: '${baseUrl}onro-add-ondemand-order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OnroSupabaseCalls Group Code

/// Start AmwalSupabase Group Code

class AmwalSupabaseGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://api.zenbil.io/functions/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
  };
  static StartPaymentCall startPaymentCall = StartPaymentCall();
}

class StartPaymentCall {
  Future<ApiCallResponse> call({
    String? paymentType = '',
    double? amount,
    String? currencyUnit = '',
    int? recordId,
    int? addressId,
    String? returnUrl = '',
    int? walletId,
    String? jwt = '',
  }) async {
    final baseUrl = AmwalSupabaseGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "paymentType": "$paymentType",
  "amount": $amount,
  "currencyUnit": "$currencyUnit",
  "recordId": $recordId,
  "addressId": $addressId,
  "returnUrl": "$returnUrl",
  "walletId": $walletId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StartPayment',
      apiUrl: '${baseUrl}amwal-start',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? transactionRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.tran_ref''',
      ));
  String? transactionType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.tran_type''',
      ));
  String? cartID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.cart_id''',
      ));
  String? cartDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.cart_description''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.cart_currency''',
      ));
  String? cartAmount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.cart_amount''',
      ));
  String? transactionTotal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.tran_total''',
      ));
  String? paymentCallbackUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.callback''',
      ));
  String? paymentRedirectUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.redirect_url''',
      ));
  String? paymentReturnURLOurs(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.return''',
      ));
  String? customerDetailName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.customer_details.name''',
      ));
  String? customerDetailIPAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.customer_details.ip''',
      ));
  int? serviceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amwal_payment.serviceId''',
      ));
  int? profileID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amwal_payment.profileId''',
      ));
  int? merchantID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amwal_payment.merchantId''',
      ));
  String? trace(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amwal_payment.trace''',
      ));
  String? redirectURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.redirect_url''',
      ));
  bool? needRedirect(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.need_redirect''',
      ));
}

/// End AmwalSupabase Group Code

/// Start FIBSupabase Group Code

class FIBSupabaseGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://folfryveuoptkooqemhm.supabase.co/functions/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
  };
  static PaymentStartCall paymentStartCall = PaymentStartCall();
  static CancelPaymentCall cancelPaymentCall = CancelPaymentCall();
  static RefundPaymentCall refundPaymentCall = RefundPaymentCall();
}

class PaymentStartCall {
  Future<ApiCallResponse> call({
    String? paymentType = '',
    int? recordId,
    double? amount,
    String? currencyUnit = '',
    int? walletId,
    String? jwt = '',
  }) async {
    final baseUrl = FIBSupabaseGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "paymentType": "$paymentType",
  "recordId": $recordId,
  "walletId": $walletId,
  "amount": $amount,
  "currencyUnit": "$currencyUnit"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PaymentStart',
      apiUrl: '${baseUrl}pay-start',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? paymentID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.paymentId''',
      ));
  String? readableCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.readableCode''',
      ));
  String? qRCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.qrCode''',
      ));
  String? validUntilDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.validUntil''',
      ));
  String? personalAppLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.personalAppLink''',
      ));
  String? businessAppLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.businessAppLink''',
      ));
  String? corporateAppLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fib_payment.corporateAppLink''',
      ));
}

class CancelPaymentCall {
  Future<ApiCallResponse> call({
    String? paymentType = '',
    int? recordId,
    String? jwt = '',
  }) async {
    final baseUrl = FIBSupabaseGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "paymentType": "$paymentType",
  "recordId": $recordId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CancelPayment',
      apiUrl: '${baseUrl}pay-cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefundPaymentCall {
  Future<ApiCallResponse> call({
    String? paymentType = '',
    int? recordId,
    String? jwt = '',
  }) async {
    final baseUrl = FIBSupabaseGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "paymentType": "$paymentType",
  "recordId": $recordId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RefundPayment',
      apiUrl: '${baseUrl}pay-refund',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End FIBSupabase Group Code

/// Start UserWalletCalls Group Code

class UserWalletCallsGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://folfryveuoptkooqemhm.supabase.co/functions/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
  };
  static PayWalletCall payWalletCall = PayWalletCall();
}

class PayWalletCall {
  Future<ApiCallResponse> call({
    String? paymentType = '',
    int? recordId,
    int? walletId,
    double? amount,
    String? currencyUnit = '',
    String? jwt = '',
  }) async {
    final baseUrl = UserWalletCallsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "paymentType": "$paymentType",
  "recordId": $recordId,
  "walletId": $walletId,
  "amount": $amount,
  "currencyUnit": "$currencyUnit"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PayWallet',
      apiUrl: '${baseUrl}pay-wallet',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End UserWalletCalls Group Code

/// Start SupabaseApiCall Group Code

class SupabaseApiCallGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://api.zenbil.io/functions/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
    'Content-type': 'application/json',
  };
  static DeliveryMethodsCall deliveryMethodsCall = DeliveryMethodsCall();
  static CalculateOrderGroupCall calculateOrderGroupCall =
      CalculateOrderGroupCall();
}

class DeliveryMethodsCall {
  Future<ApiCallResponse> call({
    int? orderId,
    String? jwt = '',
  }) async {
    final baseUrl = SupabaseApiCallGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "orderId": $orderId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeliveryMethods',
      apiUrl: '${baseUrl}onro-delivery-methods',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? orderGroups(dynamic response) => getJsonField(
        response,
        r'''$.order_groups''',
        true,
      ) as List?;
}

class CalculateOrderGroupCall {
  Future<ApiCallResponse> call({
    int? orderGroupId,
    int? deliveryAddressId,
    String? jwt = '',
  }) async {
    final baseUrl = SupabaseApiCallGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "orderGroupId": $orderGroupId,
  "deliveryAddressId": $deliveryAddressId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CalculateOrderGroup',
      apiUrl: '${baseUrl}onro-calculate-order-group',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $jwt',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? orderGroups(dynamic response) => getJsonField(
        response,
        r'''$.order_groups''',
        true,
      ) as List?;
}

/// End SupabaseApiCall Group Code

/// Start BranchIOApi Group Code

class BranchIOApiGroup {
  static String getBaseUrl() => 'https://api2.branch.io/v1/';
  static Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
  };
  static CreateDeepLinkURLCall createDeepLinkURLCall = CreateDeepLinkURLCall();
  static ReadExistingDeepLinkCall readExistingDeepLinkCall =
      ReadExistingDeepLinkCall();
}

class CreateDeepLinkURLCall {
  Future<ApiCallResponse> call({
    String? branchKey = '',
    int? marketId,
  }) async {
    final baseUrl = BranchIOApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "branch_key": "$branchKey",
  "channel": "app",
  "feature": "share",
  "alias": "productsStore?marketID=$marketId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateDeepLinkURL',
      apiUrl: '${baseUrl}url',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class ReadExistingDeepLinkCall {
  Future<ApiCallResponse> call({
    String? url = '',
    String? branchKey = '',
  }) async {
    final baseUrl = BranchIOApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ReadExistingDeepLink',
      apiUrl: '${baseUrl}url',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      params: {
        'url': url,
        'branch_key': branchKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BranchIOApi Group Code

/// Start GoogleMapApis Group Code

class GoogleMapApisGroup {
  static String getBaseUrl() => 'https://maps.googleapis.com/maps/api/';
  static Map<String, String> headers = {};
  static GetPlaceCall getPlaceCall = GetPlaceCall();
  static GetCurrentAddressCall getCurrentAddressCall = GetCurrentAddressCall();
  static GetCurrentAddressPlaceIdCall getCurrentAddressPlaceIdCall =
      GetCurrentAddressPlaceIdCall();
}

class GetPlaceCall {
  Future<ApiCallResponse> call({
    String? inputTextAddress = '',
    String? language = '',
  }) async {
    final baseUrl = GoogleMapApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetPlace',
      apiUrl: '${baseUrl}place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': inputTextAddress,
        'key': "AIzaSyDyudynYqApb4nWUEbVahvVxCjSzllj-rw",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? predictions(dynamic response) => getJsonField(
        response,
        r'''$.predictions''',
        true,
      ) as List?;
  List<String>? predictionsDescriptions(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCurrentAddressCall {
  Future<ApiCallResponse> call({
    String? latlang = '',
    String? language = '',
  }) async {
    final baseUrl = GoogleMapApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getCurrentAddress',
      apiUrl: '${baseUrl}geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlang,
        'key': "AIzaSyDyudynYqApb4nWUEbVahvVxCjSzllj-rw",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? fullAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      ));
  double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lat''',
      ));
  double? long(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lng''',
      ));
  dynamic locationLatlongJSON(dynamic response) => getJsonField(
        response,
        r'''$.results[0].geometry.location''',
      );
  String? placeID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].place_id''',
      ));
  dynamic streetNumber(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="street_number")].long_name''',
      );
  dynamic route(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="route")].long_name''',
      );
  dynamic neighborhood(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="neighborhood")].long_name''',
      );
  String? political(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="political")].long_name''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="administrative_area_level_2")].long_name''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="administrative_area_level_1")].long_name''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="country")].long_name''',
      ));
  dynamic postalCode(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="postal_code")].long_name''',
      );
}

class GetCurrentAddressPlaceIdCall {
  Future<ApiCallResponse> call({
    String? placeId = '',
    String? language = '',
  }) async {
    final baseUrl = GoogleMapApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getCurrentAddressPlaceId',
      apiUrl: '${baseUrl}geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyDyudynYqApb4nWUEbVahvVxCjSzllj-rw",
        'place_id': placeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? fullAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      ));
  double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lat''',
      ));
  double? long(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lng''',
      ));
  dynamic locationLatlongJSON(dynamic response) => getJsonField(
        response,
        r'''$.results[0].geometry.location''',
      );
  String? placeID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].place_id''',
      ));
  String? streetNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="street_number")].long_name''',
      ));
  String? route(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="route")].long_name''',
      ));
  dynamic neighborhood(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="neighborhood")].long_name''',
      );
  dynamic political(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="political")].long_name''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="administrative_area_level_2")].long_name''',
      );
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="administrative_area_level_1")].long_name''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="country")].long_name''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=="postal_code")].long_name''',
      ));
}

/// End GoogleMapApis Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
