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

Future<List<ViewProductsCategoriesRow>> getProductsList(
    String languageCode,
    String? productName,
    int? brandId,
    int? specialCategoryId,
    String? subCategoryName,
    double? fromPrice,
    double? toPrice,
    bool? onlyHasInventory) async {
  ViewProductsCategoriesTable tbl = ViewProductsCategoriesTable();
  return tbl.queryRows(queryFn: (q) {
    q = q.eq('language_code', languageCode);
    if (productName != null && productName != '') {
      q = q.ilike('name', '%$productName%');
    }
    if (brandId != null && brandId != 0) q = q.eq('product_brand_id', brandId);
    if (subCategoryName != null && subCategoryName != '') {
      q = q.ilike('sub_category_name', '%$subCategoryName%');
    }
    if (fromPrice != null && fromPrice > 0) q = q.gte('price', fromPrice);
    if (toPrice != null && toPrice > 0) q = q.lte('price', toPrice);
    if (onlyHasInventory != null && onlyHasInventory) {
      q = q.gte('calculated_inventory', 0);
    }
    if (specialCategoryId != null && specialCategoryId != 0) {
      q = q.eq('sub_category_id', specialCategoryId);
    }
    return q;
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
