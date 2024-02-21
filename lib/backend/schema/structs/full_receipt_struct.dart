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
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _receiptItems = receiptItems,
        _date = date,
        _total = total,
        _nutritionalValue = nutritionalValue,
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

  static FullReceiptStruct fromMap(Map<String, dynamic> data) =>
      FullReceiptStruct(
        receiptItems: getStructList(
          data['receipt_items'],
          ReceiptItemsStruct.fromMap,
        ),
        date: data['date'] as DateTime?,
        total: castToType<double>(data['total']),
        nutritionalValue: castToType<int>(data['nutritionalValue']),
      );

  static FullReceiptStruct? maybeFromMap(dynamic data) => data is Map
      ? FullReceiptStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'receipt_items': _receiptItems?.map((e) => e.toMap()).toList(),
        'date': _date,
        'total': _total,
        'nutritionalValue': _nutritionalValue,
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
        nutritionalValue == other.nutritionalValue;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([receiptItems, date, total, nutritionalValue]);
}

FullReceiptStruct createFullReceiptStruct({
  DateTime? date,
  double? total,
  int? nutritionalValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FullReceiptStruct(
      date: date,
      total: total,
      nutritionalValue: nutritionalValue,
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
