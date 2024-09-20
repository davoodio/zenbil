import '/components/menu_setting_item_widget.dart';
import '/components/nav_bar_delivery/nav_bar_delivery_widget.dart';
import '/components/user_info_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delivery_account_widget.dart' show DeliveryAccountWidget;
import 'package:flutter/material.dart';

class DeliveryAccountModel extends FlutterFlowModel<DeliveryAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserInfoCard component.
  late UserInfoCardModel userInfoCardModel;
  // Model for support.
  late MenuSettingItemModel supportModel;
  // Model for editprofile.
  late MenuSettingItemModel editprofileModel;
  // Model for paymenmethod.
  late MenuSettingItemModel paymenmethodModel;
  // Model for NotifiationSetting.
  late MenuSettingItemModel notifiationSettingModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for Privac.
  late MenuSettingItemModel privacModel;
  // Model for Help.
  late MenuSettingItemModel helpModel;
  // Model for Share.
  late MenuSettingItemModel shareModel1;
  // Model for Share.
  late MenuSettingItemModel shareModel2;
  // Model for logout.
  late MenuSettingItemModel logoutModel;
  // Model for NavBarDelivery component.
  late NavBarDeliveryModel navBarDeliveryModel;

  @override
  void initState(BuildContext context) {
    userInfoCardModel = createModel(context, () => UserInfoCardModel());
    supportModel = createModel(context, () => MenuSettingItemModel());
    editprofileModel = createModel(context, () => MenuSettingItemModel());
    paymenmethodModel = createModel(context, () => MenuSettingItemModel());
    notifiationSettingModel =
        createModel(context, () => MenuSettingItemModel());
    privacModel = createModel(context, () => MenuSettingItemModel());
    helpModel = createModel(context, () => MenuSettingItemModel());
    shareModel1 = createModel(context, () => MenuSettingItemModel());
    shareModel2 = createModel(context, () => MenuSettingItemModel());
    logoutModel = createModel(context, () => MenuSettingItemModel());
    navBarDeliveryModel = createModel(context, () => NavBarDeliveryModel());
  }

  @override
  void dispose() {
    userInfoCardModel.dispose();
    supportModel.dispose();
    editprofileModel.dispose();
    paymenmethodModel.dispose();
    notifiationSettingModel.dispose();
    privacModel.dispose();
    helpModel.dispose();
    shareModel1.dispose();
    shareModel2.dispose();
    logoutModel.dispose();
    navBarDeliveryModel.dispose();
  }
}
