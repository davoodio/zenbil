import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/address_return_place_id_widget.dart';
import '/components/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future userControl(BuildContext context) async {
  dynamic? createdAnonUser;
  UsersRow? currentUserLoaded;
  String? userAuthProvider;
  List<UserRoleRow>? userRole;
  List<RolesRow>? roleOfTheUser;

  if (!loggedIn) {
    logFirebaseEvent('UserControl_custom_action');
    createdAnonUser = await actions.userAnonymousLogin(
      FFAppConstants.AnonUserEmail,
      FFAppConstants.anonUserPass,
    );
    if (ActionJsonResponseMapStruct.maybeFromMap(createdAnonUser!)!.success) {
      logFirebaseEvent('UserControl_custom_action');
      await actions.printAction(
        'User Anon Logged in > Control Again',
      );
      logFirebaseEvent('UserControl_navigate_to');
      if (Navigator.of(context).canPop()) {
        context.pop();
      }
      context.pushNamed('Control');

      return;
    } else {
      logFirebaseEvent('UserControl_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Error!'),
            content:
                Text('Seems there is issue to on board you! please try again'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      logFirebaseEvent('UserControl_navigate_to');

      context.goNamed('Splash');

      return;
    }
  } else {
    logFirebaseEvent('UserControl_custom_action');
    await actions.printAction(
      'User is logged in',
    );
    logFirebaseEvent('UserControl_action_block');
    currentUserLoaded = await action_blocks.setCurrentUserInAppState(context);
    logFirebaseEvent('UserControl_custom_action');
    await actions.printAction(
      'User Set to app state-Finished',
    );
    if (currentUserLoaded?.email == FFAppConstants.AnonUserEmail) {
      logFirebaseEvent('UserControl_custom_action');
      await actions.printAction(
        'User is anon > Go to home',
      );
    } else {
      logFirebaseEvent('UserControl_custom_action');
      userAuthProvider = await actions.getUserAuthProvider();
      logFirebaseEvent('UserControl_backend_call');
      await UsersTable().update(
        data: {
          'auth_provider': userAuthProvider,
        },
        matchingRows: (rows) => rows.eq(
          'id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('UserControl_custom_action');
      await actions.printAction(
        'Auth provider returned and wroted to user row',
      );
      if (currentUserLoaded?.userType == UserTypes.Delivery.name) {
        logFirebaseEvent('UserControl_custom_action');
        await actions.printAction(
          'User type > Delivery',
        );
        logFirebaseEvent('UserControl_backend_call');
        userRole = await UserRoleTable().queryRows(
          queryFn: (q) => q.eq(
            'user_id',
            currentUserUid,
          ),
        );
        logFirebaseEvent('UserControl_custom_action');
        await actions.printAction(
          'User > Delivery',
        );
        if (userRole!.length > 0) {
          logFirebaseEvent('UserControl_backend_call');
          roleOfTheUser = await RolesTable().queryRows(
            queryFn: (q) => q.eq(
              'code',
              userRole?.first?.roleCode,
            ),
          );
          logFirebaseEvent('UserControl_update_app_state');
          FFAppState().Role = RoleStruct(
            name: roleOfTheUser?.first?.name,
            fullAccess: roleOfTheUser?.first?.fullAccess,
            accountantAccess: roleOfTheUser?.first?.accountantAccess,
            deliveryAccess: roleOfTheUser?.first?.deliveryAccess,
            readOnly: roleOfTheUser?.first?.readOnly,
            id: roleOfTheUser?.first?.id,
            code: roleOfTheUser?.first?.code,
          );
          FFAppState().update(() {});
          logFirebaseEvent('UserControl_custom_action');
          await actions.printAction(
            'User delivery role loaded > Home',
          );
          logFirebaseEvent('UserControl_navigate_to');

          context.goNamed('DeliveryHome');

          return;
        }
      } else {
        logFirebaseEvent('UserControl_custom_action');
        await actions.printAction(
          'User auth > Phone',
        );
        if (!(currentUserLoaded?.userName != null &&
            currentUserLoaded?.userName != '')) {
          logFirebaseEvent('UserControl_navigate_to');

          context.goNamed(
            'EditProfile',
            queryParameters: {
              'isOnBoarding': serializeParam(
                true,
                ParamType.bool,
              ),
            }.withoutNulls,
          );

          return;
        }
      }
    }

    logFirebaseEvent('UserControl_update_app_state');
    FFAppState().storeID = 0;
    logFirebaseEvent('UserControl_navigate_to');

    context.goNamed('zenbil');
  }
}

Future anonUserCheck(BuildContext context) async {
  if (FFAppState().CurrentUser.isAnon) {
    logFirebaseEvent('AnonUserCheck_navigate_to');

    context.pushNamed(
      'Signup',
      queryParameters: {
        'showBackButton': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
    );

    return;
  }
}

Future phoneAuth(
  BuildContext context, {
  required String? phoneNumber,
  required int? countryId,
}) async {
  CountriesRow? currentCountry;
  dynamic? signinWithPhone;

  logFirebaseEvent('PhoneAuth_custom_action');
  currentCountry = await actions.getCountrySingle(
    countryId!,
  );
  logFirebaseEvent('PhoneAuth_action_block');
  await action_blocks.setCountry(
    context,
    country: currentCountry,
  );
  logFirebaseEvent('PhoneAuth_update_app_state');
  FFAppState().country = CountryStruct(
    name: currentCountry?.name,
    code: currentCountry?.code,
    currencyCode: FFAppConstants.defaultCurrencyCode,
    currencySymbol: FFAppConstants.defaultCurrencySymbol,
    dialCode: currentCountry?.dialCode,
    currencyExchangeRate: 1.00,
  );
  logFirebaseEvent('PhoneAuth_custom_action');
  await actions.printAction(
    'Phone: ${currentCountry?.dialCode}${phoneNumber}',
  );
  logFirebaseEvent('PhoneAuth_custom_action');
  signinWithPhone = await actions.signInWithOtp(
    '${currentCountry?.dialCode}${phoneNumber}',
  );
  if (ActionJsonResponseMapStruct.maybeFromMap(signinWithPhone!)!.success) {
    logFirebaseEvent('PhoneAuth_navigate_to');

    context.goNamed(
      'PinCodeVerification',
      queryParameters: {
        'phoneNumber': serializeParam(
          '${currentCountry?.dialCode}${phoneNumber}',
          ParamType.String,
        ),
        'countryId': serializeParam(
          countryId,
          ParamType.int,
        ),
      }.withoutNulls,
    );

    return;
  } else {
    logFirebaseEvent('PhoneAuth_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error! Please try again.',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).white,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        duration: Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).appleBg,
      ),
    );
    return;
  }
}

