import '/components/single_receipt/single_receipt_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stats_widget.dart' show StatsWidget;
import 'package:flutter/material.dart';

class StatsModel extends FlutterFlowModel<StatsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for single_receipt dynamic component.
  late FlutterFlowDynamicModels<SingleReceiptModel> singleReceiptModels;

  @override
  void initState(BuildContext context) {
    singleReceiptModels = FlutterFlowDynamicModels(() => SingleReceiptModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    singleReceiptModels.dispose();
  }
}
