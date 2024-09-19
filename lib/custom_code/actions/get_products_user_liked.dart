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

Future<List<UserFavoritesRow>> getProductsUserLiked(
  String userId,
  bool isProduct,
) async {
  // Add your function code here!
  List<UserFavoritesRow> ret = await UserFavoritesTable().queryRows(
    queryFn: (q) => q.eq('user_id', userId).eq('is_product',
        true), // Assuming 'is_product' is the correct boolean column name
  );
  print("=== USER FAVORITES LOADED ===");
  return ret;
}