Future setCountry(
  BuildContext context, {
  CountriesRow? country,
}) async {
  logFirebaseEvent('SetCountry_update_app_state');
  FFAppState().country = CountryStruct(
    name: country?.name,
    code: country?.code,
    currencyCode: FFAppConstants.defaultCurrencyCode != null &&
            FFAppConstants.defaultCurrencyCode != ''
        ? FFAppConstants.defaultCurrencyCode
        : country?.currencyCode,
    currencySymbol: FFAppConstants.defaultCurrencySymbol != null &&
            FFAppConstants.defaultCurrencySymbol != ''
        ? FFAppConstants.defaultCurrencySymbol
        : country?.currencySymbol,
    dialCode: country?.dialCode,
    currencyExchangeRate: FFAppConstants.defaultCurrencyCode != null &&
            FFAppConstants.defaultCurrencyCode != ''
        ? 1.00
        : country?.currencyExchangeRate,
    id: FFAppConstants.defaultCurrencySymbol != null &&
            FFAppConstants.defaultCurrencySymbol != ''
        ? 1
        : country?.id,
  );
  FFAppState().update(() {});
}

Future<UsersRow> setCurrentUserInAppState(BuildContext context) async {
  List<UsersRow>? currentUserLoaded;

  logFirebaseEvent('SetCurrentUserInAppState_backend_call');
  currentUserLoaded = await UsersTable().queryRows(
    queryFn: (q) => q.eq(
      'id',
      currentUserUid,
    ),
  );
  logFirebaseEvent('SetCurrentUserInAppState_update_app_stat');
  FFAppState().CurrentUser = CurrentUserStruct(
    createdAt: currentUserLoaded?.first?.createdAt,
    mobileNumber: currentUserLoaded?.first?.mobileNumber,
    firstName: currentUserLoaded?.first?.firstName,
    lastName: currentUserLoaded?.first?.lastName,
    displayName: currentUserLoaded?.first?.displayName,
    lastLoginDate: currentUserLoaded?.first?.lastLoginDate,
    bio: currentUserLoaded?.first?.bio,
    address: currentUserLoaded?.first?.address,
    cityId: currentUserLoaded?.first?.cityId,
    isAnon: currentUserLoaded?.first?.isAnon,
    email: currentUserLoaded?.first?.email,
    defaultPaymentTypeId: currentUserLoaded?.first?.defaultPaymentTypeId,
    defaultAddressId: currentUserLoaded?.first?.defaultAddressId,
    countryId: currentUserLoaded?.first?.countryId,
    userName: currentUserLoaded?.first?.userName,
    gender: currentUserLoaded?.first?.gender,
    birthDate: currentUserLoaded?.first?.birthDate,
    role: currentUserLoaded?.first?.role,
    authProvider: currentUserLoaded?.first?.authProvider,
    defaultDeliveryMethod: currentUserLoaded?.first?.defaultDeliveryMethod,
    userType: currentUserLoaded?.first?.userType,
    location: currentUserLoaded?.first?.location,
    avatarUrl: currentUserLoaded?.first?.avatarUrl,
  );
  FFAppState().update(() {});
  return currentUserLoaded!.first;
}

