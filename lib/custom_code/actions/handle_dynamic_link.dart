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

import 'dart:async';

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

Future<dynamic> handleDynamicLink(BuildContext context) async {
  StreamSubscription<Map> streamSubscription =
      FlutterBranchSdk.listSession().listen((data) async {
    if (data.containsKey("+clicked_branch_link") &&
        data["+clicked_branch_link"] == true) {
      if (data.containsKey("marketId")) {
        int marketID = int.parse(data["marketId"]);
        print('Navigating to ProductsStore with marketId: $marketID');
        FFAppState().storeID = marketID;
      }
      if (data.containsKey("marketID") && data.containsKey("productId")) {
        int marketID = int.parse(data["marketID"]);
        int productID = int.parse(data["productId"]);
        FFAppState().storeID = marketID;
        FFAppState().productID = productID;
      }
    }
  }, onError: (error) {
    print('listSession error: ${error.toString()}');
  });
  return {'success': true};
}
