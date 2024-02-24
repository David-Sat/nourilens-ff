import '/components/single_item/single_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_receipt_widget.dart' show ViewReceiptWidget;
import 'package:flutter/material.dart';

class ViewReceiptModel extends FlutterFlowModel<ViewReceiptWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for single_item dynamic component.
  late FlutterFlowDynamicModels<SingleItemModel> singleItemModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    singleItemModels = FlutterFlowDynamicModels(() => SingleItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    singleItemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
