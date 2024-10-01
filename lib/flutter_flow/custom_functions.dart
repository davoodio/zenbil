import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String stringToImagePath(String string) {
  return string;
}

int incrementDecrementNumber(
  int number,
  int incrementNumber,
) {
  return number += incrementNumber;
}

double calculateOrderGroupTotalInCart(
  List<CartProductStruct> cartProducts,
  int businessId,
) {
  double sum = 0;
  var orderGroupCartProducts =
      cartProducts.where((j) => j.businessId == businessId).toList();

  for (var i in orderGroupCartProducts) {
    double tmp = i.discountedPrice * i.quantity;
    sum += tmp;
  }
  return sum;
}

String stringToVideoPath(String url) {
  return url;
}

LatLng convertStringToLatlang(String stringLatlangValue) {
  List<String> parts = stringLatlangValue.split(',');
  double latitude = double.parse(parts[0]);
  double longitude = double.parse(parts[1]);
  return LatLng(latitude, longitude);
}

String stringToAudioPath(String url) {
  return url;
}

List<String> textSeparatorToList(
  String text,
  String separatorCharacter,
) {
  return text.split(separatorCharacter).map((item) => item.trim()).toList();
}

double calculateCartTotalPrice(List<CartProductStruct> cartProducts) {
  double sum = 0;
  for (var i in cartProducts) {
    double tmp = i.discountedPrice * i.quantity;

    sum += tmp;
  }
  return sum;
}

double calculateDiscountedPriceWithQuantity(
  double price,
  int quantity,
  double discount,
) {
  return (price * quantity) * (1 - discount / 100);
}

int sortReverse(int number) {
  return 100000 - number;
}

List<ViewProductsFilterByCategoryRow> uniquesFromProductsCategoryView(
    List<ViewProductsFilterByCategoryRow>? productsFilterByCategory) {
  if (productsFilterByCategory == null || productsFilterByCategory.isEmpty) {
    return [];
  }

  // Using a Set to track unique product IDs
  var uniqueProductIds = Set<int>();
  List<ViewProductsFilterByCategoryRow> uniqueRows = [];

  for (var row in productsFilterByCategory) {
    // Ensure productId is not null before adding
    if (row.productId != null && !uniqueProductIds.contains(row.productId)) {
      uniqueRows.add(row);
      uniqueProductIds.add(row
          .productId!); // Use the ! operator to assert that the value is not null
    }
  }
  return uniqueRows;
}

List<int> uniqueIDs(List<int> inputList) {
  return inputList.toSet().toList();
}

List<String> convertSingleStringIntoListString(String singleString) {
  return [singleString];
}

String returnEnumRoleToString(Roles roleEnum) {
  return roleEnum.toString();
}

double? lngFromLocation(LatLng? location) {
  if (location != null) {
    return double.parse(location.longitude.toString());
  } else {
    return null;
  }
}

String convertLatlangToString(LatLng latlangValue) {
  return '${latlangValue.latitude},${latlangValue.longitude}';
}

List<int> generateRandonListOfNumbers(int numberOfItems) {
  math.Random random = math.Random();

  List<int> randomNumbers = List.generate(
      numberOfItems,
      (index) =>
          random.nextInt(100)); // Generate random numbers between 0 and 99
  return randomNumbers;
}

dynamic convertStringToJSON(String string1) {
  return string1;
}

double? stringToDouble(String? string1) {
  if (string1 != null) {
    return double.parse(string1);
  }
}

dynamic getItemAtIndexOfADynamicList(
  List<dynamic> list1,
  int index,
) {
  return list1[index];
}

