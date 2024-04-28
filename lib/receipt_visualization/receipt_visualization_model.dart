import '/flutter_flow/flutter_flow_util.dart';
import 'receipt_visualization_widget.dart' show ReceiptVisualizationWidget;
import 'package:flutter/material.dart';

class ReceiptVisualizationModel
    extends FlutterFlowModel<ReceiptVisualizationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
