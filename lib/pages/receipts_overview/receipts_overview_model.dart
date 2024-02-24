import '/components/single_receipt/single_receipt_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'receipts_overview_widget.dart' show ReceiptsOverviewWidget;
import 'package:flutter/material.dart';

class ReceiptsOverviewModel extends FlutterFlowModel<ReceiptsOverviewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for single_receipt dynamic component.
  late FlutterFlowDynamicModels<SingleReceiptModel> singleReceiptModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    singleReceiptModels = FlutterFlowDynamicModels(() => SingleReceiptModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    singleReceiptModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
