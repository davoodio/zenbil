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

import 'package:translator/translator.dart';
import 'package:devicelocale/devicelocale.dart';

Future<String> translateText(
  String text,
  String? appLanguage,
) async {
  // Add your function code here!
  List? languages = await Devicelocale.preferredLanguages;

  var language = languages?.first.substring(0, 2);

  language = appLanguage;

  String capitalizeOnlyFirstLater(texto) {
    if (texto.trim().isEmpty) return "";
    return "${texto[0].toUpperCase()}${texto.substring(1)}";
  }

  if (appLanguage == 'en') {
    return text;
  } else {
    final translator = GoogleTranslator();
    final translatedText =
        await translator.translate(text, from: 'en', to: language);
    return capitalizeOnlyFirstLater(translatedText.toString());
  }
}
