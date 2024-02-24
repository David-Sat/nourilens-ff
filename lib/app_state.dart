import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<FullReceiptStruct> _receipts = [];
  List<FullReceiptStruct> get receipts => _receipts;
  set receipts(List<FullReceiptStruct> value) {
    _receipts = value;
  }

  void addToReceipts(FullReceiptStruct value) {
    _receipts.add(value);
  }

  void removeFromReceipts(FullReceiptStruct value) {
    _receipts.remove(value);
  }

  void removeAtIndexFromReceipts(int index) {
    _receipts.removeAt(index);
  }

  void updateReceiptsAtIndex(
    int index,
    FullReceiptStruct Function(FullReceiptStruct) updateFn,
  ) {
    _receipts[index] = updateFn(_receipts[index]);
  }

  void insertAtIndexInReceipts(int index, FullReceiptStruct value) {
    _receipts.insert(index, value);
  }

  List<SuggestionStruct> _suggestions = [];
  List<SuggestionStruct> get suggestions => _suggestions;
  set suggestions(List<SuggestionStruct> value) {
    _suggestions = value;
  }

  void addToSuggestions(SuggestionStruct value) {
    _suggestions.add(value);
  }

  void removeFromSuggestions(SuggestionStruct value) {
    _suggestions.remove(value);
  }

  void removeAtIndexFromSuggestions(int index) {
    _suggestions.removeAt(index);
  }

  void updateSuggestionsAtIndex(
    int index,
    SuggestionStruct Function(SuggestionStruct) updateFn,
  ) {
    _suggestions[index] = updateFn(_suggestions[index]);
  }

  void insertAtIndexInSuggestions(int index, SuggestionStruct value) {
    _suggestions.insert(index, value);
  }

  int _numberOfItems = 0;
  int get numberOfItems => _numberOfItems;
  set numberOfItems(int value) {
    _numberOfItems = value;
  }

  int _sumOfItemsNutritionalScore = 0;
  int get sumOfItemsNutritionalScore => _sumOfItemsNutritionalScore;
  set sumOfItemsNutritionalScore(int value) {
    _sumOfItemsNutritionalScore = value;
  }

  int _meanNutritionalScore = 0;
  int get meanNutritionalScore => _meanNutritionalScore;
  set meanNutritionalScore(int value) {
    _meanNutritionalScore = value;
  }
}
