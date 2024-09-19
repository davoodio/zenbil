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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<dynamic> verifyOtp(String mobileNumber, String token) async {
  try {
    print('phone:' + mobileNumber + '   Pincode:' + token);
    var res = await Supabase.instance.client.auth
        .verifyOTP(token: token, type: OtpType.sms, phone: mobileNumber);
    if (res.user != null) {
      return {'success': true, 'error': ''};
    }
  } catch (e) {
    return {'success': false, 'error': e.toString()};
  }
  return {'success': false, 'error': 'please try again'};
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
