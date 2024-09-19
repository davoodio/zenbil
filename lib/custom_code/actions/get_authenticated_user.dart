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

Future<UsersRow?> getAuthenticatedUser(bool forceGet) async {
  // Add your function code here!
  if (Supabase.instance.client.auth.currentUser == null) {
    CacheRepository.instance.currentUserCached = null;
    return null;
  }
  if (forceGet == false && CacheRepository.instance.currentUserCached != null) {
    return CacheRepository.instance.currentUserCached;
  }
  var users = await UsersTable().queryRows(
      queryFn: (q) =>
          q.eq('id', Supabase.instance.client.auth.currentUser!.id));
  if (users.isNotEmpty) {
    CacheRepository.instance.currentUserCached = users[0];
  }
  return CacheRepository.instance.currentUserCached;
}

class CacheRepository {
  CacheRepository._();
  static final _instance = CacheRepository._();
  static CacheRepository get instance => _instance;
  UsersRow? currentUserCached;
}
