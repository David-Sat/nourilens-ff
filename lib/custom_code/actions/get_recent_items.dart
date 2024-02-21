// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<String> getRecentItems(
  List<FullReceiptStruct>? receipts,
  int? bounds,
) async {
  final int nutriBoundary = bounds ?? 10;
  if (receipts == null) {
    return '';
  }

  List<ReceiptItemsStruct> eligibleItems = [];

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
    return '';
  }

  final random = Random();
  final randomItem = eligibleItems[random.nextInt(eligibleItems.length)];

  String itemsString = '${randomItem.itemName}: ${randomItem.price}€';

  return itemsString.trim();
}
