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

Future<String> getUserAuthProvider() async {
  // Add your function code here!

  final user = Supabase.instance.client.auth.currentUser;
  if (user != null) {
    // Use the null-aware operator to access 'identities' and check if it's not empty.
    if (user.identities?.isNotEmpty ?? false) {
      final identity = user.identities!
          .first; // The null-assertion operator can be used after the null check.
      if (identity.provider == 'phone') {
        print('Phone Provider');
        return 'phone';
      } else if (identity.provider == 'email') {
        print('Email Provider');
        return 'email';
      }
    }
  }
  print('Unknown Provider');
  return 'unknown';
}
