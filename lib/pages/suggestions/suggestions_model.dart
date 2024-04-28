import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_indicator/loading_indicator_widget.dart';
import '/components/single_suggestion/single_suggestion_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'suggestions_widget.dart' show SuggestionsWidget;
import 'package:flutter/material.dart';

class SuggestionsModel extends FlutterFlowModel<SuggestionsWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getRecentItems] action in suggestions widget.
  String? items;
  // Models for single_suggestion dynamic component.
  late FlutterFlowDynamicModels<SingleSuggestionModel> singleSuggestionModels;
  // Stores action output result for [Firestore Query - Query a collection] action in menuItem widget.
  List<FullReceiptRecord>? receiptList;
  // Stores action output result for [Custom Action - getRecentItems] action in menuItem widget.
  String? itemsLow;
  // Stores action output result for [Backend Call - API (suggestions)] action in menuItem widget.
  ApiCallResponse? apiSuggestions;
  // Model for loading_indicator component.
  late LoadingIndicatorModel loadingIndicatorModel;

  @override
  void initState(BuildContext context) {
    singleSuggestionModels =
        FlutterFlowDynamicModels(() => SingleSuggestionModel());
    loadingIndicatorModel = createModel(context, () => LoadingIndicatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    singleSuggestionModels.dispose();
    loadingIndicatorModel.dispose();
  }
}