Future advertisementOnClick(
  BuildContext context, {
  required AdvertisingRow? advertisement,
}) async {
  List<CategoriesRow>? advertisedCategory;

  if (advertisement?.adsType == AdvertiseType.Product.name) {
    logFirebaseEvent('AdvertisementOnClick_navigate_to');

    context.pushNamed(
      'ProductDetail',
      queryParameters: {
        'productId': serializeParam(
          advertisement?.productId,
          ParamType.int,
        ),
      }.withoutNulls,
    );
  } else if (advertisement?.adsType == AdvertiseType.Market.name) {
    logFirebaseEvent('AdvertisementOnClick_navigate_to');

    context.pushNamed(
      'StoreFront',
      queryParameters: {
        'marketID': serializeParam(
          advertisement?.marketId,
          ParamType.int,
        ),
      }.withoutNulls,
    );
  } else if (advertisement?.adsType == AdvertiseType.Business.name) {
    logFirebaseEvent('AdvertisementOnClick_navigate_to');

    context.pushNamed(
      'StoreFront',
      queryParameters: {
        'marketID': serializeParam(
          advertisement?.marketId,
          ParamType.int,
        ),
      }.withoutNulls,
    );
  } else if (advertisement?.adsType == AdvertiseType.Category.name) {
    if (advertisement?.categoryId != null) {
      logFirebaseEvent('AdvertisementOnClick_backend_call');
      advertisedCategory = await CategoriesTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          advertisement?.categoryId,
        ),
      );
      logFirebaseEvent('AdvertisementOnClick_navigate_to');

      context.pushNamed(
        'ProductsCategory',
        queryParameters: {
          'categoryId': serializeParam(
            advertisement?.categoryId,
            ParamType.int,
          ),
          'categoryTitle': serializeParam(
            advertisedCategory?.first?.name,
            ParamType.String,
          ),
        }.withoutNulls,
      );
    }
  } else if (advertisement?.adsType == AdvertiseType.External.name) {
    logFirebaseEvent('AdvertisementOnClick_launch_u_r_l');
    await launchURL(advertisement!.websiteUrl!);
  } else if (advertisement?.adsType == AdvertiseType.Brand.name) {
    logFirebaseEvent('AdvertisementOnClick_navigate_to');

    context.pushNamed(
      'StoreFront',
      queryParameters: {
        'marketID': serializeParam(
          advertisement?.marketId,
          ParamType.int,
        ),
      }.withoutNulls,
    );
  }
}

