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

Future<dynamic> supabaseSearch(
  String tableName,
  List<String>? fieldsToReturnFromTable,
  List<String> fieldsToSearchIn,
  String keyword,
  int fromRange,
  int toRange,
  bool splitKeywordBySpace,
  String preDefineSearch,
) async {
  // Add your function code here!
  print('test');
  // Add your function code here!
  try {
    int count = 0;
    var columns = '*';
    if (fieldsToReturnFromTable != null && fieldsToReturnFromTable.length > 0) {
      columns = fieldsToReturnFromTable.map((e) => e).join(',');
    }
    var select = Supabase.instance.client.from(tableName).select(columns);
    if (preDefineSearch.isNotEmpty) {
      List<String> otherFields = [];
      if (preDefineSearch.contains(',')) {
        var fSplit = preDefineSearch.split(',');
        for (var r in fSplit) {
          if (r.isEmpty) continue;
          if (otherFields.contains(r.trim())) continue;
          otherFields.add(r);
        }
      } else {
        otherFields.add(preDefineSearch.trim());
      }
      for (var r in otherFields) {
        var splitData = '';
        if (r.contains('>='))
          splitData = '>=';
        else if (r.contains('<='))
          splitData = '<=';
        else if (r.contains('>'))
          splitData = '>';
        else if (r.contains('<'))
          splitData = '<';
        else if (r.contains('!'))
          splitData = '!';
        else if (r.contains('=')) splitData = '=';
        if (splitData == '') continue;
        var splits = r.split(splitData);
        if (splits.length == 2 &&
            splits[0].trim() != '' &&
            splits[1].trim() != '') {
          print(splits);
          var col = splits[0];
          var val = getValue(splits[1]);
          switch (splitData) {
            case '>=':
              select = select.gte(col, val);
              break;
            case '>':
              select = select.gt(col, val);
              break;
            case '<=':
              select = select.lte(col, val);
              break;
            case '<':
              select = select.lt(col, val);
              break;
            case '!':
              select = select.neq(col, val);
              break;
            case '=':
              select = select.eq(col, val);
              break;
          }
        }
      }
    }
    if (keyword.isEmpty || keyword.trim() == '') {
      var ret = await select.range(fromRange, toRange);
      if (ret != null) {
        try {
          count = (ret as List).length;
        } catch (e) {}
      }

      var ret1 = {
        'success': true,
        'error': '',
        'result': getListResult(ret),
        'count': count,
        'method': 1
      };
      print('1');
      print(ret1);
      return ret1;
    }
    // if (fieldsToSearchIn.length == 1) {
    //   var ret = await select
    //       .ilike(fieldsToSearchIn[0], '%' + keyword.replaceAll(' ', '%') + '%')
    //       .range(fromRange, toRange);
    //   if (ret != null) {
    //     try {
    //       count = (ret as List).length;
    //     } catch (e) {}
    //   }
    //   var ret2 = {
    //     'success': true,
    //     'error': '',
    //     'result': ret,
    //     'count': count,
    //     'method': 2
    //   };
    //   print('2 ilike');
    //   print(ret2);
    //   return ret2;
    // }
    List<String> values = [];
    if (splitKeywordBySpace) {
      if (keyword.contains(' ')) {
        var split = keyword.split(' ');
        for (var val in split) {
          if (val.isEmpty) continue;
          if (values.contains(val)) continue;
          values.add(val);
        }
      } else {
        values.add(keyword);
      }
    } else {
      values.add(keyword);
    }
    var orData = '';
    for (var c in fieldsToSearchIn) {
      for (var k in values) {
        if (orData != '') orData = orData + ',';
        var r = k.replaceAll(' ', '%');
        r = "%" + r + "%";
        orData = orData + '$c.ilike.$r';
      }
    }
    var ret = await select.or(orData).range(fromRange, toRange);
    if (ret != null) {
      try {
        count = (ret as List).length;
      } catch (e) {}
    }
    var ret3 = {
      'success': true,
      'error': '',
      'result': getListResult(ret),
      'count': count,
      'method': 3
    };
    print(3);
    print(ret3);
    return ret3;
  } catch (e) {
    print(e.toString());
    return {'success': false, 'error': e.toString(), 'count': 0, 'method': 0};
  }
}

dynamic getValue(String val) {
  if (val.toLowerCase() == 'false' || val.toLowerCase() == 'true')
    return bool.parse(val);
  if (val.contains('..b')) return bool.parse(val.replaceAll('..b', ''));
  if (val.contains('..i')) return int.parse(val.replaceAll('..i', ''));
  return val.replaceAll('..s', '');
}

dynamic getListResult(dynamic prop) {
  try {
    if (prop == null) return prop;
    if (prop is List) {
      List<dynamic> lstRet = [];
      for (var l in prop) {
        lstRet.add(getListResult(l));
      }
      return lstRet;
    }
    var mp = Map<String, dynamic>.from(prop);
    if (mp.keys.length == 0) return;

    Map<String, dynamic> lstCount = {};
    for (var r in mp.keys) {
      if (mp[r] is List) {
        lstCount[r + '_count'] = (mp[r] as List).length;
      }
    }
    for (var k in lstCount.keys) {
      mp[k] = lstCount[k];
    }
    Map<String, dynamic> ret = {};
    for (var r in mp.keys) {
      if (mp[r] is List) {
        ret[r] = getListResult(mp[r]);
      } else {
        ret[r] = mp[r];
      }
    }
    return ret;
  } catch (e) {
    print(e);
    return prop;
  }
}
