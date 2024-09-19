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

Future<dynamic> userAnonymousLogin(
  String anonUserEmail,
  String anonUserPass,
) async {
  // Add your function code here!
  try {
    var rt = await Supabase.instance.client.auth
        .signInWithPassword(password: anonUserPass, email: anonUserEmail);
    return {'success': true, 'error': ''};
  } catch (e) {
    return {'success': false, 'error': e.toString()};
  }
}
