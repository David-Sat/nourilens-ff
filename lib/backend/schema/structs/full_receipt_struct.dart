// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullReceiptStruct extends FFFirebaseStruct {
  FullReceiptStruct({
    List<ReceiptItemsStruct>? receiptItems,
    DateTime? date,
    double? total,
    int? nutritionalValue,
    int? numItems,
    int? sumNutritionalValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _receiptItems = receiptItems,
        _date = date,
        _total = total,
        _nutritionalValue = nutritionalValue,
        _numItems = numItems,
        _sumNutritionalValue = sumNutritionalValue,
        super(firestoreUtilData);

  // "receipt_items" field.
  List<ReceiptItemsStruct>? _receiptItems;
  List<ReceiptItemsStruct> get receiptItems => _receiptItems ?? const [];
  set receiptItems(List<ReceiptItemsStruct>? val) => _receiptItems = val;
  void updateReceiptItems(Function(List<ReceiptItemsStruct>) updateFn) =>
      updateFn(_receiptItems ??= []);
  bool hasReceiptItems() => _receiptItems != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "nutritionalValue" field.
  int? _nutritionalValue;
  int get nutritionalValue => _nutritionalValue ?? 0;
  set nutritionalValue(int? val) => _nutritionalValue = val;
  void incrementNutritionalValue(int amount) =>
      _nutritionalValue = nutritionalValue + amount;
  bool hasNutritionalValue() => _nutritionalValue != null;

  // "NumItems" field.
  int? _numItems;
  int get numItems => _numItems ?? 0;
  set numItems(int? val) => _numItems = val;
  void incrementNumItems(int amount) => _numItems = numItems + amount;
  bool hasNumItems() => _numItems != null;

  // "sumNutritionalValue" field.
  int? _sumNutritionalValue;
  int get sumNutritionalValue => _sumNutritionalValue ?? 0;
  set sumNutritionalValue(int? val) => _sumNutritionalValue = val;
  void incrementSumNutritionalValue(int amount) =>
      _sumNutritionalValue = sumNutritionalValue + amount;
  bool hasSumNutritionalValue() => _sumNutritionalValue != null;

  static FullReceiptStruct fromMap(Map<String, dynamic> data) =>
      FullReceiptStruct(
        receiptItems: getStructList(
          data['receipt_items'],
          ReceiptItemsStruct.fromMap,
        ),
        date: data['date'] as DateTime?,
        total: castToType<double>(data['total']),
        nutritionalValue: castToType<int>(data['nutritionalValue']),
        numItems: castToType<int>(data['NumItems']),
        sumNutritionalValue: castToType<int>(data['sumNutritionalValue']),
      );

  static FullReceiptStruct? maybeFromMap(dynamic data) => data is Map
      ? FullReceiptStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'receipt_items': _receiptItems?.map((e) => e.toMap()).toList(),
        'date': _date,
        'total': _total,
        'nutritionalValue': _nutritionalValue,
        'NumItems': _numItems,
        'sumNutritionalValue': _sumNutritionalValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'receipt_items': serializeParam(
          _receiptItems,
          ParamType.DataStruct,
          true,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'nutritionalValue': serializeParam(
          _nutritionalValue,
          ParamType.int,
        ),
        'NumItems': serializeParam(
          _numItems,
          ParamType.int,
        ),
        'sumNutritionalValue': serializeParam(
          _sumNutritionalValue,
          ParamType.int,
        ),
      }.withoutNulls;

  static FullReceiptStruct fromSerializableMap(Map<String, dynamic> data) =>
      FullReceiptStruct(
        receiptItems: deserializeStructParam<ReceiptItemsStruct>(
          data['receipt_items'],
          ParamType.DataStruct,
          true,
          structBuilder: ReceiptItemsStruct.fromSerializableMap,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        nutritionalValue: deserializeParam(
          data['nutritionalValue'],
          ParamType.int,
          false,
        ),
        numItems: deserializeParam(
          data['NumItems'],
          ParamType.int,
          false,
        ),
        sumNutritionalValue: deserializeParam(
          data['sumNutritionalValue'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FullReceiptStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FullReceiptStruct &&
        listEquality.equals(receiptItems, other.receiptItems) &&
        date == other.date &&
        total == other.total &&
        nutritionalValue == other.nutritionalValue &&
        numItems == other.numItems &&
        sumNutritionalValue == other.sumNutritionalValue;
  }

  @override
  int get hashCode => const ListEquality().hash([
        receiptItems,
        date,
        total,
        nutritionalValue,
        numItems,
        sumNutritionalValue
      ]);
}

FullReceiptStruct createFullReceiptStruct({
  DateTime? date,
  double? total,
  int? nutritionalValue,
  int? numItems,
  int? sumNutritionalValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FullReceiptStruct(
      date: date,
      total: total,
      nutritionalValue: nutritionalValue,
      numItems: numItems,
      sumNutritionalValue: sumNutritionalValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FullReceiptStruct? updateFullReceiptStruct(
  FullReceiptStruct? fullReceipt, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fullReceipt
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFullReceiptStructData(
  Map<String, dynamic> firestoreData,
  FullReceiptStruct? fullReceipt,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fullReceipt == null) {
    return;
  }
  if (fullReceipt.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fullReceipt.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fullReceiptData =
      getFullReceiptFirestoreData(fullReceipt, forFieldValue);
  final nestedData =
      fullReceiptData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fullReceipt.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFullReceiptFirestoreData(
  FullReceiptStruct? fullReceipt, [
  bool forFieldValue = false,
]) {
  if (fullReceipt == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fullReceipt.toMap());

  // Add any Firestore field values
  fullReceipt.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFullReceiptListFirestoreData(
  List<FullReceiptStruct>? fullReceipts,
) =>
    fullReceipts?.map((e) => getFullReceiptFirestoreData(e, true)).toList() ??
    [];