String applyCorrectNumberFormatting(
  double value,
  String currencyCode,
  bool? useSymbol,
  bool? showCurrency,
) {
  NumberFormat formatter;

  if (useSymbol == null) {
    useSymbol = false;
  }

  if (showCurrency == null) {
    showCurrency = true;
  }

  if (!showCurrency) {
    switch (currencyCode) {
      case "IQD":
        formatter = NumberFormat.currency(
          locale: 'ar_IQ',
          symbol: '',
          decimalDigits: 0,
        );
        break;
      case "JPY":
        formatter = NumberFormat.currency(
          locale: 'ja_JP',
          symbol: '',
          decimalDigits: 0,
        );
        break;
      case "USD":
        formatter = NumberFormat.currency(
          locale: 'en_US',
          symbol: '',
          decimalDigits: 2,
        );
        break;
      case "EUR":
        formatter = NumberFormat.currency(
          locale: 'de_DE',
          symbol: '',
          decimalDigits: 2,
        );
        break;
      case "GBP":
        formatter = NumberFormat.currency(
          locale: 'en_GB',
          symbol: '',
          decimalDigits: 2,
        );
        break;
      case "TL":
        formatter = NumberFormat.currency(
          locale: 'tr_TR',
          symbol: '',
          decimalDigits: 2,
        );
        break;
      case "INR":
        formatter = NumberFormat.currency(
          locale: 'en_IN',
          symbol: '',
          decimalDigits: 2,
        );
        break;
      // Add more currency codes as needed
      default:
        formatter = NumberFormat.currency(
          symbol: '',
          decimalDigits: 2,
        ); // Default format
        break;
    }
  } else {
    switch (currencyCode) {
      case "IQD":
        formatter = NumberFormat.currency(
          locale: 'ar_IQ',
          symbol: useSymbol ? 'د.ع' : 'IQD',
          decimalDigits: 0,
        );
        break;
      case "JPY":
        formatter = NumberFormat.currency(
          locale: 'ja_JP',
          symbol: useSymbol ? '¥' : 'JPY',
          decimalDigits: 0,
        );
        break;
      case "USD":
        formatter = NumberFormat.currency(
          locale: 'en_US',
          symbol: useSymbol ? '\$' : 'USD',
          decimalDigits: 2,
        );
        break;
      case "EUR":
        formatter = NumberFormat.currency(
          locale: 'de_DE',
          symbol: useSymbol ? '€' : 'EUR',
          decimalDigits: 2,
        );
        break;
      case "GBP":
        formatter = NumberFormat.currency(
          locale: 'en_GB',
          symbol: useSymbol ? '£' : 'GBP',
          decimalDigits: 2,
        );
        break;
      case "TL":
        formatter = NumberFormat.currency(
          locale: 'tr_TR',
          symbol: useSymbol ? '₺' : 'TL',
          decimalDigits: 2,
        );
        break;
      case "INR":
        formatter = NumberFormat.currency(
          locale: 'en_IN',
          symbol: useSymbol ? '₹' : 'INR',
          decimalDigits: 2,
        );
        break;
      // Add more currency codes as needed
      default:
        formatter = NumberFormat.currency(
          symbol: useSymbol ? '' : currencyCode,
          decimalDigits: 2,
        ); // Default format
        break;
    }
  }

  return formatter.format(value);
}

List<dynamic> returnEmptyJSONList() {
  return [];
}

DateTime getCurrentTimeWithTimeZone00() {
  DateTime now = DateTime.now().toUtc();
  return now;
}

List<String> uniqueStrings(List<String> inputList) {
  return inputList.toSet().toList();
}

bool stringListContainsItem(
  List<String> list1,
  String item1,
) {
  return list1.contains(item1);
}

dynamic returnJsonWithASpecificKeyValue(
  List<dynamic> jsonList1,
  String valueName,
  String keyName,
) {
  var value = {};

  for (var i = 0; i < jsonList1.length; i++) {
    if (jsonList1[i]['$keyName'] == valueName) {
      value = jsonList1[i];
    }
  }

  return value;
}

double calculateDeliveryTotalOnCheckout(
    List<DeliveryOrdersStruct> deliveryOrders) {
  double sum = 0;
  for (var i in deliveryOrders) {
    double tmp = i.selectedOptionPrice;

    sum += tmp;
  }
  return sum;
}

double? latFromLocation(LatLng? location) {
  if (location != null) {
    return double.parse(location.latitude.toString());
  } else {
    return null;
  }
}

double roundToNearestDouble(dynamic number) {
  if (number is int) {
    // Convert the int to a double directly
    return number.toDouble();
  } else if (number is double) {
    // Round the double to the nearest value
    return number.roundToDouble();
  } else {
    throw ArgumentError('Input must be a number (int or double).');
  }
}

double getDoubleValue(dynamic value) {
  if (value is int) {
    return value.toDouble(); // Convert int to double
  } else if (value is double) {
    return value; // Already a double, return as is
  } else {
    throw ArgumentError('Value must be an integer or double.');
  }
}

bool emailValidation(String? email) {
// Check if email is null or empty
  if (email == null || email.isEmpty) {
    return true;
  }

  // Regular expression for validating an email address
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Return true if the email matches the pattern, otherwise false
  return emailRegExp.hasMatch(email);
}

bool isValueInteger(dynamic value) {
  if (value != null && value is int) {
    return true;
  }
  return false;
}

int findIndexOfDeliveryOrderForAnOrderGroupId(
  List<DeliveryOrdersStruct> list,
  int id,
) {
  return list.indexWhere((element) => element.orderGroupId == id);
}

String resizeImageForGivenWidthAndHeight(
  String imageURL,
  double width,
  double height,
) {
  String updatedUrl = imageURL.replaceFirst('/object/', '/render/image/');
  updatedUrl += '?width=$width&height=$height&resize=contain';

  return updatedUrl;
}
