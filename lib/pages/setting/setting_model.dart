import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/anon_user_card_widget.dart';
import '/components/info_modal_widget.dart';
import '/components/menu_setting_item_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/social_widget.dart';
import '/components/terms_texts_widget.dart';
import '/components/user_info_card_widget.dart';
import '/components/wallet_front_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'setting_widget.dart' show SettingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
  late MenuSettingItemModel logoutModel1;
  // Stores action output result for [Bottom Sheet - InfoModal] action in logout widget.
  bool? deleteAccountConfirm;
  // Model for logout.
  late MenuSettingItemModel logoutModel2;
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
    logoutModel1 = createModel(context, () => MenuSettingItemModel());
    logoutModel2 = createModel(context, () => MenuSettingItemModel());
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
    logoutModel1.dispose();
    logoutModel2.dispose();
    termsTextsModel.dispose();
    navBarModel.dispose();
  }
}
