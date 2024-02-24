// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreSuggestionStruct extends FFFirebaseStruct {
  PreSuggestionStruct({
    String? prevItem,
    double? prevItemPrice,
    String? newItem,
    double? newItemPrice,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prevItem = prevItem,
        _prevItemPrice = prevItemPrice,
        _newItem = newItem,
        _newItemPrice = newItemPrice,
        _description = description,
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

  static PreSuggestionStruct fromMap(Map<String, dynamic> data) =>
      PreSuggestionStruct(
        prevItem: data['prevItem'] as String?,
        prevItemPrice: castToType<double>(data['prevItemPrice']),
        newItem: data['newItem'] as String?,
        newItemPrice: castToType<double>(data['newItemPrice']),
        description: data['description'] as String?,
      );

  static PreSuggestionStruct? maybeFromMap(dynamic data) => data is Map
      ? PreSuggestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prevItem': _prevItem,
        'prevItemPrice': _prevItemPrice,
        'newItem': _newItem,
        'newItemPrice': _newItemPrice,
        'description': _description,
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
      }.withoutNulls;

  static PreSuggestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      PreSuggestionStruct(
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
      );

  @override
  String toString() => 'PreSuggestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PreSuggestionStruct &&
        prevItem == other.prevItem &&
        prevItemPrice == other.prevItemPrice &&
        newItem == other.newItem &&
        newItemPrice == other.newItemPrice &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([prevItem, prevItemPrice, newItem, newItemPrice, description]);
}

PreSuggestionStruct createPreSuggestionStruct({
  String? prevItem,
  double? prevItemPrice,
  String? newItem,
  double? newItemPrice,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PreSuggestionStruct(
      prevItem: prevItem,
      prevItemPrice: prevItemPrice,
      newItem: newItem,
      newItemPrice: newItemPrice,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PreSuggestionStruct? updatePreSuggestionStruct(
  PreSuggestionStruct? preSuggestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    preSuggestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPreSuggestionStructData(
  Map<String, dynamic> firestoreData,
  PreSuggestionStruct? preSuggestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (preSuggestion == null) {
    return;
  }
  if (preSuggestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && preSuggestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final preSuggestionData =
      getPreSuggestionFirestoreData(preSuggestion, forFieldValue);
  final nestedData =
      preSuggestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = preSuggestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPreSuggestionFirestoreData(
  PreSuggestionStruct? preSuggestion, [
  bool forFieldValue = false,
]) {
  if (preSuggestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(preSuggestion.toMap());

  // Add any Firestore field values
  preSuggestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPreSuggestionListFirestoreData(
  List<PreSuggestionStruct>? preSuggestions,
) =>
    preSuggestions
        ?.map((e) => getPreSuggestionFirestoreData(e, true))
        .toList() ??
    [];
