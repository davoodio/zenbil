// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<CustomResultStruct> oneSignalUpdateUserInfo(
  String? userId,
  String? emailAddress,
  String? phoneNumber,
  String? language,
  String? userAlias,
) async {
  // Add your function code here!
  print('************ oneSignalUpdateUserInfo starting ***************');
  var result = CustomResultStruct();

  try {
    if (userId != null) {
      await OneSignal.login(userId);

      if (emailAddress != null && emailAddress.isNotEmpty) {
        OneSignal.User.addEmail(emailAddress);
      }

      if (userAlias != null && userAlias.isNotEmpty) {
        OneSignal.User.addAlias(userAlias, userId);
      }

      if (phoneNumber != null && phoneNumber.isNotEmpty) {
        OneSignal.User.addSms(phoneNumber);
      }

      if (language != null && language.isNotEmpty) {
        OneSignal.User.setLanguage(language);
      }

      result.message = "User info updated.";
      result.isSuccess = true;
    } else {
      result.message = "Invalid parameters!";
    }
  } catch (e) {
    print(e);
    result.message = e.toString();
  }

  print('************ oneSignalUpdateUserInfo end ***************');
  return result;
}
