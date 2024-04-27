import '/components/nutrivalue/nutrivalue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_receipt_widget.dart' show SingleReceiptWidget;
import 'package:flutter/material.dart';

class SingleReceiptModel extends FlutterFlowModel<SingleReceiptWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for nutrivalue component.
  late NutrivalueModel nutrivalueModel;

  @override
  void initState(BuildContext context) {
    nutrivalueModel = createModel(context, () => NutrivalueModel());
  }

  @override
  void dispose() {
    nutrivalueModel.dispose();
  }
}
