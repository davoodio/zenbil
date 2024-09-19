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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<CustomResultStruct> oneSignalLogin(String? userId) async {
  // Add your function code here!
  print('************ oneSignalLogin starting ***************');
  var result = CustomResultStruct();

  try {
    if (userId != null && userId.isNotEmpty) {
      await OneSignal.login(userId);
      result.message = "Logged In";
      result.isSuccess = true;
    } else {
      result.message = "Invalid parameters!";
    }
  } catch (e) {
    print(e);
    result.message = e.toString();
  }

  print('************ oneSignalLogin end ***************');
  return result;
}
