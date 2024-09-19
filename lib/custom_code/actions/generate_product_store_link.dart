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

Future<String> generateProductStoreLink(int marketId) async {
// Set parameters for the Branch link

  BranchUniversalObject buo = BranchUniversalObject(
    canonicalIdentifier: 'productsStore/$marketId',
    //canonicalUrl: '',
    title: 'Check out this Product Store!',
    imageUrl:
        'https://raw.githubusercontent.com/RodrigoSMarques/flutter_branch_sdk/master/assets/branch_logo_qrcode.jpeg',
    contentDescription: 'Flutter Branch Description',
    contentMetadata: BranchContentMetaData()
      ..addCustomMetadata('marketId', marketId),
  );

  BranchLinkProperties lp = BranchLinkProperties(
    //alias: 'flutterplugin', //define link url,
    channel: 'app',
    feature: 'sharing',
    stage: 'new share',
  );
  lp.addControlParam('url', 'http://www.google.com');
  lp.addControlParam('url2', 'http://flutter.dev');

  // Generate the Branch link
  BranchResponse response =
      await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);

  if (response.success) {
    // The generated link
    String branchLink = response.result;

    // Now share the link using your preferred method
    return branchLink;
    // Use a sharing plugin, for example:
    // Share.share(branchLink);
  } else {
    return "";
  }
}
