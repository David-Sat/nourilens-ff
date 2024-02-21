import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReceiptsRecord extends FirestoreRecord {
  ReceiptsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "receipt_items" field.
  List<ReceiptItemsStruct>? _receiptItems;
  List<ReceiptItemsStruct> get receiptItems => _receiptItems ?? const [];
  bool hasReceiptItems() => _receiptItems != null;

  // "receipt" field.
  FullReceiptStruct? _receipt;
  FullReceiptStruct get receipt => _receipt ?? FullReceiptStruct();
  bool hasReceipt() => _receipt != null;

  // "avg_nutri_value" field.
  int? _avgNutriValue;
  int get avgNutriValue => _avgNutriValue ?? 0;
  bool hasAvgNutriValue() => _avgNutriValue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _total = castToType<double>(snapshotData['total']);
    _receiptItems = getStructList(
      snapshotData['receipt_items'],
      ReceiptItemsStruct.fromMap,
    );
    _receipt = FullReceiptStruct.maybeFromMap(snapshotData['receipt']);
    _avgNutriValue = castToType<int>(snapshotData['avg_nutri_value']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('receipts')
          : FirebaseFirestore.instance.collectionGroup('receipts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('receipts').doc(id);

  static Stream<ReceiptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReceiptsRecord.fromSnapshot(s));

  static Future<ReceiptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReceiptsRecord.fromSnapshot(s));

  static ReceiptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReceiptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReceiptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReceiptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReceiptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReceiptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReceiptsRecordData({
  DateTime? date,
  double? total,
  FullReceiptStruct? receipt,
  int? avgNutriValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'total': total,
      'receipt': FullReceiptStruct().toMap(),
      'avg_nutri_value': avgNutriValue,
    }.withoutNulls,
  );

  // Handle nested data for "receipt" field.
  addFullReceiptStructData(firestoreData, receipt, 'receipt');

  return firestoreData;
}

class ReceiptsRecordDocumentEquality implements Equality<ReceiptsRecord> {
  const ReceiptsRecordDocumentEquality();

  @override
  bool equals(ReceiptsRecord? e1, ReceiptsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.total == e2?.total &&
        listEquality.equals(e1?.receiptItems, e2?.receiptItems) &&
        e1?.receipt == e2?.receipt &&
        e1?.avgNutriValue == e2?.avgNutriValue;
  }

  @override
  int hash(ReceiptsRecord? e) => const ListEquality()
      .hash([e?.date, e?.total, e?.receiptItems, e?.receipt, e?.avgNutriValue]);

  @override
  bool isValidKey(Object? o) => o is ReceiptsRecord;
}
