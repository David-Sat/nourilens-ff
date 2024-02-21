import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FullReceiptRecord extends FirestoreRecord {
  FullReceiptRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "receipt" field.
  FullReceiptStruct? _receipt;
  FullReceiptStruct get receipt => _receipt ?? FullReceiptStruct();
  bool hasReceipt() => _receipt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _receipt = FullReceiptStruct.maybeFromMap(snapshotData['receipt']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('full_receipt')
          : FirebaseFirestore.instance.collectionGroup('full_receipt');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('full_receipt').doc(id);

  static Stream<FullReceiptRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FullReceiptRecord.fromSnapshot(s));

  static Future<FullReceiptRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FullReceiptRecord.fromSnapshot(s));

  static FullReceiptRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FullReceiptRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FullReceiptRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FullReceiptRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FullReceiptRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FullReceiptRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFullReceiptRecordData({
  FullReceiptStruct? receipt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'receipt': FullReceiptStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "receipt" field.
  addFullReceiptStructData(firestoreData, receipt, 'receipt');

  return firestoreData;
}

class FullReceiptRecordDocumentEquality implements Equality<FullReceiptRecord> {
  const FullReceiptRecordDocumentEquality();

  @override
  bool equals(FullReceiptRecord? e1, FullReceiptRecord? e2) {
    return e1?.receipt == e2?.receipt;
  }

  @override
  int hash(FullReceiptRecord? e) => const ListEquality().hash([e?.receipt]);

  @override
  bool isValidKey(Object? o) => o is FullReceiptRecord;
}
