// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReceiptItemsStruct extends FFFirebaseStruct {
  ReceiptItemsStruct({
    String? itemName,
    double? price,
    int? nutritionalValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemName = itemName,
        _price = price,
        _nutritionalValue = nutritionalValue,
        super(firestoreUtilData);

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;
  bool hasItemName() => _itemName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "nutritionalValue" field.
  int? _nutritionalValue;
  int get nutritionalValue => _nutritionalValue ?? 0;
  set nutritionalValue(int? val) => _nutritionalValue = val;
  void incrementNutritionalValue(int amount) =>
      _nutritionalValue = nutritionalValue + amount;
  bool hasNutritionalValue() => _nutritionalValue != null;

  static ReceiptItemsStruct fromMap(Map<String, dynamic> data) =>
      ReceiptItemsStruct(
        itemName: data['itemName'] as String?,
        price: castToType<double>(data['price']),
        nutritionalValue: castToType<int>(data['nutritionalValue']),
      );

  static ReceiptItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? ReceiptItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'itemName': _itemName,
        'price': _price,
        'nutritionalValue': _nutritionalValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemName': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'nutritionalValue': serializeParam(
          _nutritionalValue,
          ParamType.int,
        ),
      }.withoutNulls;

  static ReceiptItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReceiptItemsStruct(
        itemName: deserializeParam(
          data['itemName'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        nutritionalValue: deserializeParam(
          data['nutritionalValue'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ReceiptItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReceiptItemsStruct &&
        itemName == other.itemName &&
        price == other.price &&
        nutritionalValue == other.nutritionalValue;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([itemName, price, nutritionalValue]);
}

ReceiptItemsStruct createReceiptItemsStruct({
  String? itemName,
  double? price,
  int? nutritionalValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReceiptItemsStruct(
      itemName: itemName,
      price: price,
      nutritionalValue: nutritionalValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReceiptItemsStruct? updateReceiptItemsStruct(
  ReceiptItemsStruct? receiptItems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    receiptItems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReceiptItemsStructData(
  Map<String, dynamic> firestoreData,
  ReceiptItemsStruct? receiptItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (receiptItems == null) {
    return;
  }
  if (receiptItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && receiptItems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final receiptItemsData =
      getReceiptItemsFirestoreData(receiptItems, forFieldValue);
  final nestedData =
      receiptItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = receiptItems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReceiptItemsFirestoreData(
  ReceiptItemsStruct? receiptItems, [
  bool forFieldValue = false,
]) {
  if (receiptItems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(receiptItems.toMap());

  // Add any Firestore field values
  receiptItems.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReceiptItemsListFirestoreData(
  List<ReceiptItemsStruct>? receiptItemss,
) =>
    receiptItemss?.map((e) => getReceiptItemsFirestoreData(e, true)).toList() ??
    [];