Future likeProduct(
  BuildContext context, {
  required int? productId,
  required int? marketId,
}) async {
  List<ProductsRow>? product;
  List<BusinessesRow>? business;

  if (FFAppState().CurrentUser.isAnon) {
    logFirebaseEvent('LikeProduct_navigate_to');

    context.pushNamed(
      'Signup',
      queryParameters: {
        'showBackButton': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  } else {
    if (FFAppState().UserFavorites.contains(productId)) {
      logFirebaseEvent('LikeProduct_update_app_state');
      FFAppState().removeFromUserFavorites(productId!);
      FFAppState().update(() {});
      logFirebaseEvent('LikeProduct_backend_call');
      await UserFavoritesTable().delete(
        matchingRows: (rows) => rows
            .eq(
              'user_id',
              currentUserUid,
            )
            .eq(
              'product_id',
              productId,
            ),
      );
    } else {
      logFirebaseEvent('LikeProduct_update_app_state');
      FFAppState().addToUserFavorites(productId!);
      FFAppState().update(() {});
      if ((marketId != null) && (marketId != 0)) {
        logFirebaseEvent('LikeProduct_backend_call');
        await UserFavoritesTable().insert({
          'product_id': productId,
          'is_product': true,
          'user_id': currentUserUid,
          'market_id': marketId,
        });
      } else {
        logFirebaseEvent('LikeProduct_backend_call');
        product = await ProductsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            productId,
          ),
        );
        logFirebaseEvent('LikeProduct_backend_call');
        business = await BusinessesTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            product?.first?.businessId,
          ),
        );
        logFirebaseEvent('LikeProduct_backend_call');
        await UserFavoritesTable().insert({
          'product_id': productId,
          'is_product': true,
          'user_id': currentUserUid,
          'market_id': business?.first?.defaultMarketId,
        });
      }
    }
  }
}

Future paymentExecution(
  BuildContext context, {
  required TransactionType? transactionType,
  required String? currencyCode,
  OrdersRow? order,
  required double? paymentAmount,
  required PaymentTypes? paymentMethod,
  int? walletId,
}) async {
  ApiCallResponse? amwalPaymentRequest;

  if (paymentMethod == PaymentTypes.FIB) {
    logFirebaseEvent('PaymentExecution_navigate_to');

    context.pushNamed(
      'FIBPayment',
      queryParameters: {
        'transactionType': serializeParam(
          transactionType,
          ParamType.Enum,
        ),
        'order': serializeParam(
          order,
          ParamType.SupabaseRow,
        ),
        'paymentAmount': serializeParam(
          paymentAmount,
          ParamType.double,
        ),
        'walletId': serializeParam(
          walletId,
          ParamType.int,
        ),
      }.withoutNulls,
    );
  } else if (paymentMethod == PaymentTypes.Amwal) {
    logFirebaseEvent('PaymentExecution_backend_call');
    amwalPaymentRequest = await AmwalSupabaseGroup.startPaymentCall.call(
      paymentType: transactionType?.name,
      amount: paymentAmount,
      currencyUnit: FFAppState().country.currencyCode,
      recordId: transactionType == TransactionType.Order ? order?.id : null,
      addressId: transactionType == TransactionType.Order
          ? order?.userShippingAddressId
          : null,
      returnUrl: transactionType == TransactionType.Order
          ? 'https://api.zenbil.io/functions/v1/amwal-redirect'
          : 'zenbilconsumer://zenbilconsumer.com/paymentConfirmation',
      walletId: transactionType == TransactionType.Topup ? walletId : null,
      jwt: currentJwtToken,
    );

    if ((amwalPaymentRequest?.succeeded ?? true)) {
      if (AmwalSupabaseGroup.startPaymentCall.needRedirect(
        (amwalPaymentRequest?.jsonBody ?? ''),
      )!) {
        logFirebaseEvent('PaymentExecution_launch_u_r_l');
        await launchURL(AmwalSupabaseGroup.startPaymentCall.redirectURL(
          (amwalPaymentRequest?.jsonBody ?? ''),
        )!);
      }
    } else {
      logFirebaseEvent('PaymentExecution_alert_dialog');
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: InfoModalWidget(
              title: 'Request failed!',
              body: 'Please try again.',
              isConfirm: false,
              autoDismiss: true,
            ),
          );
        },
      );
    }
  }
}

Future addAddress(BuildContext context) async {
  String? addressPlaceIdReturned;

  logFirebaseEvent('AddAddress_bottom_sheet');
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    enableDrag: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: MediaQuery.viewInsetsOf(context),
        child: Container(
          height: double.infinity,
          child: AddressReturnPlaceIdWidget(),
        ),
      );
    },
  ).then((value) => addressPlaceIdReturned = value);

  if (addressPlaceIdReturned != null && addressPlaceIdReturned != '') {
    logFirebaseEvent('AddAddress_navigate_to');

    context.pushNamed(
      'AddDomesticAddress',
      queryParameters: {
        'placeId': serializeParam(
          addressPlaceIdReturned,
          ParamType.String,
        ),
      }.withoutNulls,
    );
  }
}
