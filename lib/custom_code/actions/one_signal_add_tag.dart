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

Future<CustomResultStruct> oneSignalAddTag(
  String? userId,
  String tagName,
  String tagValue,
) async {
  // Add your function code here!
  print('************ oneSignalAddTag starting ***************');
  //

  var result = CustomResultStruct();
  try {
    if ((userId != null) && (tagName.isNotEmpty && tagValue.isNotEmpty)) {
      await OneSignal.login(userId);
      OneSignal.User.addTagWithKey(tagName, tagValue).then(
        (value) => print("TAG $tagValue added!"),
      );

      result.message = "TAG $tagValue added!";
      result.isSuccess = true;
    } else {
      result.message = "Invalid parameters!";
    }
  } catch (e) {
    print(e);
    result.message = e.toString();
  }

  print('************ oneSignalAddTag end ***************');
  return result;
}
