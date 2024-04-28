import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? listAverage(List<FullReceiptStruct>? receipts) {
  int suma = 0;
  int contador = 0;

  if (receipts != null && receipts.isNotEmpty) {
    for (FullReceiptStruct receipt in receipts) {
      for (ReceiptItemsStruct item in receipt.receiptItems) {
        suma += item.nutritionalValue;
        contador += 1;
      }
    }
    return (suma / contador) / 10;
  } else {
    return 4.0 / 10;
  }
}

double listAverageReceipts(List<ReceiptItemsStruct>? receipt) {
  int suma = 0;
  int contador = 0;

  if (receipt != null && receipt.isNotEmpty) {
    for (ReceiptItemsStruct item in receipt) {
      suma += item.nutritionalValue;
      contador += 1;
    }
    return (suma / contador) / 10;
  } else {
    return 4.0 / 10;
  }
}
