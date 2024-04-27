// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<FullReceiptStruct> formatReceipt(
  List<ReceiptItemsStruct>? itemList,
  DateTime? date,
) async {
  double totalPrice = 0;
  int totalNutritionalValue = 0;

  // Check if the item list is not null and has items
  if (itemList != null && itemList.isNotEmpty) {
    for (ReceiptItemsStruct item in itemList) {
      totalPrice += item.price ?? 0; // Assuming price is a nullable double
      totalNutritionalValue += item.nutritionalValue ??
          0; // Assuming nutritionalValue is a nullable int
    }
  }

  int averageNutritionalValue = itemList != null && itemList.isNotEmpty
      ? (totalNutritionalValue ~/ itemList.length)
      : 0;
  FFAppState().update(() {
    FFAppState().numberOfItems += itemList!.length;
  });
  FFAppState().update(() {
    FFAppState().sumOfItemsNutritionalScore += totalNutritionalValue;
  });
  FFAppState().update(() {
    FFAppState().meanNutritionalScore =
        FFAppState().sumOfItemsNutritionalScore ~/ FFAppState().numberOfItems;
  });
  ;

  return FullReceiptStruct(
    receiptItems:
        itemList ?? [], // Use the original list or an empty list if null
    date:
        date ?? DateTime.now(), // Use the provided date or current date if null
    total: totalPrice,
    nutritionalValue: averageNutritionalValue,
  );
}
