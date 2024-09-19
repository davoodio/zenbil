import '/components/anon_user_card_widget.dart';
import '/components/menu_setting_item_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/social_widget.dart';
import '/components/terms_texts_widget.dart';
import '/components/user_info_card_widget.dart';
import '/components/wallet_front_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'setting_widget.dart' show SettingWidget;
import 'package:flutter/material.dart';

class SettingModel extends FlutterFlowModel<SettingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AnonUserCard component.
  late AnonUserCardModel anonUserCardModel;
  // Model for UserInfoCard component.
  late UserInfoCardModel userInfoCardModel;
  // Model for WalletFrontCard component.
  late WalletFrontCardModel walletFrontCardModel;
  // Model for Login_btn.
  late MenuSettingItemModel loginBtnModel;
  // Model for signupBtn.
  late MenuSettingItemModel signupBtnModel;
  // Model for support.
  late MenuSettingItemModel supportModel;
  // Model for editprofile.
  late MenuSettingItemModel editprofileModel;
  // Model for manageaddress.
  late MenuSettingItemModel manageaddressModel1;
  // Model for manageaddress.
  late MenuSettingItemModel manageaddressModel2;
  // Model for paymenmethod.
  late MenuSettingItemModel paymenmethodModel;
  // Model for Shippingmetho.
  late MenuSettingItemModel shippingmethoModel;
  // Model for NotifiationSetting.
  late MenuSettingItemModel notifiationSettingModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for Privac.
  late MenuSettingItemModel privacModel;
  // Model for Help.
  late MenuSettingItemModel helpModel;
  // Model for Share.
  late MenuSettingItemModel shareModel;
  // Models for Social dynamic component.
  late FlutterFlowDynamicModels<SocialModel> socialModels;
  // Model for logout.
  late MenuSettingItemModel logoutModel;
  // Model for TermsTexts component.
  late TermsTextsModel termsTextsModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    anonUserCardModel = createModel(context, () => AnonUserCardModel());
    userInfoCardModel = createModel(context, () => UserInfoCardModel());
    walletFrontCardModel = createModel(context, () => WalletFrontCardModel());
    loginBtnModel = createModel(context, () => MenuSettingItemModel());
    signupBtnModel = createModel(context, () => MenuSettingItemModel());
    supportModel = createModel(context, () => MenuSettingItemModel());
    editprofileModel = createModel(context, () => MenuSettingItemModel());
    manageaddressModel1 = createModel(context, () => MenuSettingItemModel());
    manageaddressModel2 = createModel(context, () => MenuSettingItemModel());
    paymenmethodModel = createModel(context, () => MenuSettingItemModel());
    shippingmethoModel = createModel(context, () => MenuSettingItemModel());
    notifiationSettingModel =
        createModel(context, () => MenuSettingItemModel());
    privacModel = createModel(context, () => MenuSettingItemModel());
    helpModel = createModel(context, () => MenuSettingItemModel());
    shareModel = createModel(context, () => MenuSettingItemModel());
    socialModels = FlutterFlowDynamicModels(() => SocialModel());
    logoutModel = createModel(context, () => MenuSettingItemModel());
    termsTextsModel = createModel(context, () => TermsTextsModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    anonUserCardModel.dispose();
    userInfoCardModel.dispose();
    walletFrontCardModel.dispose();
    loginBtnModel.dispose();
    signupBtnModel.dispose();
    supportModel.dispose();
    editprofileModel.dispose();
    manageaddressModel1.dispose();
    manageaddressModel2.dispose();
    paymenmethodModel.dispose();
    shippingmethoModel.dispose();
    notifiationSettingModel.dispose();
    privacModel.dispose();
    helpModel.dispose();
    shareModel.dispose();
    socialModels.dispose();
    logoutModel.dispose();
    termsTextsModel.dispose();
    navBarModel.dispose();
  }
}
