import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SuggestionsRecord extends FirestoreRecord {
  SuggestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "suggestions" field.
  SuggestionStruct? _suggestions;
  SuggestionStruct get suggestions => _suggestions ?? SuggestionStruct();
  bool hasSuggestions() => _suggestions != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _suggestions = SuggestionStruct.maybeFromMap(snapshotData['suggestions']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('suggestions')
          : FirebaseFirestore.instance.collectionGroup('suggestions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('suggestions').doc(id);

  static Stream<SuggestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuggestionsRecord.fromSnapshot(s));

  static Future<SuggestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuggestionsRecord.fromSnapshot(s));

  static SuggestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuggestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuggestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuggestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuggestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuggestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuggestionsRecordData({
  SuggestionStruct? suggestions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'suggestions': SuggestionStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "suggestions" field.
  addSuggestionStructData(firestoreData, suggestions, 'suggestions');

  return firestoreData;
}

class SuggestionsRecordDocumentEquality implements Equality<SuggestionsRecord> {
  const SuggestionsRecordDocumentEquality();

  @override
  bool equals(SuggestionsRecord? e1, SuggestionsRecord? e2) {
    return e1?.suggestions == e2?.suggestions;
  }

  @override
  int hash(SuggestionsRecord? e) => const ListEquality().hash([e?.suggestions]);

  @override
  bool isValidKey(Object? o) => o is SuggestionsRecord;
}
