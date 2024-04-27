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

import 'dart:math';

Future<String> getRecentItems(
  List<FullReceiptStruct>? receipts,
  int? bounds,
  List<SuggestionStruct>? suggestions,
) async {
  debugPrint("Entering getRecentItems");
  final int nutriBoundary = bounds ?? 10;
  if (receipts == null) {
    debugPrint("No receipts");
    return '';
  }

  debugPrint(suggestions.toString());
  List<ReceiptItemsStruct> eligibleItems = [];

  // Collect eligible items based on nutritional value and price being non-null
  for (FullReceiptStruct receipt in receipts) {
    if (receipt.receiptItems != null) {
      for (ReceiptItemsStruct item in receipt.receiptItems!) {
        if (item.price != null && item.nutritionalValue! <= nutriBoundary) {
          eligibleItems.add(item);
        }
      }
    }
  }

  if (eligibleItems.isEmpty) {
    debugPrint("eligibleItems.isEmpty");
    return '';
  }

  // Create a set to check against existing suggestions
  Set<String> existingSuggestions = {};
  if (suggestions != null) {
    for (SuggestionStruct suggestion in suggestions) {
      existingSuggestions.add(suggestion.originalString);
    }
  }

  debugPrint("Test");

  for (String sugg in existingSuggestions) {
    debugPrint(sugg);
  }

  // If no suggestions exist, simply return the first eligible item
  if (existingSuggestions.isEmpty) {
    final firstItem = eligibleItems.first;
    return '${firstItem.itemName}: ${firstItem.price}€'.trim();
  }

  // Find the first new eligible item not already suggested
  for (ReceiptItemsStruct item in eligibleItems) {
    String itemsString = '${item.itemName}: ${item.price}€';
    if (!existingSuggestions.contains(itemsString)) {
      return itemsString.trim();
    }
  }

  return '';
}
