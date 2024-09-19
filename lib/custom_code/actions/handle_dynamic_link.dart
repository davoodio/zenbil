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

Future<void> handleDynamicLink(BuildContext context) async {
  await FlutterBranchSdk.init();
  StreamSubscription<Map> streamSubscription =
      FlutterBranchSdk.listSession().listen((data) {
    if (data.containsKey("+clicked_branch_link") &&
        data["+clicked_branch_link"] == true) {
      print("Branch called! Data: $data");
      // Extract the custom data (marketId) from the Branch link
      if (data.containsKey("marketID")) {
        String marketID = data["marketID"];
        print('Navigating to ProductsStore with marketId: $marketID');
        // Navigate to the ProductsStore page with the marketId
        Navigator.pushNamed(context, '/productStore',
            arguments: {'marketID': marketID});
      }
    }
  }, onError: (error) {
    print('listSession error: ${error.toString()}');
  });
}
