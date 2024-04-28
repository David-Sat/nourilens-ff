// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuggestionStruct extends FFFirebaseStruct {
  SuggestionStruct({
    String? prevItem,
    double? prevItemPrice,
    String? newItem,
    double? newItemPrice,
    String? description,
    DateTime? date,
    String? originalString,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prevItem = prevItem,
        _prevItemPrice = prevItemPrice,
        _newItem = newItem,
        _newItemPrice = newItemPrice,
        _description = description,
        _date = date,
        _originalString = originalString,
        super(firestoreUtilData);

  // "prevItem" field.
  String? _prevItem;
  String get prevItem => _prevItem ?? '';
  set prevItem(String? val) => _prevItem = val;
  bool hasPrevItem() => _prevItem != null;

  // "prevItemPrice" field.
  double? _prevItemPrice;
  double get prevItemPrice => _prevItemPrice ?? 0.0;
  set prevItemPrice(double? val) => _prevItemPrice = val;
  void incrementPrevItemPrice(double amount) =>
      _prevItemPrice = prevItemPrice + amount;
  bool hasPrevItemPrice() => _prevItemPrice != null;

  // "newItem" field.
  String? _newItem;
  String get newItem => _newItem ?? '';
  set newItem(String? val) => _newItem = val;
  bool hasNewItem() => _newItem != null;

  // "newItemPrice" field.
  double? _newItemPrice;
  double get newItemPrice => _newItemPrice ?? 0.0;
  set newItemPrice(double? val) => _newItemPrice = val;
  void incrementNewItemPrice(double amount) =>
      _newItemPrice = newItemPrice + amount;
  bool hasNewItemPrice() => _newItemPrice != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "original_string" field.
  String? _originalString;
  String get originalString => _originalString ?? '';
  set originalString(String? val) => _originalString = val;
  bool hasOriginalString() => _originalString != null;

  static SuggestionStruct fromMap(Map<String, dynamic> data) =>
      SuggestionStruct(
        prevItem: data['prevItem'] as String?,
        prevItemPrice: castToType<double>(data['prevItemPrice']),
        newItem: data['newItem'] as String?,
        newItemPrice: castToType<double>(data['newItemPrice']),
        description: data['description'] as String?,
        date: data['date'] as DateTime?,
        originalString: data['original_string'] as String?,
      );

  static SuggestionStruct? maybeFromMap(dynamic data) => data is Map
      ? SuggestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prevItem': _prevItem,
        'prevItemPrice': _prevItemPrice,
        'newItem': _newItem,
        'newItemPrice': _newItemPrice,
        'description': _description,
        'date': _date,
        'original_string': _originalString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prevItem': serializeParam(
          _prevItem,
          ParamType.String,
        ),
        'prevItemPrice': serializeParam(
          _prevItemPrice,
          ParamType.double,
        ),
        'newItem': serializeParam(
          _newItem,
          ParamType.String,
        ),
        'newItemPrice': serializeParam(
          _newItemPrice,
          ParamType.double,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'original_string': serializeParam(
          _originalString,
          ParamType.String,
        ),
      }.withoutNulls;

  static SuggestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SuggestionStruct(
        prevItem: deserializeParam(
          data['prevItem'],
          ParamType.String,
          false,
        ),
        prevItemPrice: deserializeParam(
          data['prevItemPrice'],
          ParamType.double,
          false,
        ),
        newItem: deserializeParam(
          data['newItem'],
          ParamType.String,
          false,
        ),
        newItemPrice: deserializeParam(
          data['newItemPrice'],
          ParamType.double,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        originalString: deserializeParam(
          data['original_string'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SuggestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SuggestionStruct &&
        prevItem == other.prevItem &&
        prevItemPrice == other.prevItemPrice &&
        newItem == other.newItem &&
        newItemPrice == other.newItemPrice &&
        description == other.description &&
        date == other.date &&
        originalString == other.originalString;
  }

  @override
  int get hashCode => const ListEquality().hash([
        prevItem,
        prevItemPrice,
        newItem,
        newItemPrice,
        description,
        date,
        originalString
      ]);
}

SuggestionStruct createSuggestionStruct({
  String? prevItem,
  double? prevItemPrice,
  String? newItem,
  double? newItemPrice,
  String? description,
  DateTime? date,
  String? originalString,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SuggestionStruct(
      prevItem: prevItem,
      prevItemPrice: prevItemPrice,
      newItem: newItem,
      newItemPrice: newItemPrice,
      description: description,
      date: date,
      originalString: originalString,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SuggestionStruct? updateSuggestionStruct(
  SuggestionStruct? suggestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    suggestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSuggestionStructData(
  Map<String, dynamic> firestoreData,
  SuggestionStruct? suggestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (suggestion == null) {
    return;
  }
  if (suggestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && suggestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final suggestionData = getSuggestionFirestoreData(suggestion, forFieldValue);
  final nestedData = suggestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = suggestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSuggestionFirestoreData(
  SuggestionStruct? suggestion, [
  bool forFieldValue = false,
]) {
  if (suggestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(suggestion.toMap());

  // Add any Firestore field values
  suggestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSuggestionListFirestoreData(
  List<SuggestionStruct>? suggestions,
) =>
    suggestions?.map((e) => getSuggestionFirestoreData(e, true)).toList() ?? [];
